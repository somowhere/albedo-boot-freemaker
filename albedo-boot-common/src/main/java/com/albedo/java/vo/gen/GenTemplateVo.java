package com.albedo.java.vo.gen;

import com.albedo.java.util.PublicUtil;
import com.albedo.java.util.StringUtil;
import com.albedo.java.util.base.Collections3;
import com.albedo.java.util.config.SystemConfig;
import com.albedo.java.vo.base.DataEntityVo;
import com.alibaba.fastjson.annotation.JSONField;
import com.google.common.collect.Lists;
import lombok.Data;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import java.util.List;

/**
 * 业务表Entity
 *
 * @author somewhere
 * @version 2013-10-15
 */
@XmlRootElement(name = "template")
@Data
@ToString
public class GenTemplateVo {

    public static final String F_NAME = "name";
    private static final long serialVersionUID = 1L;
    @Length(min = 1, max = 200)
    private String name; // 名称
    private String category; // 分类
    private String filePath; // 生成文件路径
    private String fileName; // 文件名
    private String content; // 内容

    private boolean ignoreOutput;

    @XmlTransient
    public String getCategory() {
        return category;
    }

    public List<String> getCategoryList() {
        if (category == null) {
            return Lists.newArrayList();
        } else {
            return Lists.newArrayList(StringUtil.split(category, ","));
        }
    }

    public void setCategoryList(List<String> categoryList) {
        if (categoryList == null) {
            this.category = "";
        } else {
            this.category = "," + StringUtil.join(categoryList, ",") + ",";
        }
    }
}
