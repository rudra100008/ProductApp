package com.ProductApp.dao;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import jakarta.transaction.Transactional;

import com.ProductApp.model.Product;

@Component
public class ProductDao {

    // Use EntityManager instead of HibernateTemplate
    @PersistenceContext
    private EntityManager entityManager;

    // Create product
    @Transactional
    public Product createProduct(Product product) throws IOException {
    	if (product.getId() == 0) {
            // New product, persist it
            entityManager.persist(product);
            System.out.println("Product saved successfully: " + product);
            return product;
        } else {
            // Existing product, merge it
            Product updatedProduct = entityManager.merge(product);
            System.out.println("Product updated successfully: " + updatedProduct);
            return updatedProduct;
        }
    }

    // Get all products
    public List<Product> getAllProduct() {
        // Use CriteriaQuery to fetch all products
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Product> criteriaQuery = criteriaBuilder.createQuery(Product.class);
        Root<Product> root = criteriaQuery.from(Product.class);
        criteriaQuery.select(root);
        return entityManager.createQuery(criteriaQuery).getResultList();
    }

    // Delete a single product
    @Transactional
    public void deleteProduct(int pid) {
        Product product = entityManager.find(Product.class, pid);
        if (product != null) {
            entityManager.remove(product);
        }
    }

    // Get a single product
    public Product getProduct(int pid) {
        return entityManager.find(Product.class, pid);
    }

    // Update a product
    @Transactional
    public void updateProduct(Product product) {
        entityManager.merge(product);
    }
}
