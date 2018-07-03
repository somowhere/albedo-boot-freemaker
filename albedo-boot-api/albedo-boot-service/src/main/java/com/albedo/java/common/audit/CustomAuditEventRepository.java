package com.albedo.java.common.audit;

import com.albedo.java.common.config.audit.AuditEventConverter;
import com.albedo.java.modules.sys.domain.PersistentAuditEvent;
import com.albedo.java.modules.sys.repository.PersistenceAuditEventRepository;
import com.albedo.java.modules.sys.service.PersistenceAuditEventService;
import com.albedo.java.util.PublicUtil;
import org.springframework.boot.actuate.audit.AuditEvent;
import org.springframework.boot.actuate.audit.AuditEventRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

/**
 * An implementation of Spring Boot's AuditEventRepository.
 */
@Repository
public class CustomAuditEventRepository implements AuditEventRepository {

    public static final String ANONYMOUS_USER = "anonymoususer";
    private static final String AUTHORIZATION_FAILURE = "AUTHORIZATION_FAILURE";
    @Resource
    private PersistenceAuditEventService persistenceAuditEventService;

    @Resource
    private AuditEventConverter auditEventConverter;

    @Override
    public List<AuditEvent> find(Date after) {
        Iterable<PersistentAuditEvent> persistentAuditEvents =
            persistenceAuditEventService.findByAuditEventDateAfter(after);
        return auditEventConverter.convertToAuditEvent(persistentAuditEvents);
    }

    @Override
    public List<AuditEvent> find(String principal, Date after) {
        Iterable<PersistentAuditEvent> persistentAuditEvents;
        if (principal == null && after == null) {
            persistentAuditEvents = persistenceAuditEventService.findAll();
        } else if (after == null) {
            persistentAuditEvents = persistenceAuditEventService.findByPrincipal(principal);
        } else {
            persistentAuditEvents =
                persistenceAuditEventService.findByPrincipalAndAuditEventDateAfter(principal, after);
        }
        return auditEventConverter.convertToAuditEvent(persistentAuditEvents);
    }

    @Override
    public List<AuditEvent> find(String principal, Date after, String type) {
        Iterable<PersistentAuditEvent> persistentAuditEvents =
            persistenceAuditEventService.findByPrincipalAndAuditEventDateAfterAndAuditEventType(principal, after, type);
        return auditEventConverter.convertToAuditEvent(persistentAuditEvents);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void add(AuditEvent event) {
        if (!AUTHORIZATION_FAILURE.equals(event.getType()) &&
                !ANONYMOUS_USER.equals(event.getPrincipal().toString())) {

            PersistentAuditEvent persistentAuditEvent = new PersistentAuditEvent();
            persistentAuditEvent.setPrincipal(event.getPrincipal());
            persistentAuditEvent.setAuditEventType(event.getType());
//            Instant instant = Instant.ofEpochMilli(event.getTimestamp().getTime());
            persistentAuditEvent.setAuditEventDate(PublicUtil.getCurrentDate());
            persistentAuditEvent.setData(auditEventConverter.convertDataToStrings(event.getData()));
            persistenceAuditEventService.save(persistentAuditEvent);
        }
    }
}
