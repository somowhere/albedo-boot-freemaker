/**
 * Copyright &copy; 2015 <a href="http://www.bs-innotech.com/">bs-innotech</a> All rights reserved.
 */
package com.albedo.java.modules.sys.service;

import com.albedo.java.common.persistence.DynamicSpecifications;
import com.albedo.java.common.persistence.SpecificationDetail;
import com.albedo.java.common.persistence.service.BaseService;
import com.albedo.java.modules.sys.domain.LoggingEvent;
import com.albedo.java.modules.sys.domain.PersistentAuditEvent;
import com.albedo.java.modules.sys.repository.LoggingEventRepository;
import com.albedo.java.modules.sys.repository.PersistenceAuditEventRepository;
import com.albedo.java.util.domain.PageModel;
import com.baomidou.mybatisplus.mapper.Condition;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;


/**
 * 操作日志Service 操作日志
 *
 * @author admin
 * @version 2017-01-03
 */
@Service
public class PersistenceAuditEventService extends BaseService<PersistenceAuditEventRepository, PersistentAuditEvent, Long> {

    public List<PersistentAuditEvent> findByAuditEventDateAfter(Date from) {
        return selectList(Condition.create().gt(PersistentAuditEvent.F_SQL_AUDITEVENTDATE, from));

    }

    public Iterable<PersistentAuditEvent> findByPrincipal(String principal) {
        return selectList(Condition.create().eq(PersistentAuditEvent.F_SQL_PRINCIPAL, principal));

    }

    public Iterable<PersistentAuditEvent> findByPrincipalAndAuditEventDateAfter(String principal, Date from) {
        return selectList(Condition.create()
            .eq(PersistentAuditEvent.F_SQL_PRINCIPAL, principal)
            .gt(PersistentAuditEvent.F_SQL_AUDITEVENTDATE, from)
        );
    }

    public Iterable<PersistentAuditEvent> findByPrincipalAndAuditEventDateAfterAndAuditEventType(String principal, Date from, String type) {
        return selectList(Condition.create()
            .eq(PersistentAuditEvent.F_SQL_PRINCIPAL, principal)
            .gt(PersistentAuditEvent.F_SQL_AUDITEVENTDATE, from)
            .eq(PersistentAuditEvent.F_SQL_AUDITEVENTTYPE, type)
        );
    }
}
