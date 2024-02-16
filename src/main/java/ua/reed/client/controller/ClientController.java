package ua.reed.client.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class ClientController {

    private static final String STATS_ENDPOINT = "/api/instance/stats";

    private final RestTemplate restTemplate;

    @GetMapping("/public")
    public ResponseEntity<String> getByPublicIp(@RequestParam("publicIp") final String publicIp) {
        URI uri = UriComponentsBuilder.fromHttpUrl(publicIp.concat(STATS_ENDPOINT)).build().toUri();
        return this.restTemplate.getForEntity(uri, String.class);
    }

    @GetMapping("/private")
    public ResponseEntity<String> getByPrivateIp(@RequestParam("privateIp") final String privateIp) {
        URI uri = UriComponentsBuilder.fromHttpUrl(privateIp.concat(STATS_ENDPOINT)).build().toUri();
        return this.restTemplate.getForEntity(uri, String.class);
    }
}
