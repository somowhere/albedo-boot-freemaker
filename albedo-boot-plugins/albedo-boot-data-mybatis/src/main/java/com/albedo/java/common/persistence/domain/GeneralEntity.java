package com.albedo.java.common.persistence.domain;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import com.albedo.java.util.config.SystemConfig;
import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.springframework.data.annotation.Transient;

import javax.xml.bind.annotation.XmlTransient;
import java.io.Serializable;
import java.util.Map;

/**
 * 通常的数据基类 copyright 2014 albedo all right reserved author somewhere created on 2014年12月31日 下午1:57:09
 */

@Data
public abstract class GeneralEntity<T extends Model>  extends Model<T> implements Serializable {

    /*** 状态 审核 */
    public static final Integer FLAG_AUDIT = 1;
    /*** 状态 正常 */
    public static final Integer FLAG_NORMAL = 0;
    /*** 状态 停用 */
    public static final Integer FLAG_UNABLE = -1;
    /*** 状态 已删除 */
    public static final Integer FLAG_DELETE = -2;
    /**
     * 状态（-2：删除；-1：停用 0：正常 1:审核）
     */
    public static final String F_STATUS = "status";
    /*** ID */
    public static final String F_ID = "id";
    public static final String F_CREATEDBY = "createdBy";
    public static final String F_CREATOR = "creator";
    public static final String F_CREATEDDATE = "createdDate";
    public static final String F_LASTMODIFIEDBY = "lastModifiedBy";
    public static final String F_MODIFIER = "modifier";
    public static final String F_LASTMODIFIEDDATE = "lastModifiedDate";
    public static final String F_VERSION = "version";
    public static final String F_DESCRIPTION = "description";

    public static final String F_SQL_ID = "id_";
    public static final String F_SQL_CREATEDBY = "created_by";
    public static final String F_SQL_CREATEDDATE = "created_date";
    public static final String F_SQL_LASTMODIFIEDBY = "last_modified_by";
    public static final String F_SQL_MODIFIER = "modifier";
    public static final String F_SQL_LASTMODIFIEDDATE = "last_modified_date";
    public static final String F_SQL_VERSION = "version_";
    public static final String F_SQL_DESCRIPTION = "description_";
    public static final String F_SQL_STATUS = "status_";
    private static final long serialVersionUID = 1L;


    @Transient
    @JSONField(serialize = false)
    @TableField(exist = false)
    protected String dbName = SystemConfig.get("jdbc.type");




}
