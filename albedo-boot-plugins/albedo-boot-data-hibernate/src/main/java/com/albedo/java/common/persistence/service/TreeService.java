package com.albedo.java.common.persistence.service;

import com.albedo.java.common.persistence.domain.TreeEntity;
import com.albedo.java.common.persistence.repository.TreeRepository;
import com.albedo.java.util.PublicUtil;
import com.albedo.java.util.base.Assert;
import com.albedo.java.vo.sys.query.TreeQuery;
import com.albedo.java.vo.sys.query.TreeResult;
import com.google.common.collect.Lists;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;


@Transactional
public class TreeService<Repository extends TreeRepository<T, PK>, T extends TreeEntity<T>, PK extends Serializable>
        extends DataService<Repository, T, PK>{

    @Transactional(readOnly = true, rollbackFor = Exception.class)
    public List<TreeResult> findTreeData(TreeQuery query) {
        String extId = query != null ? query.getExtId() : null, all = query != null ? query.getAll() : null;
        List<TreeResult> mapList = Lists.newArrayList();
        List<T> list = repository.findAllByStatusNotOrderBySort(TreeEntity.FLAG_DELETE);
        TreeResult treeResult = null;
        for (T e : list) {
            if ((PublicUtil.isEmpty(extId)
                    || PublicUtil.isEmpty(e.getParentIds()) || (PublicUtil.isNotEmpty(extId) && !extId.equals(e.getId()) && e.getParentIds() != null && e.getParentIds().indexOf("," + extId + ",") == -1))
                    && (all != null || (all == null && TreeEntity.FLAG_NORMAL.equals(e.getStatus())))) {
                treeResult = new TreeResult();
                treeResult.setId(e.getId());
                treeResult.setPid(PublicUtil.isEmpty(e.getParentId()) ? "0" : e.getParentId());
                treeResult.setLabel(e.getName());
                treeResult.setKey(e.getName());
                treeResult.setValue(e.getId());
                mapList.add(treeResult);
            }
        }
        return mapList;
    }

    /**
     * 逻辑删除
     *
     * @param id
     * @param likeParentIds
     * @return
     */
    public int deleteById(PK id, String likeParentIds, String lastModifiedBy) {
        Assert.assertNotNull(id, "ids 信息为空，操作失败");
        Assert.assertNotNull(likeParentIds, "likeParentIds 信息为空，操作失败");
        Assert.assertNotNull(lastModifiedBy, "lastModifiedBy 信息为空，操作失败");
        return operateStatusById(id, likeParentIds, TreeEntity.FLAG_DELETE, lastModifiedBy);
    }
    /**
     * 逻辑删除，更新子节点
     *
     * @param ids
     * @param lastModifiedBy
     * @return
     */
    public void deleteByParentIds(List<PK> ids, String lastModifiedBy) {
        Assert.assertNotNull(ids, "ids 信息为空，操作失败");
        Assert.assertNotNull(lastModifiedBy, "lastModifiedBy 信息为空，操作失败");
        ids.forEach(id ->deleteByParentIds(id, lastModifiedBy));
    }
    /**
     * 逻辑删除，更新子节点
     *
     * @param id
     * @param lastModifiedBy
     * @return
     */
    public void deleteByParentIds(PK id, String lastModifiedBy) {
        Assert.assertNotNull(id, "id 信息为空，操作失败");
        Assert.assertNotNull(lastModifiedBy, "lastModifiedBy 信息为空，操作失败");
        T entity = repository.findOne(id);
        operateStatusById(id, PublicUtil.toAppendStr(entity.getParentIds(), entity.getId(),","), TreeEntity.FLAG_DELETE, lastModifiedBy);
    }
    /**
     * 锁定/启用，更新子节点
     *
     * @param id
     * @param lastModifiedBy
     * @return
     */
    public void lockOrUnLockByParentIds(PK id, String lastModifiedBy) {
        Assert.assertNotNull(id, "id 信息为空，操作失败");
        Assert.assertNotNull(lastModifiedBy, "lastModifiedBy 信息为空，操作失败");
            T entity = repository.findOne(id);
            Assert.assertNotNull(entity, "对象 " + id + " 信息为空，操作失败");
            operateStatusById(id, PublicUtil.toAppendStr(entity.getParentIds(), entity.getId(),","), TreeEntity.FLAG_NORMAL.equals(entity.getStatus()) ? TreeEntity.FLAG_UNABLE : TreeEntity.FLAG_NORMAL, lastModifiedBy);
            log.debug("LockOrUnLock Entity: {}", entity);
    }
    /**
     * 锁定/启用，更新子节点
     *
     * @param ids
     * @param lastModifiedBy
     * @return
     */
    public void lockOrUnLockByParentIds(List<PK> ids, String lastModifiedBy) {
        Assert.assertNotNull(ids, "ids 信息为空，操作失败");
        Assert.assertNotNull(lastModifiedBy, "lastModifiedBy 信息为空，操作失败");
        ids.forEach(id -> lockOrUnLockByParentIds(id, lastModifiedBy));
    }

    public int operateStatusById(PK id, String likeParentIds, Integer status, String lastModifiedBy) {
        Assert.assertNotNull(id, "id 信息为空，操作失败");
        Assert.assertNotNull(likeParentIds, "likeParentIds 信息为空，操作失败");
        Assert.assertNotNull(status, "status 信息为空，操作失败");
        Assert.assertNotNull(lastModifiedBy, "lastModifiedBy 信息为空，操作失败");
        return baseRepository.createQuery(
                PublicUtil.toAppendStr("update ", getPersistentClass().getSimpleName(), " set status='", status,
                        "', lastModifiedBy=:p3, lastModifiedDate=:p4 where (id = :p1 or parentIds like :p2) and status!=:p5"),
                id, likeParentIds, lastModifiedBy, PublicUtil.getCurrentDate(), TreeEntity.FLAG_DELETE).executeUpdate();
    }

    @Override
    public T save(T entity) {
        Assert.assertNotNull(entity, "entity 信息为空，操作失败");
        // 获取修改前的parentIds，用于更新子节点的parentIds
        String oldParentIds = entity.getParentIds();
        if (entity.getParentId() != null) {
            T parent = repository.findOne((PK) entity.getParentId());
//            if (parent == null || PublicUtil.isEmpty(parent.getId()))
//                throw new RuntimeMsgException("无法获取模块的父节点，插入失败");
            if (parent != null) {
                parent.setLeaf(false);
                repository.save(parent);
                entity.setParentIds(PublicUtil.toAppendStr(parent.getParentIds(), parent.getId(), ","));
            }
        }

        if (PublicUtil.isNotEmpty(entity.getId())) {
            T itemTemp = repository.findFirstByParentId(entity.getId());
            entity.setLeaf(itemTemp == null ? true : false);
        } else {
            entity.setLeaf(true);
        }
        entity = repository.save(entity);
        // 更新子节点 parentIds
        List<T> list = repository.findAllByParentIdsLike(PublicUtil.toAppendStr("%,", entity.getId(), ",%"));
        if(PublicUtil.isNotEmpty(list)){
            for (T e : list) {
                e.setParentIds(e.getParentIds().replace(oldParentIds, entity.getParentIds()));
            }
            repository.save(list);
        }
        log.debug("Save Information for T: {}", entity);
        return entity;
    }

    @Transactional(readOnly = true, rollbackFor = Exception.class)
    public T findTopByParentId(String parentId) {
        List<T> tempList = repository.findTop1ByParentIdAndStatusNotOrderBySortDesc(parentId, TreeEntity.FLAG_DELETE);
        return PublicUtil.isNotEmpty(tempList) ? tempList.get(0) : null;
    }

    @Transactional(readOnly = true, rollbackFor = Exception.class)
    public Long countTopByParentId(String parentId) {
        return repository.countByParentIdAndStatusNot(parentId, TreeEntity.FLAG_DELETE);
    }
}
