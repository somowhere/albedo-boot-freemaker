/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.albedo.java.common.persistence.service;

import com.albedo.java.common.persistence.DynamicSpecifications;
import com.albedo.java.common.persistence.SpecificationDetail;
import com.albedo.java.common.persistence.domain.BaseEntity;
import com.albedo.java.common.persistence.domain.DataEntity;
import com.albedo.java.common.persistence.repository.BaseRepository;
import com.albedo.java.util.PublicUtil;
import com.albedo.java.util.base.Assert;
import com.albedo.java.util.domain.ComboData;
import com.albedo.java.util.domain.ComboSearch;
import com.albedo.java.util.domain.PageModel;
import com.albedo.java.util.domain.QueryCondition;
import com.baomidou.mybatisplus.mapper.Condition;
import com.baomidou.mybatisplus.mapper.SqlHelper;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;

/**
 * Service基类
 *
 * @author lj
 * @version 2014-05-16
 */
@Transactional(rollbackFor = Exception.class)
public abstract class DataService<Repository extends BaseRepository<T, PK>, T extends DataEntity, PK extends Serializable>
        extends BaseService<Repository, T, PK> {

    @Transactional(readOnly = true, rollbackFor = Exception.class)
    @Override
    public T findOne(PK id) {
        return repository.selectById(id);
    }

    @Transactional(readOnly = true, rollbackFor = Exception.class)
    public T findRelationOne(Serializable id) {
        List<T> relationList = repository.findRelationList(Condition.create().eq(getClassNameProfix()+DataEntity.F_SQL_ID, id));
        return SqlHelper.getObject(relationList);
    }


    /**
     * 逻辑删除 集合
     *
     * @param idList
     * @return
     */
    public void deleteById(List<PK> idList) {
        for (PK id : idList) {
            deleteById(id);
        }
    }

    public void lockOrUnLock(List<PK> ids) {
        ids.forEach(id -> {
            T entity = repository.selectById(id);
            Assert.assertNotNull(entity, "对象 " + id + " 信息为空，操作失败");
            entity.setStatus(BaseEntity.FLAG_NORMAL.equals(entity.getStatus()) ? BaseEntity.FLAG_UNABLE : BaseEntity.FLAG_NORMAL);
            updateById(entity);
            log.debug("LockOrUnLock Entity: {}", entity);

        });
    }

    @Transactional(readOnly = true, rollbackFor = Exception.class)
    public PageModel<T> findPage(PageModel<T> pm) {
        return findPageQuery(pm, null);
    }

    @Transactional(readOnly = true, rollbackFor = Exception.class)
    public PageModel<T> findBasicPage(PageModel<T> pm) {
        return findPageQuery(pm, null);
    }

    @Transactional(readOnly = true, rollbackFor = Exception.class)
    public PageModel<T> findPage(PageModel<T> pm, List<QueryCondition> queryConditions) {
        return findPageQuery(pm, queryConditions);
    }

    @Transactional(readOnly = true, rollbackFor = Exception.class)
    public PageModel<T> findBasicPage(PageModel<T> pm, List<QueryCondition> queryConditions) {
        return findPageQuery(pm, queryConditions);
    }

    @Transactional(readOnly = true, rollbackFor = Exception.class)
    public PageModel<T> findPageQuery(PageModel<T> pm, List<QueryCondition> authQueryConditions) {
        SpecificationDetail<T> specificationDetail = DynamicSpecifications.buildSpecification(
            getPersistentClass(),
            pm.getQueryConditionJson()
//          ,QueryCondition.ne(BaseEntity.F_STATUS, BaseEntity.FLAG_DELETE)
        );
        if (PublicUtil.isNotEmpty(authQueryConditions)) {
            specificationDetail.orAll(authQueryConditions);
        }
        return findPage(pm, specificationDetail);
    }

    public List<ComboData> findJson(ComboSearch comboSearch) {
        return jpaCustomeRepository.findJson(comboSearch);
    }
}
