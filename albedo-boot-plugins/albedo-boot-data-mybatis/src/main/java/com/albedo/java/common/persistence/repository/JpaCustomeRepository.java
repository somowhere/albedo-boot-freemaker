package com.albedo.java.common.persistence.repository;

import com.albedo.java.common.persistence.domain.GeneralEntity;
import com.albedo.java.util.domain.ComboSearch;
import com.albedo.java.util.domain.ComboData;

import java.util.List;

public interface JpaCustomeRepository<T extends GeneralEntity> {


    List<ComboData> findJson(ComboSearch item);

}
