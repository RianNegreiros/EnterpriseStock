package com.github.RianNegreiros.productcataloging.repositories;

import com.github.RianNegreiros.productcataloging.entities.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {
}
