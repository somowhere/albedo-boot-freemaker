package com.albedo.java.vo.sys.query;

import com.albedo.java.util.base.Encodes;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.ToString;

/**
 * Created by somewhere on 2017/3/2.
 */
@Data
@ApiModel
@ToString
public class DictQuerySearch {

    private String dictQueries;

    public void setDictQueries(String dictQueries) {
        this.dictQueries = Encodes.unescapeHtml(dictQueries);
    }

}
