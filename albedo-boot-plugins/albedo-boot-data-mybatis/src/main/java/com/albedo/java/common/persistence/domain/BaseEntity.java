/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.albedo.java.common.persistence.domain;

import com.albedo.java.util.annotation.DictType;
import com.albedo.java.util.annotation.SearchField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableLogic;
import com.baomidou.mybatisplus.enums.FieldFill;
import io.swagger.annotations.ApiModelProperty;

/**
 * Entity支持类
 *
 * @author lj
 * @version 2014-05-16
 */
public abstract class BaseEntity<T extends GeneralEntity> extends GeneralEntity<T> {

    private static final long serialVersionUID = 1L;
    @TableField(value = "status_")
    @SearchField
    @DictType(name = "sys_status")
    @ApiModelProperty(hidden = true)
    @TableLogic(delval = "-2" )
    protected Integer status;

    public BaseEntity() {
        super();
        this.status = FLAG_NORMAL;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

}
