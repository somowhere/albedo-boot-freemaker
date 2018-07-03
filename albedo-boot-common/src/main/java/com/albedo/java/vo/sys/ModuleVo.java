package com.albedo.java.vo.sys;

import com.albedo.java.util.PublicUtil;
import com.albedo.java.util.StringUtil;
import com.albedo.java.util.base.Collections3;
import com.albedo.java.vo.base.TreeEntityVo;
import lombok.Data;
import lombok.ToString;

import java.util.Collection;
import java.util.List;


/**
 * Copyright 2013 albedo All right reserved Author somewhere Created on 2013-10-23 下午4:29:21
 */
@Data
@ToString
public class ModuleVo extends TreeEntityVo {

    public static final String F_PERMISSION = "permission";
    public static final String ROOT_ID = "4d32c49cc7f448dcbfb92ce9c4dde058";

    private static final long serialVersionUID = 1L;

    /*** 菜单模块 MENUFLAG = 0 */
    public static final String TYPE_MENU = "1";
    /*** 权限模块 MODULEFLAG = 1 */
    public static final String TYPE_OPERATE = "2";
    /*** 模块类型 0 菜单模块 1权限模块 */
    private String type;

    private String target;
    /*** 请求方法*/
    private String requestMethod;
    /*** 链接地址 */
    private String url;
    /*** 图标class */
    private String iconCls;
    /*** 前端组件 */
    private String component;
    /*** 权限标识 */
    private String permission;
    /*** 针对顶层菜单，0 普通展示下级菜单， 1以树形结构展示 */
    private String showType;
    /*** 服务名称 */
    private String microservice;
    /*** 是否 */
    private boolean hasChild;

    private boolean menuLeaf;
    private boolean menuTop;
    private boolean show;
    private String href;

    public void setRequestMethod(Object requestMethod) {
        if(requestMethod instanceof List){
            this.requestMethod = Collections3.convertToString((Collection) requestMethod, StringUtil.SPLIT_DEFAULT);
        }else{

            this.requestMethod = PublicUtil.toStrString(requestMethod);
        }
    }

}
