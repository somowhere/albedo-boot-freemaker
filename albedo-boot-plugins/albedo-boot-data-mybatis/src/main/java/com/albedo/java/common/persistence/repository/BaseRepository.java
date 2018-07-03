/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.albedo.java.common.persistence.repository;

import com.albedo.java.common.persistence.domain.GeneralEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.io.Serializable;
import java.util.List;
import java.util.Optional;

/**
 * DAO支持类实现
 *
 * @author somewhere
 * @version 2018-03-07
 */
public interface BaseRepository<T extends GeneralEntity, pk extends Serializable> extends
    BaseMapper<T> {

    /**
     * BaseRepository
     * 使用Wrapper 需要指定前缀 getClassNameProfix()
     * @author admin
     * @version 2018-03-07
     */
    List<T> findRelationList(@Param("ew") Wrapper<T> wrapper);


    /**
     * <p>
     * 根据 entity 条件，查询全部记录（并翻页）
     * </p>
     *
     * @param rowBounds 分页查询条件（可以为 RowBounds.DEFAULT）
     * @param wrapper   实体对象封装操作类（可以为 null）
     * @return List<T>
     */
    List<T> findRelationPage(RowBounds rowBounds, @Param("ew") Wrapper<T> wrapper);

}
