package com.albedo.java.modules.sys.repository;

import com.albedo.java.common.persistence.repository.BaseRepository;
import com.albedo.java.modules.sys.domain.PersistentAuditEvent;
import com.albedo.java.modules.sys.domain.User;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.springframework.data.repository.query.Param;

/**
 * Spring Data JPA repository for the PersistentAuditEvent entity.
 */
public interface PersistenceAuditEventRepository extends BaseRepository<PersistentAuditEvent, Long> {



    void addAuditEventData(PersistentAuditEvent persistentAuditEvent);

    void deleteAuditEventData(@Param("eventId") String eventId);


}
