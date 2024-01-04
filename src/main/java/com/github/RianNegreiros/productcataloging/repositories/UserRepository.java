package com.github.RianNegreiros.productcataloging.repositories;

import com.github.RianNegreiros.productcataloging.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);
}
