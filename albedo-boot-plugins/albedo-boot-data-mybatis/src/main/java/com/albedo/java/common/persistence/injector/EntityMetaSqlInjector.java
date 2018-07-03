package com.albedo.java.common.persistence.injector;

import com.albedo.java.common.persistence.annotation.ManyToOne;
import com.albedo.java.common.persistence.domain.TreeEntity;
import com.albedo.java.util.PublicUtil;
import com.albedo.java.util.StringUtil;
import com.albedo.java.util.base.Reflections;
import com.baomidou.mybatisplus.entity.GlobalConfiguration;
import com.baomidou.mybatisplus.entity.TableFieldInfo;
import com.baomidou.mybatisplus.entity.TableInfo;
import com.baomidou.mybatisplus.mapper.AutoSqlInjector;
import com.baomidou.mybatisplus.mapper.LogicSqlInjector;
import com.baomidou.mybatisplus.toolkit.GlobalConfigUtils;
import com.baomidou.mybatisplus.toolkit.SqlReservedWords;
import com.baomidou.mybatisplus.toolkit.StringUtils;
import com.baomidou.mybatisplus.toolkit.TableInfoHelper;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.ibatis.builder.MapperBuilderAssistant;
import org.apache.ibatis.mapping.SqlSource;

import java.beans.PropertyDescriptor;
import java.util.Iterator;
import java.util.List;
/**
 * 1.逻辑删除字段sql注入
 * 2.多对一关联对象查询sql注入
 * @return
 */
public class EntityMetaSqlInjector extends LogicSqlInjector {

    public final org.slf4j.Logger log = org.slf4j.LoggerFactory.getLogger(getClass());
    public enum SqlTreeMethod {
        FIND_RELATION_LIST("findRelationList", "查询包含关联对象集合", "<script>SELECT %s FROM %s %s</script>"),
        FIND_RELATION_PAGE("findRelationPage", "查询包含关联对象集合（并翻页）", "<script>SELECT %s FROM %s %s</script>");

        private final String method;
        private final String desc;
        private final String sql;

        private SqlTreeMethod(String method, String desc, String sql) {
            this.method = method;
            this.desc = desc;
            this.sql = sql;
        }

        public String getMethod() {
            return this.method;
        }

        public String getDesc() {
            return this.desc;
        }

        public String getSql() {
            return this.sql;
        }
    }

    @Override
    public void inject(MapperBuilderAssistant builderAssistant, Class<?> mapperClass) {
        super.inject(builderAssistant, mapperClass);
        Class<?> modelClass = this.extractModelClass(mapperClass);
        try {
            if (null != modelClass) {
                TableInfo table = TableInfoHelper.initTableInfo(builderAssistant, modelClass);
                this.injectFindRelationList(SqlTreeMethod.FIND_RELATION_LIST, mapperClass, modelClass, table);
                this.injectFindRelationList(SqlTreeMethod.FIND_RELATION_PAGE, mapperClass, modelClass, table);
            }



        } catch (Exception e) {
            log.error("{}", e);
        }
    }

    public void injectFindRelationList(SqlTreeMethod sqlMethod, Class<?> mapperClass, Class<?> modelClass, TableInfo table) {
        String tableNameAlias = StringUtil.toFirstLowerCase(modelClass.getSimpleName()), tempNameAlias;
        TableInfo tableAlias;
        PropertyDescriptor[] ps = PropertyUtils.getPropertyDescriptors(modelClass);
        StringBuffer sbSelectCoumns = new StringBuffer(sqlSelectColumns(table, false, tableNameAlias, null)),
        sbLeftJoin = new StringBuffer(table.getTableName()).append(" ").append(tableNameAlias);
        for (PropertyDescriptor p : ps) {
            ManyToOne annotation = Reflections.getAnnotationByClazz(modelClass, p.getName(), ManyToOne.class);
            if (annotation != null) {
//                tempNameAlias =  StringUtil.toFirstLowerCase(p.getPropertyType().getSimpleName());
                tableAlias = TableInfoHelper.initTableInfo(builderAssistant, p.getPropertyType());
                sbSelectCoumns.append(",")
                    .append(sqlSelectColumns(tableAlias, false, p.getName(), p.getName()));
                sbLeftJoin.append(" LEFT JOIN ").append(tableAlias.getTableName()).append(" ").append(p.getName())
                    .append(" ON ").append(tableNameAlias).append(".").append(annotation.name())
                    .append(" = ").append(p.getName()).append(".").append(TreeEntity.F_SQL_ID);
            }
        }
       String sql = String.format(sqlMethod.getSql(),
           sbSelectCoumns.toString(),
           sbLeftJoin.toString(),
           sqlWhereEntityWrapper(table, tableNameAlias));
        SqlSource sqlSource = languageDriver.createSqlSource(configuration, sql, modelClass);
        this.addSelectMappedStatement(mapperClass, sqlMethod.getMethod(), sqlSource, modelClass, table);
    }

