package com.albedo.java.modules.sys.repository;

import com.albedo.java.common.persistence.repository.BaseRepository;
import com.albedo.java.modules.sys.domain.PersistentAuditEvent;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

/**
 * Spring Data JPA repository for the PersistentAuditEvent entity.
 */
public interface PersistenceAuditEventRepository extends BaseRepository<PersistentAuditEvent, Long> {

    List<PersistentAuditEvent> findByPrincipal(String principal);

    List<PersistentAuditEvent> findByAuditEventDateAfter(Date after);

    List<PersistentAuditEvent> findByPrincipalAndAuditEventDateAfter(String principal, Date after);

    List<PersistentAuditEvent> findByPrincipalAndAuditEventDateAfterAndAuditEventType(String principle, Date after, String type);

    Page<PersistentAuditEvent> findAllByAuditEventDateBetween(Date fromDate, Date toDate, Pageable pageable);
}
