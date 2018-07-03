package com.albedo.java.modules.sys.domain;

import com.albedo.java.common.persistence.domain.GeneralEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.hibernate.validator.constraints.NotBlank;

import java.io.Serializable;

/**
 * A user.
 */
@TableName("sys_user_role_t")
@Data
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class UserRole extends GeneralEntity<UserRole> {

    /*** F_USERID */
    public static final String F_USERID = "userId";
    /*** F_ROLEID */
    public static final String F_ROLEID = "roleId";

    private static final long serialVersionUID = 1L;

    @NotBlank
    @TableField("role_id")
    private String roleId;

    @NotBlank
    @TableField("org_id")
    private String orgId;

    @Override
    protected Serializable pkVal() {
        return this.roleId;
    }
}
