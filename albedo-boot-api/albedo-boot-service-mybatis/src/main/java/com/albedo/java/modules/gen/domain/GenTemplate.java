package com.albedo.java.modules.gen.domain;

import com.albedo.java.common.persistence.domain.IdEntity;
import com.albedo.java.util.StringUtil;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.google.common.collect.Lists;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import java.util.List;

/**
 * 生成方案Entity
 *
 * @version 2013-10-15
 */
@TableName("gen_template_t")
@Data
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class GenTemplate extends IdEntity<GenTemplate, String> {

    public static final String F_NAME = "name";
    private static final long serialVersionUID = 1L;
    @Length(min = 1, max = 200)
    @TableField("name_")
    private String name; // 名称
    @TableField("category_")
    private String category; // 分类
    @TableField("file_path")
    private String filePath; // 生成文件路径
    @TableField("file_name")
    private String fileName; // 文件名
    @TableField("content_")
    private String content; // 内容

    private boolean ignoreOutput;

    public GenTemplate(String id) {
        super();
        this.id = id;

    }

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
