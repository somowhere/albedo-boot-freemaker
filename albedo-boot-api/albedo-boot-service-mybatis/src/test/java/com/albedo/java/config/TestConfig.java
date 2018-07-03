/*
 *
 *   Copyright 2016 the original author or authors.
 *
 *   Licensed under the Apache License, Version 2.0 (the "License");
 *   you may not use this file except in compliance with the License.
 *   You may obtain a copy of the License at
 *
 *        http://www.apache.org/licenses/LICENSE-2.0
 *
 *   Unless required by applicable law or agreed to in writing, software
 *   distributed under the License is distributed on an "AS IS" BASIS,
 *   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *   See the License for the specific language governing permissions and
 *   limitations under the License.
 *
 */

package com.albedo.java.config;

import com.albedo.java.common.persistence.handler.EntityMetaObjectHandler;
import com.albedo.java.common.persistence.injector.EntityMetaSqlInjector;
import com.baomidou.mybatisplus.mapper.LogicSqlInjector;
import com.baomidou.mybatisplus.plugins.OptimisticLockerInterceptor;
import com.baomidou.mybatisplus.plugins.PaginationInterceptor;
import com.baomidou.mybatisplus.plugins.PerformanceInterceptor;
import com.baomidou.mybatisplus.spring.boot.starter.ConfigurationCustomizer;
import com.baomidou.mybatisplus.spring.boot.starter.MybatisPlusAutoConfiguration;
import com.baomidou.mybatisplus.spring.boot.starter.MybatisPlusProperties;
import org.apache.ibatis.mapping.DatabaseIdProvider;
import org.apache.ibatis.mapping.VendorDatabaseIdProvider;
import org.apache.ibatis.plugin.Interceptor;
import org.junit.After;
import org.junit.Rule;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.boot.autoconfigure.cache.CacheAutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.redis.RedisTestServer;
import org.springframework.boot.test.util.EnvironmentTestUtils;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.concurrent.ConcurrentMapCache;
import org.springframework.cache.concurrent.ConcurrentMapCacheManager;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.*;
import org.springframework.core.io.ResourceLoader;
import org.springframework.data.domain.AuditorAware;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.GenericJackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.GenericToStringSerializer;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.LazyConnectionDataSourceProxy;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabase;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;
import java.util.List;
import java.util.Properties;

import static org.hamcrest.CoreMatchers.equalTo;
import static org.hamcrest.CoreMatchers.instanceOf;
import static org.hamcrest.Matchers.contains;
import static org.hamcrest.Matchers.containsInAnyOrder;
import static org.hamcrest.Matchers.empty;
import static org.hamcrest.Matchers.hasSize;
import static org.hamcrest.Matchers.not;
import static org.junit.Assert.assertThat;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;

/**
 * Created by songjiawei on 2016/11/9.
 */
@Configuration
@ComponentScan({"com.albedo.java.*"})
@EnableTransactionManagement
@MapperScan("com.albedo.java.modules.*.repository")
@EnableAspectJAutoProxy(proxyTargetClass = true)
@EnableConfigurationProperties({MybatisPlusProperties.class})
public class TestConfig extends MybatisPlusAutoConfiguration  {

//    @Configuration
//    @EnableCaching
//    static class RedisCacheConfiguration {
//
//        @Bean
//        public RedisTemplate<?, ?> redisTemplate() {
//            return mock(RedisTemplate.class);
//        }
//
//        private AnnotationConfigApplicationContext context;
//
//
//
////        private <T extends CacheManager> T validateCacheManager(Class<T> type) {
////            CacheManager cacheManager = this.context.getBean(CacheManager.class);
////            assertThat("Wrong cache manager type", cacheManager, instanceOf(type));
////            return type.cast(cacheManager);
////        }
////
////        private void load(Class<?> config, String... environment) {
////            AnnotationConfigApplicationContext applicationContext = new AnnotationConfigApplicationContext();
////            EnvironmentTestUtils.addEnvironment(applicationContext, environment);
////            applicationContext.register(config);
////            applicationContext.register(CacheAutoConfiguration.class);
////            applicationContext.refresh();
////            this.context = applicationContext;
////        }
////
////        @Bean(name = "redisCacheManager")
////        @Primary
////        public RedisCacheManager redisCacheManager() {
////            load(RedisCacheConfiguration.class, "spring.cache.type=redis"
//////                ,"spring.cache.cacheNames[0]=foo", "spring.cache.cacheNames[1]=bar"
////            );
////            RedisCacheManager cacheManager = validateCacheManager(RedisCacheManager.class);
////            return cacheManager;
////        }
//
//    }
//        @Configuration
//    @EnableCaching
//    static class GenericCacheConfiguration {
//
//        @Bean
//        public Cache firstCache() {
//            return new ConcurrentMapCache("first");
//        }
//
//        @Bean
//        public Cache secondCache() {
//            return new ConcurrentMapCache("second");
//        }
//
//    }
        @Configuration
//    @Import({ GenericCacheConfiguration.class, RedisCacheConfiguration.class })
    static class CustomCacheManagerConfiguration {

