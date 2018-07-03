package com.albedo.java.vo.sys;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.Serializable;

/**
 * 业务表Entity
 *
 * @author somewhere
 * @version 2013-10-15
 */
@Data
@ToString
@NoArgsConstructor
public class ModuleFormVo implements Serializable {

    private static final long serialVersionUID = 1L;
    /*** 编码 */
    private String id;
    // 名称
    /*** 父节点 */
    private String parentId;

}
