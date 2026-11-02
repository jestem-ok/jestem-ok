package pl.jestemok.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * The simplest possible endpoint. The mobile app calls it to check that it can
 * reach the backend. Delete it once real endpoints exist.
 */
@RestController
@RequestMapping("/api")
public class PingController {

    @GetMapping("/ping")
    public PingResponse ping() {
        return new PingResponse("ok");
    }

    public record PingResponse(String status) {
    }
}