        @Bean
        public CacheManager cacheManager() {
            return new ConcurrentMapCacheManager();
        }



    }

    @Configuration
    static class BeforeTestConfig{


        @Bean
        public DatabaseIdProvider getDatabaseIdProvider() {
            DatabaseIdProvider databaseIdProvider = new VendorDatabaseIdProvider();
            Properties p = new Properties();
            p.setProperty("Oracle", "oracle");
            p.setProperty("MySQL", "mysql");
            databaseIdProvider.setProperties(p);
            return databaseIdProvider;
        }

        /**
         * 性能分析
         * @return
         */
        @Bean
        public PerformanceInterceptor performanceInterceptor(){
            return new PerformanceInterceptor();
        }

        @Bean
        public PaginationInterceptor paginationInterceptor(){
            return new PaginationInterceptor();
        }

        @Bean
        public OptimisticLockerInterceptor optimisticLockerInterceptor(){
            return new OptimisticLockerInterceptor();
        }
    }

    public TestConfig(MybatisPlusProperties properties, ObjectProvider<Interceptor[]> interceptorsProvider, ResourceLoader resourceLoader, ObjectProvider<DatabaseIdProvider> databaseIdProvider, ObjectProvider<List<ConfigurationCustomizer>> configurationCustomizersProvider, ApplicationContext applicationContext) {
        super(properties, interceptorsProvider, resourceLoader, databaseIdProvider, configurationCustomizersProvider, applicationContext);
    }

    @Bean
    public DataSource dataSource() {
        EmbeddedDatabase embeddedDatabase = new EmbeddedDatabaseBuilder().setType(EmbeddedDatabaseType.H2)
            .addScript("classpath:/test-init.sql").build();
        return new LazyConnectionDataSourceProxy(embeddedDatabase);
    }

    @Bean
    public PlatformTransactionManager transactionManager(DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }

    @Bean
    public EntityMetaObjectHandler entityMetaObjectHandler(AuditorAware auditorAware){
        return new EntityMetaObjectHandler(auditorAware);
    }
    @Bean
    public EntityMetaSqlInjector entityMetaSqlInjector(){
        return new EntityMetaSqlInjector();
    }

    @Bean
    public AuditorAware<String> auditorAware() {

        return new AuditorAware<String>() {
            @Override
            public String getCurrentAuditor() {
                return "1";
            }
        };
    }

//    public GlobalConfiguration globalConfiguration() {
//        GlobalConfiguration global = GlobalConfigUtils.defaults();
//        // global.setAutoSetDbType(true);
//        // 设置全局校验机制为FieldStrategy.Empty
//        global.setFieldStrategy(2);
//        return global;
//    }
//
//    @Bean
//    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) {
//        return sqlSessionFactory("mysql-config.xml", dataSource);
//    }
//
//    public SqlSessionFactory sqlSessionFactory(String configXml, DataSource dataSource) {
//        GlobalConfiguration global = this.globalConfiguration();
////        HikariDataSource hikariDataSource = new HikariDataSource();`
////        hikariDataSource.setDataSource(dataSource);
////        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
////        dataSource.setJdbcUrl("jdbc:mysql://127.0.0.1:3306/mybatis-plus?characterEncoding=UTF-8");
////        dataSource.setUsername("root");
////        dataSource.setPassword("521");`
////        dataSource.setM(1000);
//        GlobalConfigUtils.setMetaData(dataSource, global);
//        // 加载配置文件
//        InputStream inputStream = TestConfig.class.getClassLoader().getResourceAsStream(configXml);
//        MybatisSessionFactoryBuilder factoryBuilder = new MybatisSessionFactoryBuilder();
//        factoryBuilder.setGlobalConfig(global);
//        return factoryBuilder..build(inputStream);
//    }
}



