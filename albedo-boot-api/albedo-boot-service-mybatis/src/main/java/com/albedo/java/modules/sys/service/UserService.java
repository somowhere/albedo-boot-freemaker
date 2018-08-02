package com.albedo.java.modules.sys.service;

import com.albedo.java.common.persistence.DynamicSpecifications;
import com.albedo.java.common.persistence.PageQuery;
import com.albedo.java.common.persistence.SpecificationDetail;
import com.albedo.java.common.persistence.service.DataVoService;
import com.albedo.java.modules.sys.domain.Org;
import com.albedo.java.modules.sys.domain.Role;
import com.albedo.java.modules.sys.domain.User;
import com.albedo.java.modules.sys.repository.OrgRepository;
import com.albedo.java.modules.sys.repository.RoleRepository;
import com.albedo.java.modules.sys.repository.UserRepository;
import com.albedo.java.util.PublicUtil;
import com.albedo.java.util.RandomUtil;
import com.albedo.java.util.base.Assert;
import com.albedo.java.util.base.Reflections;
import com.albedo.java.util.domain.PageModel;
import com.albedo.java.util.domain.QueryCondition;
import com.albedo.java.util.exception.RuntimeMsgException;
import com.albedo.java.vo.account.PasswordChangeVo;
import com.albedo.java.vo.sys.UserExcelVo;
import com.albedo.java.vo.sys.UserTableVo;
import com.albedo.java.vo.sys.UserVo;
import com.baomidou.mybatisplus.mapper.Condition;
import com.baomidou.mybatisplus.mapper.SqlHelper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.google.common.collect.Lists;
import org.springframework.beans.BeanUtils;
import org.springframework.cache.CacheManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.validation.Valid;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

/**
 * Service class for managing users.
 *
 * @author somewhere
 */
@Service
public class UserService extends DataVoService<UserRepository, User, String, UserVo> {


    private final OrgRepository orgRepository;

    private final RoleRepository roleRepository;

    private final CacheManager cacheManager;

    public UserService( OrgRepository orgRepository, RoleRepository roleRepository,CacheManager cacheManager) {
        this.orgRepository = orgRepository;
        this.roleRepository = roleRepository;
        this.cacheManager = cacheManager;
    }

    @Override
    public UserVo copyBeanToVo(User user) {
        UserVo userResult = new UserVo();
        super.copyBeanToVo(user, userResult);
        userResult.setRoleNames(user.getRoleNames());
        return userResult;
    }

    @Override
    public void copyVoToBean(UserVo userVo, User user) {
        super.copyVoToBean(userVo, user);
        user.setRoleIdList(userVo.getRoleIdList());
    }

    @Transactional(readOnly = true, rollbackFor = Exception.class)
    @Override
    public UserVo findOneVo(String id) {
        User relationOne = findRelationOneByPk(id);
        if(relationOne!=null) {
            relationOne.setRoles(roleRepository.selectListByUserId(id));
        }
        return copyBeanToVo(relationOne);
    }

    @Override
    public void save(UserVo userVo) {
        User user = PublicUtil.isNotEmpty(userVo.getId()) ? repository.selectById(userVo.getId()) : new User();
        copyVoToBean(userVo, user);
        save(user);
    }

    @Override
    public User save(User user) {
        if (user.getLangKey() == null) {
            // default language
            user.setLangKey("zh-cn");
        } else {
            user.setLangKey(user.getLangKey());
        }
        user.setResetKey(RandomUtil.generateResetKey());
        user.setResetDate(PublicUtil.getCurrentDate());
        insertOrUpdate(user);
        if (PublicUtil.isNotEmpty(user.getRoleIdList())) {
            repository.deleteUserRoles(user.getId());
            repository.addUserRoles(user);
        }
//        cacheManager.getCache(UserRepository.USERS_BY_LOGIN_CACHE).evict(user.getLoginId());
        log.debug("Save Information for User: {}", user);
        return user;
    }

    @Transactional(readOnly = true, rollbackFor = Exception.class)
    public Optional<UserVo> getUserWithAuthoritiesByLogin(String login) {
        return Optional.of(copyBeanToVo(repository.selectUserByLoginId(login)));
    }

    @Transactional(readOnly = true, rollbackFor = Exception.class)
    public UserVo getUserWithAuthorities(String id) {
        User user = repository.selectById(id);
        return copyBeanToVo(user);
    }

    @Transactional(readOnly = true, rollbackFor = Exception.class)
    public UserVo findVo(String id) {
        User user = repository.selectById(id);
        return copyBeanToVo(user);
    }


