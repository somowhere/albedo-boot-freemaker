package com.albedo.java.vo.gen;

import com.albedo.java.util.PublicUtil;
import com.albedo.java.util.StringUtil;
import com.albedo.java.util.annotation.JsonField;
import com.albedo.java.util.base.Collections3;
import com.albedo.java.util.config.SystemConfig;
import com.albedo.java.util.exception.RuntimeMsgException;
import com.albedo.java.vo.base.DataEntityVo;
import com.alibaba.fastjson.annotation.JSONField;
import com.google.common.collect.Lists;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * 业务表Entity
 *
 * @author somewhere
 * @version 2013-10-15
 */
@Data
@ToString
public class GenTableVo extends DataEntityVo<String> {

    public static final String F_NAME = "name";
    public static final String F_NAMESANDCOMMENTS = "nameAndTitle";
    private static final long serialVersionUID = 1L;
    // 名称
    /*** 编码 */
    private String name;
    /*** 描述 */
    private String comments;
    /*** 实体类名称 */
    private String className;
    /*** 关联父表 */
    private String parentTable;
    /*** 关联父表外键 */
    private String parentTableFk;
    /*** 父表对象 */
    @JSONField(serialize = false)
    private GenTableVo parent;
    /*** 子表列表 */
    @JSONField(serialize = false)
    private List<GenTableVo> childList;
    private String nameAndTitle;
    /*** 按名称模糊查询 */
    private String nameLike;
    /*** 当前表主键列表 */
    private List<String> pkList;

    private String category;
    /**
     * 当前表主键列表
     */
    @JSONField(serialize = false)
    private List<GenTableColumnVo> pkColumnList;
    /*** 列 - 列表 */
    @JSONField(serialize = false)
    private List<GenTableColumnVo> columnList;
    /*** 表单提交列 - 列表 */
    @NotNull
    private List<GenTableColumnVo> columnFormList;
    public GenTableVo(String name, String comments) {
        this.name = name;
        this.comments = comments;
    }
    public GenTableVo() {
    }
    public GenTableVo(GenTableFormVo genTableFormVo) {
        this.setId(genTableFormVo.getId());
        this.name=genTableFormVo.getName();

    }

    public List<GenTableColumnVo> getPkColumnList() {
        if (PublicUtil.isEmpty(pkColumnList) && PublicUtil.isNotEmpty(columnList)) {
            if (pkColumnList == null) {
                pkColumnList = Lists.newArrayList();
            }
            for (GenTableColumnVo column : getColumnList()) {
                if (column.getPk()) {
                    pkColumnList.add(column);
                }
            }
        }
        return pkColumnList;
    }

    public void setPkColumnList(List<GenTableColumnVo> pkColumnList) {
        this.pkColumnList = pkColumnList;
    }

    @JSONField(serialize = false)
    public boolean isCompositeId() {
        List<String> pkList = getPkList();
        return PublicUtil.isNotEmpty(pkList) && pkList.size() > 1;
    }

    @JSONField(serialize = false,deserialize=false)
    public boolean isNotCompositeId() {
        return !isCompositeId();
    }

    @SuppressWarnings("unchecked")
    public List<String> getPkList() {
        if (PublicUtil.isEmpty(pkList) && PublicUtil.isNotEmpty(getPkColumnList())) {
            pkList = Collections3.extractToList(getPkColumnList(), "name");
        }
        return pkList;
    }

    public void setPkList(List<String> pkList) {
        this.pkList = pkList;
    }

    public String getNameLike() {
        return nameLike;
    }

    public void setNameLike(String nameLike) {
        this.nameLike = nameLike;
    }

    public List<GenTableColumnVo> getColumnList() {
        if (columnList == null) {
            columnList = Lists.newArrayList();
        }
        return columnList;
    }

