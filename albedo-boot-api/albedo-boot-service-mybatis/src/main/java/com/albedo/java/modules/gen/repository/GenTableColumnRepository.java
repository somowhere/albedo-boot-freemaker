package com.albedo.java.modules.gen.repository;

import com.albedo.java.common.persistence.repository.BaseRepository;
import com.albedo.java.modules.gen.domain.GenTableColumn;
import com.albedo.java.modules.sys.domain.Role;

import java.util.List;
import java.util.Set;

/**
 * Spring Data JPA repository for the Authority entity.
 */
public interface GenTableColumnRepository extends BaseRepository<GenTableColumn, String> {



//    Set<Role> selectListByTableId(String tableId);
}
