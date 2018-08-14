package com.albedo.java.common.config.apidoc;

import com.albedo.java.common.config.AlbedoSwaggerProperties;
import com.albedo.java.util.domain.Globals;
import com.fasterxml.classmate.TypeResolver;
import com.google.common.collect.Lists;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.Profile;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StopWatch;
import springfox.bean.validators.configuration.BeanValidatorPluginsConfiguration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.schema.TypeNameExtractor;
import springfox.documentation.service.*;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spi.service.contexts.SecurityContext;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.util.List;

/**
 * Springfox Swagger configuration.
 * <p>
 * Warning! When having a lot of REST endpoints, Springfox can become a performance issue. In that
 * case, you can use a specific Spring profile for this class, so that only front-end developers
 * have access to the Swagger view.
 */
@Configuration
@ConditionalOnClass({ApiInfo.class, BeanValidatorPluginsConfiguration.class})
@EnableSwagger2
@Import({BeanValidatorPluginsConfiguration.class})
@Profile({Globals.SPRING_PROFILE_SWAGGER})
@EnableConfigurationProperties({AlbedoSwaggerProperties.class})
public class SwaggerConfiguration {

    private final Logger log = LoggerFactory.getLogger(SwaggerConfiguration.class);

    @Autowired
    AlbedoSwaggerProperties albedoSwaggerProperties;

    /**
     * Swagger Springfox configuration.
     *
     * @return the Swagger Springfox configuration
     */
    @Bean
    public Docket swaggerSpringfoxDocket() {
        log.debug("Starting Swagger");
        StopWatch watch = new StopWatch();
        watch.start();
        Contact contact = new Contact(albedoSwaggerProperties.getContactName(), albedoSwaggerProperties.getContactUrl(), albedoSwaggerProperties.getContactEmail());
        ApiInfo apiInfo = new ApiInfoBuilder().title(albedoSwaggerProperties.getTitle())
            .description(albedoSwaggerProperties.getDescription())
            .version(albedoSwaggerProperties.getVersion())
            .termsOfServiceUrl(albedoSwaggerProperties.getTermsOfServiceUrl())
            .contact(contact)
            .license(albedoSwaggerProperties.getLicense())
            .licenseUrl(albedoSwaggerProperties.getLicenseUrl()).build();
        Docket docket = (new Docket(DocumentationType.SWAGGER_2)).apiInfo(apiInfo)
            .securitySchemes(securitySchemes())
            .securityContexts(securityContexts())
            .forCodeGeneration(true)
            .genericModelSubstitutes(new Class[]{ResponseEntity.class})
            .select()
            .paths(PathSelectors.regex(albedoSwaggerProperties.getDefaultIncludePattern()))
            .build();
        watch.stop();
        this.log.debug("Started Swagger in {} ms", Long.valueOf(watch.getTotalTimeMillis()));
        return docket;
    }

    private List<ApiKey> securitySchemes() {
        return Lists.newArrayList(
            new ApiKey("Authorization", "Authorization", "header"));
    }

    private List<SecurityContext> securityContexts() {
        return Lists.newArrayList(
            SecurityContext.builder()
                .securityReferences(defaultAuth())
                .forPaths(PathSelectors.regex("^(?!auth).*$"))
                .build()
        );
    }

    List<SecurityReference> defaultAuth() {
        AuthorizationScope authorizationScope = new AuthorizationScope("global",
            "accessEverything");
        AuthorizationScope[] authorizationScopes = new AuthorizationScope[1];
        authorizationScopes[0] = authorizationScope;
        return Lists.newArrayList(
            new SecurityReference("Authorization", authorizationScopes));
    }

    @Configuration
    @Profile({Globals.SPRING_PROFILE_SWAGGER})
    @ConditionalOnClass({Pageable.class})
    public static class SpringPagePluginConfiguration {
        public SpringPagePluginConfiguration() {
        }

        @Bean
        @ConditionalOnMissingBean
        public PageableParameterBuilderPlugin pageableParameterBuilderPlugin(TypeNameExtractor typeNameExtractor, TypeResolver typeResolver) {
            return new PageableParameterBuilderPlugin(typeNameExtractor, typeResolver);
        }
    }
}
