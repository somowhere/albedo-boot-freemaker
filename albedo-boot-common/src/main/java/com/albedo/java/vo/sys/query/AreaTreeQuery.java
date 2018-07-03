package com.albedo.java.vo.sys.query;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.ToString;

/**
 * Created by somewhere on 2017/3/2.
 */
@Data
@ApiModel
@ToString
public class AreaTreeQuery {

    private String all;
    private String parentId;
    private String extId;
    private Integer ltLevel;
    private Integer level;

}
