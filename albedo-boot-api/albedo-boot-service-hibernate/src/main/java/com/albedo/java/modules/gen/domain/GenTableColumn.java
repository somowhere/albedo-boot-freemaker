package com.albedo.java.modules.gen.domain;

import com.albedo.java.common.persistence.domain.IdEntity;
import com.albedo.java.common.persistence.domain.TreeEntity;
import com.albedo.java.util.PublicUtil;
import com.albedo.java.util.StringUtil;
import com.albedo.java.util.config.SystemConfig;
import com.alibaba.fastjson.annotation.JSONField;
import com.google.common.collect.Lists;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.*;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.List;

/**
 * 业务表字段Entity
 *
 * @version 2013-10-15
 */
@Entity
@Table(name = "gen_table_column_t")
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class GenTableColumn extends IdEntity<String> {

    private static final long serialVersionUID = 1L;
    @Column(name = "gen_table_id")
    private String genTableId; // 归属表
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "gen_table_id", nullable = true, updatable = false, insertable = false)
    @NotFound(action = NotFoundAction.IGNORE)
    private GenTable genTable; // 归属表
    @Length(min = 1, max = 200)
    @Column(name = "name_")
    private String name; // 列名

    @Column(name = "title_")
    @NotBlank
    private String title; // 标题
    @Column(name = "comments")
    private String comments; // 描述
    @Column(name = "jdbc_type")
    private String jdbcType; // JDBC类型
    @Column(name = "java_type")
    private String javaType; // JAVA类型
    @Column(name = "java_field")
    private String javaField; // JAVA字段名
    @Column(name = "is_pk")
    private Integer isPk = SystemConfig.NO; // 是否主键（1：主键）
    @Column(name = "is_unique")
    private Integer isUnique = SystemConfig.NO; // 是否唯一（1：是；0：否）
    @Column(name = "is_null")
    private Integer isNull = SystemConfig.NO; // 是否可为空（1：可为空；0：不为空）
    @Column(name = "is_insert")
    private Integer isInsert = SystemConfig.NO; // 是否为插入字段（1：插入字段）
    @Column(name = "is_edit")
    private Integer isEdit = SystemConfig.NO; // 是否编辑字段（1：编辑字段）
    @Column(name = "is_list")
    private Integer isList = SystemConfig.NO; // 是否列表字段（1：列表字段）
    @Column(name = "is_query")
    private Integer isQuery = SystemConfig.NO; // 是否查询字段（1：查询字段）
    @Column(name = "query_type")
    private String queryType; // 查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）
    @Column(name = "show_type")
    private String showType; // 字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）
    @Column(name = "dict_type")
    private String dictType; // 字典类型
    @Column(name = "sort_")
    private Integer sort; // 排序（升序）

    @Transient
    private String hibernateValidatorExprssion;
    @Transient
    private String size;

    public GenTableColumn() {
        super();
    }

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

    public GenTableColumn(GenTable genTable) {
        this.genTable = genTable;
    }

    public GenTable getGenTable() {
        return genTable;
    }

    public void setGenTable(GenTable genTable) {
        this.genTable = genTable;
    }

    public String getName() {
        return StringUtil.lowerCase(name);
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getJdbcType() {
        return StringUtil.lowerCase(jdbcType);
    }

    public void setJdbcType(String jdbcType) {
        this.jdbcType = jdbcType;
    }

    public String getJavaType() {
        return javaType;
    }

    public void setJavaType(String javaType) {
        this.javaType = javaType;
    }

    public String getJavaField() {
        return javaField;
    }

    public void setJavaField(String javaField) {
        this.javaField = javaField;
    }

    public Integer getIsPk() {
        return isPk;
    }

    public void setIsPk(Integer isPk) {
        this.isPk = isPk;
    }

    public boolean getPk() {
        return SystemConfig.YES.equals(getIsPk());
    }

    public Integer getIsUnique() {
        return isUnique;
    }

    public void setIsUnique(Integer isUnique) {
        this.isUnique = isUnique;
    }

    public boolean getUnique() {
        return SystemConfig.YES.equals(getIsUnique());
    }

    public Integer getIsNull() {
        return isNull;
    }

    public void setIsNull(Integer isNull) {
        this.isNull = isNull;
    }

    public boolean getNullable() {
        return SystemConfig.YES.equals(getIsNull());
    }

    public Integer getIsInsert() {
        return isInsert;
    }

    public void setIsInsert(Integer isInsert) {
        this.isInsert = isInsert;
    }

    public Integer getIsEdit() {
        return isEdit;
    }

    public void setIsEdit(Integer isEdit) {
        this.isEdit = isEdit;
    }

    public Integer getIsList() {
        return isList;
    }

    public void setIsList(Integer isList) {
        this.isList = isList;
    }

    public Integer getIsQuery() {
        return isQuery;
    }

    public void setIsQuery(Integer isQuery) {
        this.isQuery = isQuery;
    }

    public String getQueryType() {
        return queryType;
    }

    public void setQueryType(String queryType) {
        this.queryType = queryType;
    }

    public String getShowType() {
        return showType;
    }

    public void setShowType(String showType) {
        this.showType = showType;
    }

    public String getDictType() {
        return dictType == null ? "" : dictType;
    }

    public void setDictType(String dictType) {
        this.dictType = dictType;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    /**
     * 获取列名和说明
     *
     * @return
     */
    public String getNameAndTitle() {
        return getName() + (comments == null ? "" : "  :  " + comments);
    }

    /**
     * 获取字符串长度
     *
     * @return
     */
    public String getDataLength() {
        String[] ss = StringUtil.split(StringUtil.substringBetween(getJdbcType(), "(", ")"), ",");
        if (ss != null && ss.length == 1) {// &&
            // SystemConfig.TYPE_STRING.equals(getJavaType())){
            return ss[0];
        }
        return "0";
    }

    /**
     * 获取简写Java类型
     *
     * @return
     */
    public String getSimpleJavaType() {
        if ("This".equals(getJavaType())) {
            return StringUtil.capitalize(genTable.getClassName());
        }
        return StringUtil.indexOf(getJavaType(), ".") != -1 ? StringUtil.substringAfterLast(getJavaType(), ".") : getJavaType();
    }

    /**
     * 获取简写Java字段
     *
     * @return
     */
    public String getSimpleJavaField() {
        return StringUtil.substringBefore(getJavaField(), ".");
    }

    /**
     * 获取全大写Java字段
     *
     * @return
     */
    public String getConstantJavaField() {
        return StringUtil.upperCase(getSimpleJavaField());
    }

    /**
     * 获取Java字段，如果是对象，则获取对象.附加属性1
     *
     * @return
     */
    public String getJavaFieldId() {
        return StringUtil.substringBefore(getJavaField(), "|");
    }

    /**
     * 获取Java字段，如果是对象，则获取对象.附加属性2
     *
     * @return
     */
    public String getJavaFieldName() {
        String[][] ss = getJavaFieldAttrs();
        return ss.length > 0 ? getSimpleJavaField() + "." + ss[0][0] : "";
    }

    /**
     * 获取Java字段，如果是对象，则获取对象.附加属性2
     *
     * @return
     */
    public String getJavaFieldShowName() {
        String[][] ss = getJavaFieldAttrs();
        return ss.length > 0 ? getSimpleJavaField() + StringUtil.capitalize(ss[0][0]) : "";
    }


    /**
     * 获取Java字段，如果是对象，则获取对象.附加属性2 默认 name
     *
     * @return
     */
    public String getDefaultJavaFieldName() {
        String[][] ss = getJavaFieldAttrs();
        return ss.length > 0 ? ss[0][0] : "name";
    }

    /**
     * 获取Java字段，所有属性名
     *
     * @return
     */
    public String[][] getJavaFieldAttrs() {
        String[] ss = StringUtil.split(StringUtil.substringAfter(getJavaField(), "|"), "|");
        String[][] sss = new String[ss.length][2];
        if (ss != null) {
            for (int i = 0; i < ss.length; i++) {
                sss[i][0] = ss[i];
                sss[i][1] = StringUtil.toUnderScoreCase(ss[i]);
            }
        }
        return sss;
    }

    /**
     * 获取列注解列表
     *
     * @return
     */
    public List<String> getAnnotationList() {
        List<String> list = Lists.newArrayList();
        // 导入Jackson注解
        if ("This".equals(getJavaType())) {
            list.add("com.fasterxml.jackson.annotation.JsonBackReference");
        }
        if ("java.util.Date".equals(getJavaType())) {
            list.add("com.fasterxml.jackson.annotation.JsonFormat(pattern = \"yyyy-MM-dd HH:mm:ss\")");
        }
        // 导入JSR303验证依赖包
        if (!"1".equals(getIsNull()) && !SystemConfig.TYPE_STRING.equals(getJavaType())) {
            list.add("javax.validation.constraints.NotNull(message=\"" + getTitle() + "不能为空\")");
        } else if (!"1".equals(getIsNull()) && SystemConfig.TYPE_STRING.equals(getJavaType()) && !"0".equals(getDataLength())) {
            list.add("org.hibernate.validator.constraints.Length(min=1, max=" + getDataLength() + ", message=\"" + getTitle() + "长度必须介于 1 和 " + getDataLength() + " 之间\")");
        } else if (SystemConfig.TYPE_STRING.equals(getJavaType()) && !"0".equals(getDataLength())) {
            list.add("org.hibernate.validator.constraints.Length(min=0, max=" + getDataLength() + ", message=\"" + getTitle() + "长度必须介于 0 和 " + getDataLength() + " 之间\")");
        }
        return list;
    }

    /**
     * 获取简写列注解列表
     *
     * @return
     */
    public List<String> getSimpleAnnotationList() {
        List<String> list = Lists.newArrayList();
        for (String ann : getAnnotationList()) {
            list.add(StringUtil.substringAfterLast(ann, "."));
        }
        return list;
    }

    /**
     * 是否是基类字段
     *
     * @return
     */
    public Boolean getIsNotBaseField() {
        return !StringUtil.equals(getSimpleJavaField(), IdEntity.F_ID) && !StringUtil.equals(getName(), "id_") &&
                !StringUtil.equals(getSimpleJavaField(), IdEntity.F_DESCRIPTION) && !StringUtil.equals(getName(), "description_")
                && !StringUtil.equals(getSimpleJavaField(), IdEntity.F_CREATEDBY) && !StringUtil.equals(getName(), "created_by") &&
                !StringUtil.equals(getSimpleJavaField(), IdEntity.F_CREATEDDATE) && !StringUtil.equals(getName(), "created_date")
                && !StringUtil.equals(getSimpleJavaField(), IdEntity.F_LASTMODIFIEDBY) && !StringUtil.equals(getName(), "last_modified_by") &&
                !StringUtil.equals(getSimpleJavaField(), IdEntity.F_LASTMODIFIEDDATE) && !StringUtil.equals(getName(), "last_modified_date")
                && !StringUtil.equals(getSimpleJavaField(), IdEntity.F_STATUS) && !StringUtil.equals(getName(), "status_") &&
                !StringUtil.equals(getSimpleJavaField(), IdEntity.F_VERSION) && !StringUtil.equals(getName(), "version_");
    }

    /**
     * 是否是基类字段
     *
     * @return
     */
    public Boolean getIsNotBaseTreeField() {
        return !StringUtil.equals(getSimpleJavaField(), TreeEntity.F_NAME) && !StringUtil.equals(getName(), "name_") &&
                !StringUtil.equals(getSimpleJavaField(), TreeEntity.F_PARENTID) && !StringUtil.equals(getSimpleJavaField(), "parent")
                && !StringUtil.equals(getName(), "parent_id") &&
                !StringUtil.equals(getSimpleJavaField(), TreeEntity.F_PARENTIDS)
                && !StringUtil.equals(getName(), "parent_ids")
                && !StringUtil.equals(getSimpleJavaField(), TreeEntity.F_SORT)
                && !StringUtil.equals(getName(), "sort_")
                && !StringUtil.equals(getSimpleJavaField(), TreeEntity.F_ISLEAF)
                && !StringUtil.equals(getName(), "is_leaf");

    }

    public boolean getIsDateTimeColumn() {
        return getJavaField().contains(SystemConfig.TYPE_DATE) && getJavaType().contains(SystemConfig.TYPE_DATE);
    }

    public String getHibernateValidatorExprssion() {
        if (PublicUtil.isEmpty(hibernateValidatorExprssion)) {
            hibernateValidatorExprssion = getHibernateValidatorExpression(this);
        }
        return hibernateValidatorExprssion;
    }

    @JSONField(serialize = false)@Transient
    public String getHibernateValidatorExpression(GenTableColumn c) {
        if (!SystemConfig.YES.equals(c.getIsPk()) && !SystemConfig.YES.equals(c.getIsNull())) {
            if (c.getJavaType().endsWith(SystemConfig.TYPE_STRING)) {
                return (new StringBuilder()).append("@NotBlank ").append(getNotRequiredHibernateValidatorExpression(c)).toString();
            } else {
                return (new StringBuilder()).append("@NotNull ").append(getNotRequiredHibernateValidatorExpression(c)).toString();
            }
        } else {
            return getNotRequiredHibernateValidatorExpression(c);
        }
    }

    @JSONField(serialize = false)@Transient
    public String getNotRequiredHibernateValidatorExpression(GenTableColumn c) {
        String result = "", javaType = c.getJavaType(), jdbcType = c.getJdbcType();
        if (c.getName().indexOf("mail") >= 0) {
            result = (new StringBuilder()).append(result).append("@Email ").toString();
        }
        ;
        if (javaType.endsWith(SystemConfig.TYPE_STRING)) {
            Integer size = jdbcType.equals("text") ? 65535 : Integer.valueOf(jdbcType.substring(jdbcType.indexOf("(") + 1, jdbcType.length() - 1));
            result = (new StringBuilder()).append(result).append(String.format("@Length(max=%s)", new Object[]{size})).toString();
        }
        if (javaType.endsWith(SystemConfig.TYPE_LONG) || javaType.endsWith(SystemConfig.TYPE_INTEGER) || javaType.endsWith(SystemConfig.TYPE_SHORT) || javaType.endsWith("Byte")) {
            if (javaType.toLowerCase().indexOf("short") >= 0)
                result = (new StringBuilder()).append(result).append(" @Max(32767)").toString();
            else if (javaType.toLowerCase().indexOf("byte") >= 0)
                result = (new StringBuilder()).append(result).append(" @Max(127)").toString();
        }
        return result.trim();
    }

    public void setHibernateValidatorExprssion(String hibernateValidatorExprssion) {
        this.hibernateValidatorExprssion = hibernateValidatorExprssion;
    }

    public String getSize() {
        if (jdbcType.contains("(") && PublicUtil.isEmpty(size)) {
            size = jdbcType.substring(jdbcType.indexOf("(") + 1, jdbcType.length() - 1);
        } else if (jdbcType.equals("text"))
            size = "65535";
        else
            size = "";
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getGenTableId() {
        return genTableId;
    }

    public void setGenTableId(String genTableId) {
        this.genTableId = genTableId;
    }

    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public void setComments(String comments) {
        this.comments = comments;
    }
    public String getComments() {
        return comments;
    }
}