    protected String sqlSelectColumns(TableInfo table, boolean entityWrapper, String columnPrefix, String selectProfix) {
        StringBuilder columns = new StringBuilder();
        if (null != table.getResultMap()) {
            if (entityWrapper) {
                columns.append("<choose><when test=\"ew != null and ew.sqlSelect != null\">${ew.sqlSelect}</when><otherwise>");
            }

            columns.append("*");
            if (entityWrapper) {
                columns.append("</otherwise></choose>");
            }
        } else {
            if (entityWrapper) {
                columns.append("<choose><when test=\"ew != null and ew.sqlSelect != null\">${ew.sqlSelect}</when><otherwise>");
            }

            List<TableFieldInfo> fieldList = table.getFieldList();
            int size = 0;
            if (null != fieldList) {
                size = fieldList.size();
            }

            if (StringUtils.isNotEmpty(table.getKeyProperty())) {
                if(PublicUtil.isNotEmpty(columnPrefix)){
                    columns.append(columnPrefix).append(".");
                }
                String keyProperty = table.getKeyProperty();
                if(PublicUtil.isNotEmpty(selectProfix)){
                    keyProperty = selectProfix+"."+keyProperty;
                }
                if (table.isKeyRelated()) {

                    columns.append(table.getKeyColumn()).append(" AS ").append(this.sqlWordConvert(keyProperty));
                } else {
                    columns.append(this.sqlWordConvert(keyProperty));
                }

                if (size >= 1) {
                    columns.append(",");
                }
            }

            if (size >= 1) {
                int i = 0;

                for(Iterator iterator = fieldList.iterator(); iterator.hasNext(); ++i) {
                    TableFieldInfo fieldInfo = (TableFieldInfo)iterator.next();
                    String property = fieldInfo.getProperty();
                    if(PublicUtil.isNotEmpty(selectProfix)){
                        property = selectProfix+"."+property;
                    }
                    String wordConvert = this.sqlWordConvert(property);
                    if(PublicUtil.isNotEmpty(columnPrefix)){
                        columns.append(columnPrefix).append(".");
                    }
                    if (fieldInfo.getColumn().equals(wordConvert)) {
                        columns.append(wordConvert);
                    } else {
                        columns.append(fieldInfo.getColumn());
                        columns.append(" AS ").append(wordConvert);
                    }

                    if (i + 1 < size) {
                        columns.append(",");
                    }
                }
            }

            if (entityWrapper) {
                columns.append("</otherwise></choose>");
            }
        }

        return columns.toString();
    }

    protected String sqlWordConvert(String convertStr) {
        GlobalConfiguration globalConfig = GlobalConfigUtils.getGlobalConfig(this.configuration);
        return SqlReservedWords.convertQuote(globalConfig, convertStr);
    }

    protected String sqlWhereEntityWrapper(TableInfo table, String columnPrefix) {
        StringBuilder where = new StringBuilder(128);
        where.append("\n<where>");
        where.append("\n<choose><when test=\"ew!=null\">");
        where.append("\n<if test=\"ew.entity!=null\">");
        if (StringUtils.isNotEmpty(table.getKeyProperty())) {
            where.append("\n<if test=\"ew.entity.").append(table.getKeyProperty()).append("!=null\">\n");
            if(PublicUtil.isNotEmpty(columnPrefix)){
                where.append(columnPrefix).append(".");
            }
            where.append(table.getKeyColumn()).append("=#{ew.entity.").append(table.getKeyProperty()).append("}");
            where.append("\n</if>");
        }

        List<TableFieldInfo> fieldList = table.getFieldList();
        Iterator i$ = fieldList.iterator();

        while(i$.hasNext()) {
            TableFieldInfo fieldInfo = (TableFieldInfo)i$.next();
            where.append(this.convertIfTag(fieldInfo, "ew.entity.", false));
            where.append(" AND ");
            if(PublicUtil.isNotEmpty(columnPrefix)){
                where.append(columnPrefix).append(".");
            }
            where.append(this.sqlCondition(fieldInfo.getCondition(), fieldInfo.getColumn(), "ew.entity." + fieldInfo.getEl()));
            where.append(this.convertIfTag(fieldInfo, true));
        }

        where.append("\n</if>");
        where.append("\n").append(this.getLogicDeleteSql(table, columnPrefix));
        where.append("\n<if test=\"ew.sqlSegment!=null\">${ew.sqlSegment}\n</if>");
        where.append("\n</when><otherwise>");
        where.append("\n").append(this.getLogicDeleteSql(table, columnPrefix));
        where.append("\n</otherwise></choose>");
        where.append("\n</where>");
        return where.toString();
    }
    /**
     * <p>
     * SQL 更新 set 语句
     * </p>
     *
     * @param table 表信息
     * @return sql and 片段
     */
    public String getLogicDeleteSql(TableInfo table, String columnPrefix) {
        StringBuilder sql = new StringBuilder();
        List<TableFieldInfo> fieldList = table.getFieldList();
        for (TableFieldInfo fieldInfo : fieldList) {
            if (fieldInfo.isLogicDelete()) {
                sql.append(" AND ");
                if(PublicUtil.isNotEmpty(columnPrefix)){
                    sql.append(columnPrefix).append(".");
                }
                sql.append(fieldInfo.getColumn()).append("!=");
                if (StringUtils.isCharSequence(fieldInfo.getPropertyType())) {
                    sql.append("'").append(fieldInfo.getLogicDeleteValue()).append("'");
                } else {
                    sql.append(fieldInfo.getLogicDeleteValue());
                }
            }
        }
        return sql.toString();
    }
    /**
     * <p>
     * SQL 更新 set 语句
     * </p>
     *
     * @param table 表信息
     * @return sql and 片段
     */
    public String getLogicDeleteSql(TableInfo table) {
        return getLogicDeleteSql(table, null);
    }

}
