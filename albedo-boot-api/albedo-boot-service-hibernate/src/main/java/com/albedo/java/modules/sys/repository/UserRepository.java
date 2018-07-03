package com.albedo.java.modules.sys.repository;

import com.albedo.java.common.persistence.repository.DataRepository;
import com.albedo.java.modules.sys.domain.User;
import org.springframework.cache.annotation.Cacheable;

import java.util.Date;
import java.util.List;
import java.util.Optional;

/**
 * Spring Data JPA repository for the User entity.
 */
public interface UserRepository extends DataRepository<User, String> {


    String USERS_BY_LOGIN_CACHE = "usersByLogin";

    Optional<User> findOneByActivationKey(String activationKey);

    List<User> findAllByActivatedIsFalseAndCreatedDateBefore(Date dateTime);

    Optional<User> findOneByResetKey(String resetKey);

    @Cacheable(cacheNames = USERS_BY_LOGIN_CACHE)
    Optional<User> findOneByLoginId(String loginId);

}
