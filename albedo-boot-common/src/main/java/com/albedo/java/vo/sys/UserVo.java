package com.albedo.java.vo.sys;

import com.albedo.java.util.annotation.BeanField;
import com.albedo.java.util.base.Collections3;
import com.albedo.java.vo.base.DataEntityVo;
import com.alibaba.fastjson.annotation.JSONField;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.validation.constraints.Size;
import java.time.ZonedDateTime;
import java.util.List;

/**
 * A user.
 */
@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class UserVo extends DataEntityVo<String> {

    public static final int PASSWORD_MIN_LENGTH = 6;

    public static final int PASSWORD_MAX_LENGTH = 64;

    /*** TYPE_SYSTEM 系统用户 */
    public static final String TYPE_SYSTEM = "system";
    /*** TYPE_APP_IOS ios */
    public static final String TYPE_APP_IOS = "ios";
    /*** TYPE_APP_ANDRIOD andriod */
    public static final String TYPE_APP_ANDRIOD = "andriod";
    /*** F_LOGINID */
    public static final String F_LOGINID = "loginId";
    /*** F_LOGINID */
    public static final String F_EMAIL = "email";
    public static final String F_PHONE = "phone";
    private static final long serialVersionUID = 1L;
    /*** 头像 */
    private String avatar;
    private String loginId;
    @Size(max = PASSWORD_MAX_LENGTH)
    private String password;
    private String confirmPassword;
    private String orgId;

    private String type;
    private String key;
    private String name;
    private String phone;

    private String email;

    private String langKey;

    private String property;

    private String resetKey;
    private ZonedDateTime resetDate = null;

    private List<String> roleIdList;
    private String roleNames;
    @BeanField(writeProperty = "org.name")
    private String orgName;
    @BeanField(writeProperty = "org.code")
    private String orgCode;

    private List<String> authorities;

    public String getRoleIds() {
        return Collections3.convertToString(getRoleIdList(), ",");
    }

}
