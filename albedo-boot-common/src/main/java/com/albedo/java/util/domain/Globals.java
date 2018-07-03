package com.albedo.java.util.domain;

import com.google.common.collect.Maps;

import java.util.HashMap;
import java.util.Map;

/**
 * Application constants.
 */
public final class Globals {

    //Regex for acceptable logins
    public static final String LOGIN_REGEX = "^[_'.@A-Za-z0-9-]*$";
    // Spring profile for development and production, see http://albedo.github.io/profiles/
    public static final String SPRING_PROFILE_DEVELOPMENT = "dev";
    public static final String SPRING_PROFILE_PRODUCTION = "prod";
    // Spring profile used when deploying with Spring Cloud (used when deploying to CloudFoundry)
    public static final String SPRING_PROFILE_CLOUD = "cloud";
    // Spring profile used when deploying to Heroku
    public static final String SPRING_PROFILE_HEROKU = "heroku";
    // Spring profile used to disable swagger
    public static final String SPRING_PROFILE_SWAGGER = "swagger";
    // Spring profile used to disable running liquibase
    public static final String SPRING_PROFILE_NO_LIQUIBASE = "no-liquibase";

    public static final String SYSTEM_ACCOUNT = "1";


    public static final String INDEX_URL = "index";
    public static final String AUTHENTICATED = "authenticated";
    public static final String XML_HTTP_REQUEST = "XMLHttpRequest";
    public static final String URL_CHECKBY = "checkBy";
    public static final String URL_FIND = "find";


    public static final String ALBEDO_QUARTZENABLED = "albedo.quartzEnabled";


    /*** 返回消息状态头 type */
    public static final String MSG_TYPE = "status";
    /*** 返回消息内容头 msg */
    public static final String MSG = "message";
    /*** 返回消息类型 info */
    public static final Integer MSG_TYPE_INFO = 0;
    /*** 返回消息类型 success */
    public static final Integer MSG_TYPE_SUCCESS = 1;
    /*** 返回消息类型 warning */
    public static final Integer MSG_TYPE_WARNING = 2;
    /*** 返回消息类型 error */
    public static final Integer MSG_TYPE_ERROR = -1;
    /*** 返回消息类型 error */

    public enum StatusEmun {
        MSG_TYPE_INFO(0),
        MSG_TYPE_SUCCESS(1),
        MSG_TYPE_WARNING(2),
        MSG_TYPE_ERROR(-1);

        private int status;

        StatusEmun(int status) {
            this.status = status;
        }

        public int getStatus() {
            return status;
        }

    }

    public static final String ERROR_HTTP_CODE_400 = "error.http.400";
    public static final String ERROR_HTTP_CODE_403 = "error.http.403";
    public static final String ERROR_HTTP_CODE_405 = "error.http.405";
    public static final String ERROR_HTTP_CODE_500 = "error.http.500";

    private Globals() {

    }

}
