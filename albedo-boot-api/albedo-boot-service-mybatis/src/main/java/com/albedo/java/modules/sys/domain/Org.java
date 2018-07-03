package com.albedo.java.modules.sys.domain;

import com.albedo.java.common.persistence.domain.TreeEntity;
import com.albedo.java.util.annotation.DictType;
import com.albedo.java.util.annotation.SearchField;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * Copyright 2013 albedo All right reserved Author somewhere Created on 2013-10-23 下午4:30:34
 */
@TableName("sys_org_t")
@Data
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Org extends TreeEntity<Org> {

    public static final String F_TYPE = "type";
    public static final String F_CODE = "code";
    public static final String F_EN = "en";
    public static final String F_GRADE = "grade";

    private static final long serialVersionUID = 1L;
    /*** 组织编码 */
    @TableField("code_")
    @SearchField
    private String code;

    /*** 拼音简码 */
    @TableField("en_")
    private String en;
    /*** 机构类型（1：公司；2：部门；3：小组） */
    @TableField("type_")
    @DictType(name = "sys_org_type")
    private String type;
    /*** 机构等级（1：一级；2：二级；3：三级；4：四级） */
    @TableField("grade_")
    @DictType(name = "sys_org_grade")
    private String grade;


    public Org(String id, String parentIds) {
        this.setId(id);
        this.parentIds = parentIds;
    }

    public Org(String id) {
        this.setId(id);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getEn() {
        return en;
    }

    public void setEn(String en) {
        this.en = en;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
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
