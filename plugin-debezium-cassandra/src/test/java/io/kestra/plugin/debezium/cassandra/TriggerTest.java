package io.kestra.plugin.debezium.cassandra;

import io.kestra.core.models.executions.Execution;
import io.kestra.core.queues.QueueFactoryInterface;
import io.kestra.core.queues.QueueInterface;
import io.kestra.core.repositories.LocalFlowRepositoryLoader;
import io.kestra.core.runners.FlowListeners;
import io.kestra.core.runners.Worker;
import io.kestra.core.schedulers.AbstractScheduler;
import io.kestra.core.schedulers.DefaultScheduler;
import io.kestra.core.schedulers.SchedulerTriggerStateInterface;
import io.kestra.core.utils.IdUtils;
import io.kestra.plugin.debezium.AbstractDebeziumTest;
import io.micronaut.context.ApplicationContext;
import io.micronaut.test.extensions.junit5.annotation.MicronautTest;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import org.junit.jupiter.api.Test;

import java.util.Objects;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.greaterThanOrEqualTo;
import static org.hamcrest.Matchers.is;

@MicronautTest
class TriggerTest extends AbstractDebeziumTest {
    @Inject
    private ApplicationContext applicationContext;

    @Inject
    private SchedulerTriggerStateInterface triggerState;

    @Inject
    private FlowListeners flowListenersService;

    @Inject
    @Named(QueueFactoryInterface.EXECUTION_NAMED)
    private QueueInterface<Execution> executionQueue;

    @Inject
    protected LocalFlowRepositoryLoader repositoryLoader;

    @Override
    protected String getUrl() {
        return "jdbc:mysql://127.0.0.1:63306/kestra";
    }

    @Override
    protected String getUsername() {
        return "root";
    }

    @Override
    protected String getPassword() {
        return "mysql_passwd";
    }

    @Test
    void flow() throws Exception {
        // init database
        executeSqlScript("scripts/mysql.sql");

        // mock flow listeners
        CountDownLatch queueCount = new CountDownLatch(1);

        // scheduler
        try (
            AbstractScheduler scheduler = new DefaultScheduler(
                this.applicationContext,
                this.flowListenersService,
                this.triggerState
            );
            Worker worker = applicationContext.createBean(Worker.class, IdUtils.create(), 8, null);
        ) {
            AtomicReference<Execution> last = new AtomicReference<>();

            // wait for execution
            executionQueue.receive(TriggerTest.class, execution -> {
                last.set(execution.getLeft());

                queueCount.countDown();
                assertThat(execution.getLeft().getFlowId(), is("trigger"));
            });

            worker.run();
            scheduler.run();

            repositoryLoader.load(Objects.requireNonNull(TriggerTest.class.getClassLoader().getResource("flows/trigger.yaml")));

            queueCount.await(15, TimeUnit.SECONDS);

            Integer trigger = (Integer) last.get().getTrigger().getVariables().get("size");

            assertThat(trigger, greaterThanOrEqualTo(5));
        }
    }
}
