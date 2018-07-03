package com.albedo.java.common.persistence.handler;

import com.albedo.java.common.persistence.domain.DataEntity;
import com.albedo.java.util.PublicUtil;
import com.albedo.java.util.base.Assert;
import com.baomidou.mybatisplus.mapper.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.data.domain.AuditorAware;

import java.util.Date;

public class EntityMetaObjectHandler extends MetaObjectHandler {

   private final AuditorAware auditorAware;

    public EntityMetaObjectHandler(AuditorAware auditorAware) {
        Assert.assertIsTrue(auditorAware!=null, "auditorAware is not defined");
        this.auditorAware = auditorAware;
    }


    @Override
    public void insertFill(MetaObject metaObject) {
        setFieldValByName(DataEntity.F_CREATEDBY, auditorAware.getCurrentAuditor(), metaObject);
        Date date = PublicUtil.getCurrentDate();
        setFieldValByName(DataEntity.F_CREATEDDATE, date, metaObject);
        setFieldValByName(DataEntity.F_LASTMODIFIEDBY, auditorAware.getCurrentAuditor(), metaObject);
        setFieldValByName(DataEntity.F_LASTMODIFIEDDATE, date, metaObject);

    }

    @Override
    public void updateFill(MetaObject metaObject) {
        Date date = PublicUtil.getCurrentDate();
        setFieldValByName(DataEntity.F_LASTMODIFIEDBY, auditorAware.getCurrentAuditor(), metaObject);
        setFieldValByName(DataEntity.F_LASTMODIFIEDDATE, date, metaObject);
    }
}
