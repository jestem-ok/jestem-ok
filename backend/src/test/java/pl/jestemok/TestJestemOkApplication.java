package pl.jestemok;

import org.springframework.boot.SpringApplication;

/**
 * Runs the backend with a temporary PostgreSQL in Docker, no docker compose needed.
 * Start it from the IDE, or with: mvn spring-boot:test-run
 * Data is lost when the application stops.
 */
public class TestJestemOkApplication {

    public static void main(String[] args) {
        SpringApplication.from(JestemOkApplication::main)
                .with(TestcontainersConfiguration.class)
                .run(args);
    }
}
