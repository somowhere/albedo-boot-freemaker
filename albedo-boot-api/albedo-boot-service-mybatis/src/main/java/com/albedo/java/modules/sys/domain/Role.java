package com.albedo.java.modules.sys.domain;

import com.albedo.java.common.persistence.annotation.ManyToOne;
import com.albedo.java.common.persistence.domain.IdEntity;
import com.albedo.java.util.annotation.DictType;
import com.albedo.java.util.annotation.SearchField;
import com.albedo.java.util.base.Collections3;
import com.alibaba.fastjson.annotation.JSONField;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

/**
 * Copyright 2013 albedo All right reserved Author somewhere Created on 2013-10-23 下午4:32:52
 */
@TableName("sys_role_t")
@Data
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Role extends IdEntity<Role, String> {

    /*** 数据范围(所有数据) */
    public static final Integer DATA_SCOPE_ALL = 1;
    // 数据范围（1：所有数据；2：所在机构及以下数据；3：所在机构数据；4：仅本人数据；5：按明细设置）
    /*** 数据范围(所在机构及以下数据) */
    public static final Integer DATA_SCOPE_ORG_AND_CHILD = 2;
    /*** 数据范围(所在机构数据) */
    public static final Integer DATA_SCOPE_ORG = 3;
    /*** 数据范围(仅本人数据) */
    public static final Integer DATA_SCOPE_SELF = 4;
    /*** 数据范围(按明细设置) */
    public static final Integer DATA_SCOPE_CUSTOM = 5;
    public static final String F_SORT = "sort";
    public static final String F_NAME = "name";
    public static final String F_SYSDATA = "sysData";
    private static final long serialVersionUID = 1L;
    /*** 角色名称 */
    @TableField("name_")
    @SearchField
    private String name;
    /*** 名称全拼 */
    @TableField("en_")
    @SearchField
    private String en;
    /*** 工作流组用户组类型（security-role：管理员、assignment：可进行任务分配、user：普通用户） */
    @TableField("type_")
    private String type;
    /*** 组织ID */
    @TableField("org_id")
    private String orgId;

    @ApiModelProperty(hidden = true)
    @ManyToOne(name = "org_id")
    @TableField(exist = false)
    private Org org;

    /*** 是否系统数据  0 是 1否*/
    @TableField("sys_data")
    @DictType(name = "sys_yes_no")
    private Integer sysData;
    /*** 可查看的数据范围 */
    @TableField("data_scope")
    private Integer dataScope;
    @TableField("sort_")
    private Integer sort;

    @TableField(exist = false)
    @JSONField(serialize = false)
    private List<String> moduleIdList;
    @TableField(exist = false)
    @JSONField(serialize = false)
    private List<String> orgIdList;


    public Role(String id) {
        this.setId(id);
    }


    public Role(String id, String name) {
        this.setId(id);
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public Integer getSysData() {
        return sysData;
    }

    public void setSysData(Integer sysData) {
        this.sysData = sysData;
    }

    public Integer getDataScope() {
        return dataScope;
    }

    public void setDataScope(Integer dataScope) {
        this.dataScope = dataScope;
    }


    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getEn() {
        return en;
    }

    public void setEn(String en) {
        this.en = en;
    }




    public List<String> getOrgIdList() {
        return orgIdList;
    }

    public void setOrgIdList(List<String> orgIdList) {
        this.orgIdList = orgIdList;
    }

    public String getOrgIds() {
        return Collections3.convertToString(getOrgIdList(), ",");
    }

    public List<String> getModuleIdList() {
        return moduleIdList;
    }

    public void setModuleIdList(List<String> moduleIdList) {
        this.moduleIdList = moduleIdList;
    }

    public String getModuleIds() {
        return Collections3.convertToString(getModuleIdList(), ",");
    }

    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }

    public Org getOrg() {
        return org;
    }

    public void setOrg(Org org) {
        this.org = org;
    }

    @Override
    public boolean equals(Object o) {
        return super.equals(o);
    }
    @Override
    public int hashCode() {
        return super.hashCode();
    }

}
