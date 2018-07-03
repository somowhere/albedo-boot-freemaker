package com.albedo.java.common.config;

import com.albedo.java.common.persistence.handler.EntityMetaObjectHandler;
import com.albedo.java.common.persistence.injector.EntityMetaSqlInjector;
import com.baomidou.mybatisplus.mapper.LogicSqlInjector;
import com.baomidou.mybatisplus.plugins.OptimisticLockerInterceptor;
import com.baomidou.mybatisplus.plugins.PaginationInterceptor;
import com.baomidou.mybatisplus.spring.boot.starter.MybatisPlusProperties;
import org.apache.ibatis.mapping.DatabaseIdProvider;
import org.apache.ibatis.mapping.VendorDatabaseIdProvider;
import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.data.domain.AuditorAware;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;
import java.util.Properties;

@Configuration
@EnableTransactionManagement
@MapperScan("com.albedo.java.modules.*.repository")
@EnableAspectJAutoProxy(proxyTargetClass = true)
@EnableConfigurationProperties({MybatisPlusProperties.class})
public class DatabaseAutoConfiguration {

    private final Logger log = LoggerFactory.getLogger(DatabaseAutoConfiguration.class);

    @Bean
    public PlatformTransactionManager transactionManager(DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }

    /**
     * 新增，修改 公共字段填充
     * @return
     */
    @Bean
    public EntityMetaObjectHandler entityMetaObjectHandler(AuditorAware auditorAware){
        return new EntityMetaObjectHandler(auditorAware);
    }

    /**
     * ql注入
     * @return
     */
    @Bean
    public EntityMetaSqlInjector entityMetaSqlInjector(){
        return new EntityMetaSqlInjector();
    }


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
     * 分页拦截器 count
     * @return
     */
    @Bean
    public PaginationInterceptor paginationInterceptor(){
        return new PaginationInterceptor();
    }
    /**
     * 乐观锁拦截器 version
     * @return
     */
    @Bean
    public OptimisticLockerInterceptor optimisticLockerInterceptor(){
        return new OptimisticLockerInterceptor();
    }

}
