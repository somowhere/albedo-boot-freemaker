package com.albedo.java.modules.sys.repository;

import com.albedo.java.common.persistence.repository.BaseRepository;
import com.albedo.java.modules.sys.domain.User;
import com.albedo.java.vo.sys.UserTableVo;
import com.baomidou.mybatisplus.mapper.Wrapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.cache.annotation.Cacheable;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Spring Data JPA repository for the User entity.
 */
public interface UserRepository extends BaseRepository<User, String> {

//    String USERS_BY_LOGIN_CACHE = "usersByLogin";

//    @Cacheable(cacheNames = USERS_BY_LOGIN_CACHE)
    User selectUserByLoginId(String loginId);

    void deleteUserRoles(String userId);

    void addUserRoles(User user);

    List<UserTableVo> selectRelationPage(RowBounds rowBounds, @Param("ew") Wrapper<User> wrapper);

}
