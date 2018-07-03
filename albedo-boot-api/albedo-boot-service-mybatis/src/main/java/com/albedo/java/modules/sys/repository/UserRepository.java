package com.albedo.java.modules.sys.repository;

import com.albedo.java.common.persistence.repository.BaseRepository;
import com.albedo.java.modules.sys.domain.User;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.repository.query.Param;

/**
 * Spring Data JPA repository for the User entity.
 */
public interface UserRepository extends BaseRepository<User, String> {

    String USERS_BY_LOGIN_CACHE = "usersByLogin";

    @Cacheable(cacheNames = USERS_BY_LOGIN_CACHE)
    User selectUserByLoginId(String loginId);

    void deleteUserRoles(@Param("userId") String userId);

    void addUserRoles(User user);

}
