package com.github.RianNegreiros.productcataloging.repositories;

import com.github.RianNegreiros.productcataloging.entities.Product;
import com.github.RianNegreiros.productcataloging.tests.Factory;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

import java.util.Optional;

@DataJpaTest
public class ProductRepositoryTests {

    @Autowired
    private ProductRepository repository;

    private long existingId;
    private long nonExistingId;
    private long countTotalProducts;

    @BeforeEach
    void setUp() throws Exception {
        existingId = 1L;
        nonExistingId = 999L;
        countTotalProducts = 25L;
    }

    @Test
    public void shouldPersistWithAutoincrementWhenIdIsNull() {

        Product product = Factory.createProduct();
        product.setId(null);

        product = repository.save(product);
        Optional<Product> result = repository.findById(product.getId());

        Assertions.assertNotNull(product.getId());
        Assertions.assertEquals(countTotalProducts + 1L, product.getId());
        Assertions.assertTrue(result.isPresent());
        Assertions.assertSame(result.get(), product);
    }

    @Test
    public void shouldDeleteObjectWhenIdExists() {

        repository.deleteById(existingId);

        Optional<Product> result = repository.findById(existingId);

        Assertions.assertFalse(result.isPresent());
    }

    @Test
    public void shouldReturnNotReturnEmptyWhenIdExists() {
        Optional<Product> result = repository.findById(existingId);

        Assertions.assertTrue(result.isPresent());
    }

    @Test
    public void shouldReturnReturnEmptyWhenIdExists() {
        Optional<Product> result = repository.findById(nonExistingId);

        Assertions.assertFalse(result.isPresent());
    }
}
