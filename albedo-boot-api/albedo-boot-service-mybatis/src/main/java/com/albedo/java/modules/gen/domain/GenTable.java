package com.albedo.java.modules.gen.domain;

import com.albedo.java.common.persistence.annotation.ManyToOne;
import com.albedo.java.common.persistence.domain.IdEntity;
import com.albedo.java.util.PublicUtil;
import com.albedo.java.util.StringUtil;
import com.albedo.java.util.annotation.SearchField;
import com.alibaba.fastjson.annotation.JSONField;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;
import org.springframework.data.annotation.Transient;

import java.util.List;

/**
 * 业务表Entity
 *
 * @version 2013-10-15
 */
@TableName("gen_table_t")
@Data
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class GenTable extends IdEntity<GenTable, String> {

    public static final String F_NAME = "name";
    public static final String F_NAMESANDTITLE = "nameAndTitle";
    private static final long serialVersionUID = 1L;
    @TableField("name_")
    @SearchField
    @Length(min = 1, max = 200)
    private String name; // 名称
    @TableField("comments")
    private String comments; // 描述
    @TableField("class_name")
    private String className; // 实体类名称
    @TableField("parent_table")
    private String parentTable; // 关联父表
    @TableField("parent_table_fk")
    private String parentTableFk; // 关联父表外键

    @TableField(exist = false)
    @JSONField(serialize = false)
    private List<GenTableColumn> columnList; // 表列

    @JSONField(serialize = false)
    @ManyToOne(name = "parent_table")
    @TableField(exist = false)
    private GenTable parent; // 父表对象

    @TableField(exist = false)
    private List<GenTable> childList; // 子表列表

    @TableField(exist = false)
    private String nameAndTitle;
    @TableField(exist = false)
    private String nameLike; // 按名称模糊查询
    @TableField(exist = false)
    @JSONField(serialize = false)
    private List<String> pkList; // 当前表主键列表
    @TableField(exist = false)
    @JSONField(serialize = false)
    private List<GenTableColumn> pkColumnList; // 当前表主键列表
    @TableField(exist = false)
    private String category; // 当前表的生成分类
    @TableField(exist = false)
    @JSONField(serialize = false)
    private List<GenTableColumn> columnFormList;

    public GenTable(String id) {
        super();
        this.id = id;
    }

    public GenTable(String name, String comments) {
        this.name = name;
        this.comments = comments;
    }


    public String getName() {
        return StringUtil.lowerCase(name);
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getParentTable() {
        return StringUtil.lowerCase(parentTable);
    }

    public void setParentTable(String parentTable) {
        this.parentTable = parentTable;
    }

    public String getParentTableJavaFieldFk() {
        return StringUtil.toCamelCase(parentTableFk);
    }

    public String getParentTableFk() {
        return StringUtil.lowerCase(parentTableFk);
    }

    public void setParentTableFk(String parentTableFk) {
        this.parentTableFk = parentTableFk;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    /**
     * 获取列名和说明
     *
     * @return
     */
    public String getNameAndTitle() {
        if (PublicUtil.isEmpty(nameAndTitle)) {
            nameAndTitle = getName() + (comments == null ? "" : "  :  " + comments);
        }
        return nameAndTitle;
    }

    public void setNameAndComments(String nameAndTitle) {
        this.nameAndTitle = nameAndTitle;
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
