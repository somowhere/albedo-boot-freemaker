package com.albedo.java.modules.sys.repository;

import com.albedo.java.common.persistence.repository.BaseRepository;
import com.albedo.java.modules.sys.domain.Role;
import com.google.common.collect.Lists;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Set;

/**
 * Spring Data JPA repository for the Authority entity.
 */
public interface RoleRepository extends BaseRepository<Role, String> {

    void deleteRoleOrgs(@Param("role") Role role);

    void addRoleOrgs(@Param("role") Role role);

    void deleteRoleModules(@Param("role") Role role);

    void addRoleModules(@Param("role") Role role);

    List<Role> selectListByUserId(String userId);

}
