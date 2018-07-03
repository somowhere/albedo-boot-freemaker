package com.albedo.java.modules.gen.domain;

import com.albedo.java.common.persistence.annotation.ManyToOne;
import com.albedo.java.common.persistence.domain.IdEntity;
import com.albedo.java.util.config.SystemConfig;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.data.annotation.Transient;

/**
 * 业务表字段Entity
 *
 * @version 2013-10-15
 */
@TableName("gen_table_column_t")
@Data
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class GenTableColumn extends IdEntity<GenTableColumn, String> implements Comparable<GenTableColumn> {

    private static final long serialVersionUID = 1L;

    public static final String F_GENTABLEID = "genTableId";
    public static final String F_SORT = "sort";

    public static final String F_SQL_GENTABLEID = "gen_table_id";
    @TableField(F_SQL_GENTABLEID)
    private String genTableId; // 列名
    @ManyToOne
    @TableField(exist = false)
    private GenTable genTable; // 归属表
    @Length(min = 1, max = 200)
    @TableField("name_")
    private String name; // 列名
    @TableField("title_")
    @NotBlank
    private String title; // 标题
    @TableField("comments")
    private String comments; // 描述
    @TableField("jdbc_type")
    private String jdbcType; // JDBC类型
    @TableField("java_type")
    private String javaType; // JAVA类型
    @TableField("java_field")
    private String javaField; // JAVA字段名
    @TableField("is_pk")
    private Integer isPk = SystemConfig.NO; // 是否主键（1：主键）
    @TableField("is_unique")
    private Integer isUnique = SystemConfig.NO; // 是否唯一（1：是；0：否）
    @TableField("is_null")
    private Integer isNull = SystemConfig.NO; // 是否可为空（1：可为空；0：不为空）
    @TableField("is_insert")
    private Integer isInsert = SystemConfig.NO; // 是否为插入字段（1：插入字段）
    @TableField("is_edit")
    private Integer isEdit = SystemConfig.NO; // 是否编辑字段（1：编辑字段）
    @TableField("is_list")
    private Integer isList = SystemConfig.NO; // 是否列表字段（1：列表字段）
    @TableField("is_query")
    private Integer isQuery = SystemConfig.NO; // 是否查询字段（1：查询字段）
    @TableField("query_type")
    private String queryType; // 查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）
    @TableField("show_type")
    private String showType; // 字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）
    @TableField("dict_type")
    private String dictType; // 字典类型
    @TableField("sort_")
    private Integer sort; // 排序（升序）

    @TableField(exist = false)
    private String hibernateValidatorExprssion;
    @TableField(exist = false)
    private String size;

    public GenTableColumn(String id) {
        super();
        this.id = id;
    }

    public GenTableColumn(String name, Integer isNull, Integer sort, String comments, String jdbcType) {
        this.name = name;
        this.isNull = isNull;
        this.sort = sort;
        this.comments = comments;
        this.jdbcType = jdbcType;
    }

    /**
     * 获取列名和说明
     *
     * @return
     */
    public String getNameAndTitle() {
        return getName() + (comments == null ? "" : "  :  " + comments);
    }

    @Override
    public int compareTo(GenTableColumn o) {
        return o.getSort()!=null ? this.sort!=null ? this.sort - o.getSort() : 0 : this.sort;
    }
}
