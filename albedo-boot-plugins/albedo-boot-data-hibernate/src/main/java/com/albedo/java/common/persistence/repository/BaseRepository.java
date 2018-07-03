package com.albedo.java.common.persistence.repository;

import com.albedo.java.common.persistence.domain.BaseEntity;
import com.albedo.java.common.persistence.domain.GeneralEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.io.Serializable;

public interface BaseRepository<T extends GeneralEntity, PK extends Serializable> extends JpaRepository<T, PK>, JpaSpecificationExecutor<T> {


}
