package com.albedo.java.common.security.annotaion;

import java.lang.annotation.*;

/**
 * Created by somewhere on 2018/2/12.
 *
 * 权限配置，指定链接权限名称，优先级大于数据库sys_module_t 配置 作用于RequestMapping
 * 如果没有配置 且数据库也没有对应配置，并且 命中 SecurityConstants.authorize 则默认登录权限
 */
@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface RequiresPermissions {
    String[] value();
}
