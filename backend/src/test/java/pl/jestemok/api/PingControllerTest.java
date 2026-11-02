package pl.jestemok.api;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;

class PingControllerTest {

    @Test
    void pingReturnsOk() {
        var response = new PingController().ping();

        assertThat(response.status()).isEqualTo("ok");
    }
}
