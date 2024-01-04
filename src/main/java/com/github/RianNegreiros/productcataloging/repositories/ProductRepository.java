package com.github.RianNegreiros.productcataloging.repositories;

import com.github.RianNegreiros.productcataloging.entities.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
}
