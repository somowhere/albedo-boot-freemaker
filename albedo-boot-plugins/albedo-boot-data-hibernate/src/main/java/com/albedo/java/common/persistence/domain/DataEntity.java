package com.albedo.java.common.persistence.domain;

import com.albedo.java.util.PublicUtil;
import com.alibaba.fastjson.annotation.JSONField;
import io.swagger.annotations.ApiModelProperty;
import org.hibernate.envers.Audited;
import org.hibernate.validator.constraints.Length;
import org.springframework.data.annotation.*;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Column;
import javax.persistence.EntityListeners;
import javax.persistence.MappedSuperclass;
import javax.xml.bind.annotation.XmlTransient;
import java.util.Date;

/**
 * Base abstract class for entities which will hold definitions for created, last modified by and created,
 * last modified by date.
 */
@MappedSuperclass
@Audited
@EntityListeners(AuditingEntityListener.class)
public abstract class DataEntity extends BaseEntity {

    private static final long serialVersionUID = 1L;


    @CreatedBy
    @Column(name = "created_by", nullable = false, length = 50, updatable = false)
    @JSONField(serialize = false)
    @ApiModelProperty(hidden = true)
    protected String createdBy;

    @CreatedDate
    @Column(name = "created_date", nullable = false)
    @ApiModelProperty(hidden = true)
    protected Date createdDate = PublicUtil.getCurrentDate();

    @LastModifiedBy
    @Column(name = "last_modified_by", length = 50)
    @ApiModelProperty(hidden = true)
    protected String lastModifiedBy;

    @LastModifiedDate
    @Column(name = "last_modified_date")
    @ApiModelProperty(hidden = true)
    protected Date lastModifiedDate = PublicUtil.getCurrentDate();

    /*** 默认0，必填，离线乐观锁 */
    @Version
    @Column(name = "version_")
    @JSONField(serialize = false)
    @XmlTransient
    @ApiModelProperty(hidden = true)
    protected Integer version = 0;

    /*** 备注 */
    @Length(min = 0, max = 255)
    @Column(name = "description_")
    @XmlTransient
    protected String description;


    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getLastModifiedBy() {
        return lastModifiedBy;
    }

    public void setLastModifiedBy(String lastModifiedBy) {
        this.lastModifiedBy = lastModifiedBy;
    }

    public Date getLastModifiedDate() {
        return lastModifiedDate;
    }

    public void setLastModifiedDate(Date lastModifiedDate) {
        this.lastModifiedDate = lastModifiedDate;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
