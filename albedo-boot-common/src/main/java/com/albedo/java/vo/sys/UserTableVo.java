package com.albedo.java.vo.sys;

import com.albedo.java.util.annotation.DictType;
import com.albedo.java.util.base.Collections3;
import com.albedo.java.vo.base.DataEntityVo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.validation.constraints.Size;
import java.io.Serializable;
import java.time.ZonedDateTime;
import java.util.Date;
import java.util.List;

/**
 * A user.
 */
@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class UserTableVo  implements Serializable {


    private static final long serialVersionUID = 1L;
    private String id;
    private String orgName;
    private String orgParentName;
    private String loginId;
    private String name;
    private String phone;
    private String email;
    private String roleNames;
    @DictType(name="sys_status")
    private String status;
    private Date lastModifiedDate;

}
