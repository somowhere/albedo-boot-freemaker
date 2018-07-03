package com.albedo.java.modules.gen.domain;

import com.albedo.java.common.persistence.annotation.ManyToOne;
import com.albedo.java.common.persistence.domain.IdEntity;
import com.alibaba.fastjson.annotation.JSONField;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;


/**
 * 生成方案Entity
 *
 * @version 2013-10-15
 */
@TableName("gen_scheme_t")
@Data
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class GenScheme extends IdEntity<GenScheme, String> {

    /**
     * @Fields CATEGORY_CURD : 增删改查（单表）
     */
    public static final String CATEGORY_CURD = "curd";
    /**
     * @Fields CATEGORY_CURD_MANY : 增删改查（一对多）
     */
    public static final String CATEGORY_CURD_MANY = "curd_many";
    /**
     * @Fields CATEGORY_SERVICE : 仅持久层（service/entity）
     */
    public static final String CATEGORY_SERVICE = "service";
    /**
     * @Fields CATEGORY_CURD : 数据层（entity）
     */
    public static final String CATEGORY_ENITY = "entity";
    /**
     * @Fields CATEGORY_CURD : 树结构表（一体）
     */
    public static final String CATEGORY_TREETABLE = "treeTable";
    private static final long serialVersionUID = 1L;
    @Length(min = 1, max = 200)
    @TableField("name_")
    private String name; // 名称
    @TableField("category_")
    private String category; // 分类
    @TableField("view_type")
    private Integer viewType; // 视图类型 0 普通表格 1 表格采用ajax刷新
    @TableField("package_name")
    private String packageName; // 生成包路径
    @TableField("module_name")
    private String moduleName; // 生成模块名
    @TableField("sub_module_name")
    private String subModuleName; // 生成子模块名
    @TableField("function_name")
    private String functionName; // 生成功能名
    @TableField("function_name_simple")
    private String functionNameSimple; // 生成功能名（简写）
    @TableField("function_author")
    private String functionAuthor; // 生成功能作者
    @ManyToOne(name = "gen_table_id")
    @TableField(exist = false)
    private GenTable genTable; // 业务表名
    @TableField("gen_table_id")
    private String genTableId; // 业务表名

    @JSONField(serialize = false)
    @TableField(exist = false)
    private Boolean genCode = false; // flase：保存方案； ture：保存方案并生成代码
    @JSONField(serialize = false)
    @TableField(exist = false)
    private Boolean replaceFile = false; // 是否替换现有文件 true：替换文件 ；false：不替换；
    @JSONField(serialize = false)
    @TableField(exist = false)
    private Boolean syncModule = false; // 是否同步模块数据 true：同步；false：不同步
    @JSONField(serialize = false)
    @TableField(exist = false)
    private String parentModuleId; // 上级模块 ID 仅当syncModule 为 true有效

    public GenScheme(String id) {
        super();
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPackageName() {
        return packageName;
    }

    public Integer getViewType() {
        return viewType;
    }

    public void setViewType(Integer viewType) {
        this.viewType = viewType;
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
