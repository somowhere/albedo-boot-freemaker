package com.albedo.java.modules.gen.domain;

import com.baomidou.mybatisplus.annotations.TableField;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * 业务表Entity
 *
 * @version 2013-10-15
 */
@Data
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class GenTableFk {

    @TableField("name_")
    private String name; // 名称
    @TableField("table_name")
    private String tableName; // 描述
    @TableField("table_fk")
    private String tableFk; // 外键列名
    @TableField("genTable.id")
    private GenTable genTable; // 归属表


}
