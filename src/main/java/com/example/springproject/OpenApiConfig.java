package com.example.springproject;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;
import org.springframework.context.annotation.Configuration;

@Configuration
@OpenAPIDefinition(
    info = @Info(
        title = "MobileSales",  // <-- Custom Title
        version = "1.0",               // <-- Custom Version
        description = "This is my my project for Sales of all mobiles." // <-- Custom Description
    )
)
public class OpenApiConfig {
}
