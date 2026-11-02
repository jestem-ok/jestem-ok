package pl.jestemok;

import static org.assertj.core.api.Assertions.assertThat;

import org.flywaydb.core.Flyway;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Import;

@Import(TestcontainersConfiguration.class)
@SpringBootTest
class JestemOkApplicationTests {

    @Autowired
    private Flyway flyway;

    @Test
    void applicationStartsAndRunsMigrations() {
        assertThat(flyway.info().pending()).isEmpty();
    }
}
