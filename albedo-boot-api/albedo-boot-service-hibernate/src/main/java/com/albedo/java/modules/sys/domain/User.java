package com.albedo.java.modules.sys.domain;

import com.albedo.java.common.persistence.domain.IdEntity;
import com.albedo.java.util.PublicUtil;
import com.albedo.java.util.annotation.SearchField;
import com.albedo.java.util.base.Collections3;
import com.albedo.java.util.domain.Globals;
import com.alibaba.fastjson.annotation.JSONField;
import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import io.swagger.annotations.ApiModelProperty;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.*;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.CascadeType;
import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.time.ZonedDateTime;
import java.util.List;
import java.util.Set;
/**
 * A user.
 */
@Entity
@Table(name = "sys_user_t")
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class User extends IdEntity<String> {

    /*** F_LOGINID */
    public static final String F_LOGINID = "loginId";
    /*** F_LOGINID */
    public static final String F_EMAIL = "email";
    private static final long serialVersionUID = 1L;
    @NotBlank
    @Pattern(regexp = Globals.LOGIN_REGEX)
    @Size(min = 1, max = 50)
    @Column(name = "login_id", length = 50, unique = true, nullable = false)
    @SearchField
    private String loginId;

    @Column(name = "avatar_", length = 225)
    private String avatar;

    @JSONField(serialize = false)
    @NotBlank
    @Size(min = 60, max = 60)
    @Column(name = "password_hash", length = 60)
    private String password;

    @Size(max = 32)
    @Column(name = "org_id", length = 32)
    private String orgId;

    @ManyToOne
    @JoinColumn(name = "org_id", updatable = false, insertable = false)
    @NotFound(action = NotFoundAction.IGNORE)
    @ApiModelProperty(hidden = true)
    private Org org;

    @Size(max = 50)
    @Column(name = "name_", length = 50)
    private String name;
    @Size(max = 50)
    @Column(name = "phone_", length = 50)
    private String phone;

    @Email
    @Size(max = 100)
    @Column(name = "email_", length = 100)
    @SearchField
    private String email;

    @NotNull
    @Column(name = "activated_", nullable = false)
    private boolean activated = false;
    @Size( max = 32)
    @Column(name = "type_")
    private String type;
    @Size( max = 500)
    @Column(name = "key_")
    private String key;

    @Size(min = 2, max = 5)
    @Column(name = "lang_key", length = 5)
    private String langKey;

    @Size(max = 20)
    @Column(name = "property_", length = 20)
    @JSONField(serialize = false)
    private String property;

    @Size(max = 20)
    @Column(name = "reset_key", length = 20)
    private String resetKey;

    @Column(name = "reset_date", nullable = true)
    private ZonedDateTime resetDate = null;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "sys_user_role_t",
            joinColumns = {@JoinColumn(name = "user_id", referencedColumnName = "id_")},
            inverseJoinColumns = {@JoinColumn(name = "role_id", referencedColumnName = "id_")})
    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @ApiModelProperty(hidden = true)
    private Set<Role> roles = Sets.newHashSet();

    @JSONField(serialize = false)
    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "user")
    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    @ApiModelProperty(hidden = true)
    private Set<PersistentToken> persistentTokens = Sets.newHashSet();

    @Transient
    @ApiModelProperty(hidden = true)
    private String roleNames;
    @Transient
    private List<String> roleIdList;


    /**
     * 用户拥有的角色名称字符串, 多个角色名称用','分隔.
     */
    public String getRoleNames() {
        if (PublicUtil.isEmpty(roleNames) && PublicUtil.isNotEmpty(roles)) {
            roleNames = Collections3.extractToString(roles, "name", ", ");
        }
        return roleNames;
    }

    public void setRoleNames(String roleNames) {
        this.roleNames = roleNames;
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
            roles = Sets.newHashSet();
            roleIdList.forEach(m -> {
                if (PublicUtil.isNotEmpty(m)) {
                    roles.add(new Role(m));
                }
            });
        }
    }

    public String getRoleIds() {
        return Collections3.convertToString(getRoleIdList(), ",");
    }


}
