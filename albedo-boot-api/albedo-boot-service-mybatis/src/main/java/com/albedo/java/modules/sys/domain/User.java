package com.albedo.java.modules.sys.domain;

import com.albedo.java.common.persistence.annotation.ManyToOne;
import com.albedo.java.common.persistence.domain.IdEntity;
import com.albedo.java.util.PublicUtil;
import com.albedo.java.util.annotation.DictType;
import com.albedo.java.util.annotation.SearchField;
import com.albedo.java.util.domain.Globals;
import com.alibaba.fastjson.annotation.JSONField;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.List;
import java.util.Set;

/**
 * A user.
 */
@TableName(value = "sys_user_t")
@Data
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class User extends IdEntity<User, String> {

    /*** F_LOGINID */
    public static final String F_LOGINID = "loginId";
    /*** F_LOGINID */
    public static final String F_EMAIL = "email";
    private static final long serialVersionUID = 1L;
    /*** 头像 */
    @TableField("avatar_")
    private String avatar;
    @NotBlank
    @Pattern(regexp = Globals.LOGIN_REGEX)
    @Size(min = 1, max = 50)
    @TableField("login_id")
    @SearchField
    private String loginId;

    @JSONField(serialize = false)
    @NotBlank
    @Size(min = 60, max = 60)
    @TableField("password_hash")
    private String password;

    @Size(max = 32)
    @TableField("org_id")
    private String orgId;

    @ManyToOne(name = "org_id")
    @TableField(exist = false)
    private Org org;

    @Size(max = 50)
    @TableField("name_")
    private String name;
    @Size(max = 50)
    @TableField("phone_")
    @SearchField
    private String phone;
    @Email
    @Size(max = 100)
    @SearchField
    @TableField("email_")
    private String email;

    @TableField("type_")
    @DictType(name="sys_user_type")
    private String type;
    @TableField("key_")
    private String key;

    @Size(min = 2, max = 5)
    @TableField("lang_key")
    private String langKey;

    @Size(max = 500)
    @TableField("property_")
    @JSONField(serialize = false)
    private String property;

    @Size(max = 20)
    @TableField("reset_key")
    private String resetKey;

    @TableField("reset_date")
    private Date resetDate = null;

    @TableField(exist = false)
    private String roleNames;

    @TableField(exist = false)
    private List<String> roleIdList;

    @TableField(exist = false)
    private List<Role> roles = Lists.newArrayList();

    public User(String id) {
        this.id = id;
    }


    public List<String> getRoleIdList() {
        if (PublicUtil.isEmpty(roleIdList) && PublicUtil.isNotEmpty(roles)) {
            roleIdList = Lists.newArrayList();
            roles.forEach(m -> {
                if (PublicUtil.isNotEmpty(m)) roleIdList.add(m.getId());
            });
        }
        return roleIdList;
    }

    public void setRoleIdList(List<String> roleIdList) {
        this.roleIdList = roleIdList;
        if (PublicUtil.isNotEmpty(roleIdList)) {
            roles = Lists.newArrayList();
            roleIdList.forEach(m -> {
                if (PublicUtil.isNotEmpty(m)) {
                    roles.add(new Role(m));
                }
            });
        }
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
        this.org=new Org(orgId);
    }

    @Override
    public boolean equals(Object o) {
        return super.equals(o);
    }
    @Override
    public int hashCode() {
        return super.hashCode();
    }
}