    @Transactional(readOnly = true, rollbackFor = Exception.class)
    public PageModel<User> findPage(PageModel<User> pm, List<QueryCondition> andQueryConditions, List<QueryCondition> orQueryConditions) {
        //拼接查询动态对象
        SpecificationDetail<User> spec = DynamicSpecifications.bySearchQueryCondition(
                andQueryConditions,
                QueryCondition.ne(User.F_STATUS, User.FLAG_DELETE),
                QueryCondition.ne(User.F_ID, "1"));
        spec.orAll(orQueryConditions);
        //自定义sql分页查询
        findRelationPage(pm, spec);


        return pm;
    }

    @Transactional(readOnly = true, rollbackFor = Exception.class)
    public PageModel<UserTableVo> findTablePage(PageModel<UserTableVo> pm, List<QueryCondition> authQueryConditions) {
        //拼接查询动态对象
        SpecificationDetail<User> spec = DynamicSpecifications.
                buildSpecification(pm.getQueryConditionJson(),
                        QueryCondition.ne("a.status_", User.FLAG_DELETE),
                        QueryCondition.ne("a.id_",  "1"));
        spec.orAll(authQueryConditions);
        //动态生成sql分页查询
//        findRelationPage(pm, spec);
        PageQuery<User> page = new PageQuery(pm, null);
        pm.setData(repository.selectRelationPage(page, (Wrapper<User>) SqlHelper.fillWrapper(page, spec.toEntityWrapper())));
        pm.setRecordsTotal(page.getTotal());
        return pm;
    }

    public void changePassword(String loginId, String newPassword) {
        Optional.of(selectOne(Condition.create().eq(User.F_LOGINID, loginId))).ifPresent(
            user -> {
                user.setPassword(newPassword);
                repository.updateById(user);
//                cacheManager.getCache(UserRepository.USERS_BY_LOGIN_CACHE).evict(user.getLoginId());
                log.debug("Changed password for User: {}", user);
            }
        );
    }

    public Optional<User> findOneByLoginId(String loginId) {
        User user = null;
        try {
            user = repository.selectUserByLoginId(loginId);
        }catch (Exception e){
            log.error("{}",e);
//            cacheManager.getCache(UserRepository.USERS_BY_LOGIN_CACHE).evict(user.getLoginId());
            user = repository.selectUserByLoginId(loginId);
        }
        return user!=null ? Optional.of(user) : Optional.empty();
    }

    @Override
    public void lockOrUnLock(List<String> idList) {
        super.lockOrUnLock(idList);
//        selectBatchIds(idList).forEach(user ->
//            cacheManager.getCache(UserRepository.USERS_BY_LOGIN_CACHE).evict(user.getLoginId()));
    }


    @Override
    public boolean deleteBatchIds(Collection<? extends Serializable> idList) {

        boolean rs = super.deleteBatchIds(idList);
//        selectBatchIds(idList).forEach(user ->
//                cacheManager.getCache(UserRepository.USERS_BY_LOGIN_CACHE).evict(user.getLoginId()));
        return rs;
    }

    public void save(@Valid UserExcelVo userExcelVo) {
        User user = new User();
        BeanUtils.copyProperties(userExcelVo, user);
        Org org = orgRepository.findOne(Condition.create().eq(Org.F_SQL_NAME, userExcelVo.getOrgName()));
        if(org!=null){
            user.setOrgId(org.getId());
        }
        Role role = roleRepository.findOne(Condition.create().eq(Role.F_SQL_NAME, userExcelVo.getRoleNames()));
        if(role==null){
            throw new RuntimeMsgException("无法获取角色"+userExcelVo.getRoleNames()+"信息");
        }
        user.setRoleIdList(Lists.newArrayList(role.getId()));
        save(user);
    }

    public void checkProperty(UserVo userVo){
        Assert.assertIsTrue(doCheckByProperty(Reflections.createObj(UserVo.class, Lists.newArrayList(UserVo.F_ID, UserVo.F_LOGINID),
            userVo.getId(), userVo.getLoginId())), "登录Id已存在");
        Assert.assertIsTrue(PublicUtil.isEmpty(userVo.getPhone()) || doCheckByProperty(Reflections.createObj(UserVo.class,
            Lists.newArrayList(UserVo.F_ID, UserVo.F_PHONE), userVo.getId(), userVo.getPhone())), "手机已存在");
        Assert.assertIsTrue(PublicUtil.isEmpty(userVo.getEmail()) || doCheckByProperty(Reflections.createObj(UserVo.class,
            Lists.newArrayList(UserVo.F_ID, UserVo.F_EMAIL), userVo.getId(), userVo.getEmail())), "邮箱已存在");

    }
}
