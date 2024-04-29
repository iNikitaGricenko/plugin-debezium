package io.kestra.plugin.debezium.postgres;

import io.debezium.connector.postgresql.PostgresConnector;
import io.kestra.core.models.annotations.Example;
import io.kestra.core.models.annotations.Plugin;
import io.kestra.core.runners.RunContext;
import io.kestra.plugin.debezium.AbstractDebeziumTask;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;
import lombok.experimental.SuperBuilder;

import java.nio.file.Path;
import java.util.Properties;

@SuperBuilder
@ToString
@EqualsAndHashCode
@Getter
@NoArgsConstructor
@Schema(
    title = "Wait for change data capture event on PostgreSQL server."
)
@Plugin(
    examples = {
        @Example(
            code = {
                "hostname: 127.0.0.1",
                "port: \"5432\"",
                "username: psql_user",
                "password: psql_passwd",
                "maxRecords: 100",
                "database: my_database",
                "pluginName: PGOUTPUT",
                "snapshotMode: ALWAYS"
            }
        )
    }
)
public class Capture extends AbstractDebeziumTask implements PostgresInterface {
    protected String database;

    @Builder.Default
    protected PluginName pluginName = PluginName.PGOUTPUT;

    @Builder.Default
    protected String slotName = "kestra";

    @Builder.Default
    protected String publicationName = "kestra_publication";

    @Builder.Default
    protected PostgresInterface.SslMode sslMode = SslMode.DISABLE;

    protected String sslRootCert;

    protected String sslCert;

    protected String sslKey;

    protected String sslKeyPassword;

    @Builder.Default
    private Capture.SnapshotMode snapshotMode = Capture.SnapshotMode.INITIAL;

    @Override
    protected boolean needDatabaseHistory() {
        return false;
    }

    @Override
    protected Properties properties(RunContext runContext, Path offsetFile, Path historyFile) throws Exception {
        Properties props = super.properties(runContext, offsetFile, historyFile);

        props.setProperty("connector.class", PostgresConnector.class.getName());

        PostgresService.handleProperties(props, runContext, this);

        return props;
    }
}
