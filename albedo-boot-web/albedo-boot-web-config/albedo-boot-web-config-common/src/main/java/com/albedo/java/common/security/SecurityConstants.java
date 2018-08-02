package com.albedo.java.common.security;

public class SecurityConstants {

    public static String loginUrl = "/login";
    public static String logoutUrl = "/logout";
    public static String authLogin = "/authenticate";

    public static final String AUTHORIZATION_HEADER = "Authorization";

    public static String[] authorizePermitAll = {"/management/health",
            "/profile-info",
            "/v2/api-docs/**", "/swagger-resources/configuration/ui", "/swagger-ui/index.html"};
    public static String[] authorizeAdminPermitAll = {"/file/get/**"};

    /**
     * 线程变量绑定
     */
    private static final ThreadLocal<String> currentUrlHolder = new ThreadLocal<String>();
    /**
     * @Description: 设置当前访问url
     * @param url
     * @return void
     * @throws
     */
    public static void setCurrentUrl(String url) {
        currentUrlHolder.set(url);
    }

    /**
     * @Description: 获取当前访问url
     * @return String
     * @throws
     */
    public static String getCurrentUrl() {
        return currentUrlHolder.get();
    }


}
