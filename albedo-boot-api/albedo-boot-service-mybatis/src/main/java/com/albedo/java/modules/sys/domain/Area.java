/**
 * Copyright &copy; 2015 <a href="http://www.bs-innotech.com/">bs-innotech</a> All rights reserved.
 */
package com.albedo.java.modules.sys.domain;

import com.albedo.java.common.persistence.domain.TreeEntity;
import com.albedo.java.util.annotation.DictType;
import com.albedo.java.util.annotation.SearchField;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;

/**
 * 区域管理Entity 区域管理
 *
 * @author admin
 * @version 2017-01-01
 */
@TableName("sys_area_t")
@Data
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Area extends TreeEntity<Area> {

    /**
     * F_SHORTNAME short_name  :  区域简称
     */
    public static final String F_SHORTNAME = "shortName";
    /**
     * F_LEVEL level_  :  区域等级
     */
    public static final String F_LEVEL = "level";
    /**
     * F_CODE code_  :  区域编码
     */
    public static final String F_CODE = "code";
    private static final long serialVersionUID = 1L;

    //columns START
    /**
     * shortName 区域简称
     */
    @Length(max = 32)
    @TableField("short_name")
    private String shortName;
    /**
     * level 区域等级
     */
    @TableField("level_")
    @DictType(name = "sys_area_type")
    private Integer level;
    /**
     * code 区域编码
     */
    @Length(max = 32)
    @TableField("code_")
    @SearchField
    @NotNull
    private String code;

    //columns END
    public Area(String id) {
        this.id = id;
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
