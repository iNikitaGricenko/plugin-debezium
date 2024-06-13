package io.kestra.plugin.debezium.cassandra;

import io.kestra.core.models.annotations.Example;
import io.kestra.core.models.annotations.Plugin;
import io.kestra.core.models.conditions.ConditionContext;
import io.kestra.core.models.executions.Execution;
import io.kestra.core.models.triggers.TriggerContext;
import io.kestra.core.models.triggers.TriggerService;
import io.kestra.plugin.debezium.AbstractDebeziumInterface;
import io.kestra.plugin.debezium.AbstractDebeziumRealtimeTrigger;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import lombok.experimental.SuperBuilder;
import org.reactivestreams.Publisher;
import reactor.core.publisher.Flux;

@SuperBuilder
@ToString
@EqualsAndHashCode
@Getter
@NoArgsConstructor
@Schema(
    title = "Consume a message in real-time from a Cassandra database via change data capture and create one execution per row.",
    description = "If you would like to consume multiple messages processed within a given time frame and process them in batch, you can use the [io.kestra.plugin.debezium.casandra.Trigger](https://kestra.io/plugins/plugin-debezium/triggers/io.kestra.plugin.debezium.cassandra.trigger) instead."
)
@Plugin(
    examples = {
        @Example(
            title = "Consume a message from a Cassandra database via change data capture in real-time.",
            full = true,
            code = {
                "serverId: 123456789",
                "hostname: 127.0.0.1",
                "port: 9042",
                "username: cassandra_user",
                "password: cassandra_passwd"
            }
        )
    }
)
public class RealtimeTrigger extends AbstractDebeziumRealtimeTrigger implements CassandraInterface, AbstractDebeziumInterface {
    @Builder.Default
    private SnapshotMode snapshotMode = SnapshotMode.INITIAL;

    private String serverId;

    @Override
    public Publisher<Execution> evaluate(ConditionContext conditionContext, TriggerContext context) throws Exception {
        Capture task = Capture.builder()
            .id(this.id)
            .type(Capture.class.getName())
            .format(this.format)
            .deleted(this.deleted)
            .deletedFieldName(this.deletedFieldName)
            .key(this.key)
            .metadata(this.metadata)
            .metadataFieldName(this.metadataFieldName)
            .splitTable(this.splitTable)
            .ignoreDdl(this.ignoreDdl)
            .hostname(this.hostname)
            .port(this.port)
            .username(this.username)
            .password(this.password)
            .includedDatabases(this.includedDatabases)
            .excludedDatabases(this.excludedDatabases)
            .includedTables(this.includedTables)
            .excludedTables(this.excludedTables)
            .includedColumns(this.includedColumns)
            .excludedColumns(this.excludedColumns)
            .properties(this.properties)
            .stateName(this.stateName)
            .snapshotMode(this.snapshotMode)
            .build();

        return Flux.from(publisher(task, conditionContext.getRunContext()))
            .map(output -> TriggerService.generateRealtimeExecution(this, context, output));
    }
}
