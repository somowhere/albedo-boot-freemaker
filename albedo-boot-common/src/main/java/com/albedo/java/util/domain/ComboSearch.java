package com.albedo.java.util.domain;

import lombok.Data;

import java.io.Serializable;

@Data
public class ComboSearch implements Serializable {

    private static final long serialVersionUID = 1L;
    /**下拉列表隐藏值*/
    private String id;
    /**下拉列表显示值*/
    private String name;
    /**树形结构父节点*/
    private String parentId;
    /**数据源地址*/
    private String url;
    /**目标*/
    private String target;
    /**数据源地址Hql 拼接条件*/
    private String where;
    /**实体名称*/
    private String module;
    /**是否显示复选框*/
    private String ckecked;
    /**排除掉的编号（不能选择的编号）*/
    private String extId;
    /**默认选择值*/
    private String selectIds;

}
