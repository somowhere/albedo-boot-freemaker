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
public class RoleModule extends GeneralEntity<RoleModule> {

    /*** F_USERID */
    public static final String F_USERID = "userId";
    /*** F_ROLEID */
    public static final String F_ROLEID = "roleId";

    private static final long serialVersionUID = 1L;
    @NotBlank
    @TableField("user_id")
    private String userId;

    @NotBlank
    @TableField("role_id")
    private String roleId;

    @Override
    protected Serializable pkVal() {
        return this.userId;
    }
}
