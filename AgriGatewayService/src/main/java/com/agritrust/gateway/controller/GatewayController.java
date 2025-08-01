package com.agritrust.gateway.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Mono;

@RestController
@RequestMapping("/api/gateway")
@Tag(name = "Gateway Management", description = "APIs for the AgriTrust Gateway Service")
public class GatewayController {
    @GetMapping("/health")
    @Operation(summary = "Gateway health check", description = "Check if the gateway service is running")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Gateway is healthy")
    })
    public Mono<String> health() {
        return Mono.just("AgriGatewayService is running!");
    }
    @GetMapping("/status")
    @Operation(summary = "Gateway status", description = "Get the current status of the gateway")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Gateway status retrieved successfully")
    })
    public Mono<String> status() {
        return Mono.just("Gateway is operational and ready to route requests");
    }
} 
