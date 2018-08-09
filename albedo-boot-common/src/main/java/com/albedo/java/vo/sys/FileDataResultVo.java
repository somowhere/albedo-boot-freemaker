/**
 * Copyright &copy; 2018 <a href="https://github.com/somewhereMrli/albedo-boot">albedo-boot</a> All rights reserved.
 */
package com.albedo.java.vo.sys;

import com.albedo.java.util.annotation.BeanField;
import com.albedo.java.vo.base.DataEntityVo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import java.io.Serializable;

/**
 * 文件管理EntityVo 文件
 * @author admin
 * @version 2018-08-06
 */
@Data @ToString @NoArgsConstructor @AllArgsConstructor
public class FileDataResultVo implements Serializable {

	private static final long serialVersionUID = 1L;
	/** F_NAME name_  :  名称 */
	public static final String F_NAME = "name";
	/** F_SIZE size_  :  大小 */
	public static final String F_SIZE = "size";
	/** F_TYPE type_  :  类型 */
	public static final String F_TYPE = "type";

	//columns START
    /** name 名称 */
    @Length(max=32)
    @BeanField(writeProperty = "id")
    private String id;
	/** name 名称 */
 @Length(max=32)
	private String name;
	/** size 大小 */
 @NotBlank @Length(max=50)
	private Long size;
	/** type 类型 */
 @Length(max=60)
	private String type;
	//columns END

    public FileDataResultVo(String id){
	    this.setId(id);
    }

}
