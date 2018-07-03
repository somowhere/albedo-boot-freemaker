/**
 * Copyright &copy; 2015 <a href="http://www.bs-innotech.com/">bs-innotech</a> All rights reserved.
 */
package com.albedo.java.modules.sys.service;

import com.albedo.java.common.persistence.DynamicSpecifications;
import com.albedo.java.common.persistence.SpecificationDetail;
import com.albedo.java.common.persistence.service.DataService;
import com.albedo.java.modules.sys.domain.PersistentAuditEvent;
import com.albedo.java.modules.sys.domain.TaskScheduleJob;
import com.albedo.java.modules.sys.repository.TaskScheduleJobRepository;
import com.albedo.java.util.domain.PageModel;
import com.albedo.java.util.domain.QueryCondition;
import com.baomidou.mybatisplus.mapper.Condition;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 任务调度管理Service 任务调度
 *
 * @author lj
 * @version 2017-01-23
 */
@Service
@Transactional
public class TaskScheduleJobService extends DataService<TaskScheduleJobRepository,
        TaskScheduleJob, String> {


    List<TaskScheduleJob> findByStatusAndJobStatus(Integer status, String jobStatus){

        return selectList(Condition.create()
            .eq(TaskScheduleJob.F_SQL_STATUS, status)
            .eq(TaskScheduleJob.F_SQL_JOBSTATUS, jobStatus));
    }

    TaskScheduleJob findTopBySourceIdAndStatusNot(String sourceId, Integer status){
        return selectOne(Condition.create()
            .ne(TaskScheduleJob.F_SQL_STATUS, status)
            .eq(TaskScheduleJob.F_SQL_SOURCEID, sourceId));

    }

    List<TaskScheduleJob> findAllBySourceId(String sourceId){
        return selectList(Condition.create()
            .eq(TaskScheduleJob.F_SQL_SOURCEID, sourceId));

    }


    /*
     * (non-Javadoc)
     *
     * @see
     * com.albedo.java.modules.sys.service.ITaskScheduleJobService#findAll(com.
     * albedo.java.common.domain.data.SpecificationDetail,
     * com.albedo.java.util.domain.PageModel)
     */
    @Transactional(readOnly = true, rollbackFor = Exception.class)
    public PageModel<TaskScheduleJob> findAll(PageModel<TaskScheduleJob> pm, List<QueryCondition> queryConditions) {
        SpecificationDetail<TaskScheduleJob> spec = DynamicSpecifications.
                buildSpecification(TaskScheduleJob.class, pm.getQueryConditionJson(),
                        queryConditions,
                        QueryCondition.ne(TaskScheduleJob.F_STATUS, TaskScheduleJob.FLAG_DELETE));
        return findPage(pm, spec);
    }


}
