package com.albedo.java.common.persistence.domain;

import com.albedo.java.util.PublicUtil;
import com.albedo.java.util.annotation.SearchField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;
import java.util.Objects;


public class IdEntity<T extends BaseEntity, PK extends Serializable> extends DataEntity<T> {

    private static final long serialVersionUID = 1L;
    @SearchField
    @TableId(value = GeneralEntity.F_SQL_ID, type = IdType.UUID)
    protected PK id; // 编号

    public IdEntity() {
        super();
    }

    @Override
    protected Serializable pkVal() {
        return getId();
    }

    public PK getId() {
        return id;
    }

    public void setId(PK id) {
        if (PublicUtil.isNotEmpty(id)) this.id = id;
    }
    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        IdEntity idEntity = (IdEntity) o;
        if (idEntity.getId() == null || getId() == null) {
            return false;
        }
        return Objects.equals(getId(), idEntity.getId());
    }
    @Override
    public int hashCode() {
        return Objects.hashCode(getId());
    }
}