    public void setColumnList(List<GenTableColumnVo> columnList) {
        this.columnList = columnList;
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

    public List<GenTableColumnVo> getColumnFormList() {
        if(PublicUtil.isEmpty(columnFormList) && PublicUtil.isNotEmpty(columnList)){
            columnFormList = columnList;
        }
        return columnFormList;
    }

    public void setColumnFormList(List<GenTableColumnVo> columnFormList) {
        this.columnFormList = columnFormList;
    }

    /**
     * 获取导入依赖包字符串
     *
     * @return
     */
    @JSONField(serialize = false)
    public List<String> getImportList() {
        List<String> importList = Lists.newArrayList("com.albedo.java.util.PublicUtil",
            "com.baomidou.mybatisplus.annotations.*",
                "com.albedo.java.util.annotation.SearchField"); // 引用列表
        if ("treeTable".equalsIgnoreCase(getCategory())) {
            importList.add("com.albedo.java.common.persistence.domain.TreeEntity");
            // 如果有子表，则需要导入List相关引用
            if (getChildList() != null && getChildList().size() > 0) {
                addNoRepeatList(importList, "java.util.List", "com.google.common.collect.Lists", "org.hibernate.annotations.FetchMode", "org.hibernate.annotations.Fetch",
                        "org.hibernate.annotations.Where");
            }
        } else {
            importList.add("com.albedo.java.common.persistence.domain.IdEntity");
            initImport(importList);
            // 如果有子表，则需要导入List相关引用
            if (getChildList() != null && getChildList().size() > 0) {
                addNoRepeatList(importList, "java.util.List", "com.google.common.collect.Lists");
            }
        }

        return importList;
    }

    private void initImport(List<String> importList) {
        for (GenTableColumnVo column : getColumnList()) {
            if (column.getIsNotBaseField() || ("1".equals(column.getIsQuery()) && "between".equals(column.getQueryType()) &&
                    (DataEntityVo.F_CREATEDDATE.equals(column.getSimpleJavaField()) ||
                            DataEntityVo.F_LASTMODIFIEDDATE.equals(column.getSimpleJavaField())))) {
                // 导入类型依赖包， 如果类型中包含“.”，则需要导入引用。
                if (StringUtil.indexOf(column.getJavaType(), ".") != -1) {
                    addNoRepeatList(importList, column.getJavaType());
                }
            }
            if (column.getIsNotBaseField()) {
                // 导入JSR303、Json等依赖包
                for (String ann : column.getAnnotationList()) {
                    addNoRepeatList(importList, ann.substring(0, ann.indexOf("(")));
                }
            }
            if (!SystemConfig.YES.equals(column.getIsPk()) && !SystemConfig.YES.equals(column.getIsNull()) && column.getJavaType().endsWith(SystemConfig.TYPE_STRING)) {
                addNoRepeatList(importList, "org.hibernate.validator.constraints.NotBlank");
            }
            if (PublicUtil.isNotEmpty(column.getDictType())) {
                addNoRepeatList(importList, "com.albedo.java.util.annotation.DictType");
            }
            if (column.getName().indexOf("mail") != -1) {
                addNoRepeatList(importList, "org.hibernate.validator.constraints.Email");
            }

            if (column.getUnique()) {
                addNoRepeatList(importList, "com.albedo.java.util.annotation.SearchField");
            }
        }
    }


    private void addNoRepeatList(List<String> list, String... val) {
        if (PublicUtil.isNotEmpty(list)) {
            for (String s : val) {
                if (!list.contains(s)) {
                    list.add(s);
                }
            }
        }
    }

    /**
     * 是否存在父类
     *
     * @return
     */
    public Boolean getParentExists() {
        return parent != null && StringUtil.isNotBlank(parentTable) && StringUtil.isNotBlank(parentTableFk);
    }
    @JSONField(serialize = false)
    public List<GenTableVo> getChildList() {
        return childList!=null ? childList : Lists.newArrayList();
    }

    /**
     * 是否存在子类
     *
     * @return
     */
    public Boolean getChildeExists() {
        try {
            return PublicUtil.isNotEmpty(childList);
        }catch (Exception e){
            return false;
        }

    }

    /**
     * 是否存在create_time列
     *
     * @return
     */
    public Boolean getCreateTimeExists() {
        for (GenTableColumnVo c : columnList) {
            if ("create_time".equals(c.getName())) {
                return true;
            }
        }
        return false;
    }

    /**
     * 是否存在update_time列
     *
     * @return
     */
    public Boolean getUpdateTimeExists() {
        for (GenTableColumnVo c : columnList) {
            if ("update_time".equals(c.getName())) {
                return true;
            }
        }
        return false;
    }

    /**
     * 是否存在status列
     *
     * @return
     */
    public Boolean getStatusExists() {
        for (GenTableColumnVo c : columnList) {
            if ("status".equals(c.getName())) {
                return true;
            }
        }
        return false;
    }

    /**
     * 获取主键类型
     *
     * @return
     */
    public String getPkJavaType() {
        String type = "";
        if (isCompositeId()) {
            type = PublicUtil.toAppendStr(getClassName(), "Id");
        } else {
            for (GenTableColumnVo column : getColumnList()) {
                if (column.getPk()) {
                    type = column.getJavaType();
                    break;
                }
            }
        }
        return type;
    }

    /**
     * 获取主键sqlname
     *
     * @return
     */
    public String getPkSqlName() {
        String name = "";
        if (isNotCompositeId()) {
            for (GenTableColumnVo column : getColumnList()) {
                if (column.getPk()) {
                    name = column.getName();
                    break;
                }
            }
        }
        return name;
    }

    /**
     * 获取主键sqlname
     *
     * @return
     */
    public String getPkSize() {
        String name = "";
        if (isNotCompositeId()) {
            for (GenTableColumnVo column : getColumnList()) {
                if (column.getPk()) {
                    name = column.getSize();
                    break;
                }
            }
        }
        return name;
    }

    /**
     * 获取主键column
     *
     * @return
     */
    public GenTableColumnVo getPkColumn() {
        if (isNotCompositeId()) {
            for (GenTableColumnVo column : getColumnList()) {
                if (column.getPk()) {
                    return column;
                }
            }
        }
        return null;
    }
}
