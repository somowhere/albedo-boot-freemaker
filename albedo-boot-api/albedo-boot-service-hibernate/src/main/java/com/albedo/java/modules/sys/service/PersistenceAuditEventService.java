/**
 * Copyright &copy; 2015 <a href="http://www.bs-innotech.com/">bs-innotech</a> All rights reserved.
 */
package com.albedo.java.modules.sys.service;

import com.albedo.java.common.persistence.SpecificationDetail;
import com.albedo.java.common.persistence.domain.BaseEntity;
import com.albedo.java.common.persistence.service.BaseService;
import com.albedo.java.modules.sys.domain.PersistentAuditEvent;
import com.albedo.java.modules.sys.repository.PersistenceAuditEventRepository;
import com.albedo.java.util.domain.PageModel;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;


/**
 * 操作日志Service 操作日志
 *
 * @author admin
 * @version 2017-01-03
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class PersistenceAuditEventService extends BaseService<PersistenceAuditEventRepository, PersistentAuditEvent, Long> {

    private final PersistenceAuditEventRepository persistenceAuditEventRepository;

    public PersistenceAuditEventService(PersistenceAuditEventRepository persistenceAuditEventRepository) {
        this.persistenceAuditEventRepository = persistenceAuditEventRepository;
    }

    @Transactional(readOnly = true)
    public List<PersistentAuditEvent> findByAuditEventDateAfter(Date from) {
        return persistenceAuditEventRepository.findByAuditEventDateAfter(from);

    }

    @Transactional(readOnly = true)
    public Iterable<PersistentAuditEvent> findByPrincipal(String principal) {
        return persistenceAuditEventRepository.findByPrincipal(principal);

    }

    @Transactional(readOnly = true)
    public Iterable<PersistentAuditEvent> findByPrincipalAndAuditEventDateAfter(String principal, Date from) {
        return persistenceAuditEventRepository.findByPrincipalAndAuditEventDateAfter(principal, from);
    }

    @Transactional(readOnly = true)
    public Iterable<PersistentAuditEvent> findByPrincipalAndAuditEventDateAfterAndAuditEventType(String principal, Date from, String type) {
        return persistenceAuditEventRepository.findByPrincipalAndAuditEventDateAfterAndAuditEventType(principal, from, type);
    }

    public PageModel<PersistentAuditEvent> findPage(PageModel<PersistentAuditEvent> pm) {
        Page<PersistentAuditEvent> page = persistenceAuditEventRepository.findAll(pm);
        pm.setPageInstance(page);
        return pm;
    }

    public PageModel<PersistentAuditEvent> findPage(PageModel<PersistentAuditEvent> pm, SpecificationDetail<PersistentAuditEvent> specificationDetail) {
        Page<PersistentAuditEvent> page = persistenceAuditEventRepository.findAll(specificationDetail, pm);
        pm.setPageInstance(page);
        return pm;
    }


}
