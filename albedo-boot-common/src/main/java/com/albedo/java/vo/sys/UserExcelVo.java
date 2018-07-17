package com.albedo.java.vo.sys;

import com.albedo.java.util.annotation.ExcelField;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.hibernate.validator.constraints.NotBlank;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class UserExcelVo {
    @NotBlank
    @ExcelField(title = "机构名称",sort = 10)
    private String orgName;
    @NotBlank
    @ExcelField(title = "登录Id",sort = 20)
    private String loginId;

    private String password;
    @NotBlank
    @ExcelField(title = "姓名",sort = 30)
    private String name;
    @NotBlank
    @ExcelField(title = "手机",sort = 40)
    private String phone;
    @ExcelField(title = "邮箱",sort = 50)
    private String email;
    @NotBlank
    @ExcelField(title = "角色",sort = 60)
    private String roleNames;
    @NotBlank
    @ExcelField(title = "状态",sort = 70, dictType = "sys_status")
    private String status;
}
