package com.github.RianNegreiros.productcataloging.services;

import com.github.RianNegreiros.productcataloging.entities.Category;
import com.github.RianNegreiros.productcataloging.repositories.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService {
    @Autowired
    private CategoryRepository repository;
    public List<Category> findAll() {
        return repository.findAll();
    }
}
