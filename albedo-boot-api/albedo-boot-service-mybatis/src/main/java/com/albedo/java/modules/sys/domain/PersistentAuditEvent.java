package com.albedo.java.modules.sys.domain;

import com.albedo.java.common.persistence.domain.GeneralEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Persist AuditEvent managed by the Spring Boot actuator
 *
 *
 */
@TableName("jhi_persistent_audit_event")
@Data
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class PersistentAuditEvent extends GeneralEntity<PersistentAuditEvent> {


    public static final String F_AUDITEVENTDATE = "auditEventDate";
    public static final String F_PRINCIPAL = "principal";
    public static final String F_AUDITEVENTTYPE = "auditEventType";

    public static final String F_SQL_AUDITEVENTDATE = "event_date";
    public static final String F_SQL_PRINCIPAL = "principal";
    public static final String F_SQL_AUDITEVENTTYPE = "auditEventType";

    @TableId(value = "event_id", type = IdType.AUTO)
    private Long id;

    @NotNull
    @TableField
    private String principal;

    @TableField(PersistentAuditEvent.F_SQL_AUDITEVENTDATE)
    private Date auditEventDate;
    @TableField("event_type")
    private String auditEventType;

//    @ElementCollection
//    @MapKeyTableField("name")
//    @TableField("value")
//    @CollectionTable(name = "jhi_persistent_audit_evt_data", joinColumns=@JoinColumn(name="event_id"))
    @TableField(exist = false)
    private Map<String, String> data = new HashMap<>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPrincipal() {
        return principal;
    }

    public void setPrincipal(String principal) {
        this.principal = principal;
    }

    public Date getAuditEventDate() {
        return auditEventDate;
    }

    public void setAuditEventDate(Date auditEventDate) {
        this.auditEventDate = auditEventDate;
    }

    public String getAuditEventType() {
        return auditEventType;
    }

    public void setAuditEventType(String auditEventType) {
        this.auditEventType = auditEventType;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    public Map<String, String> getData() {
        return data;
    }

    public void setData(Map<String, String> data) {
        this.data = data;
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
