package com.ProductApp.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import com.ProductApp.model.Product;
import jakarta.transaction.Transactional;

@Component
public class ProductDao {

	@Autowired
    private HibernateTemplate hibernateTemplate;
	//create product
	@Transactional
	public void createProduct(Product product) {
		hibernateTemplate.save(product);
	}
	
	// get all product
	public List<Product> getAllProduct(){
		List<Product> products=this.hibernateTemplate.loadAll(Product.class);
		return products;
	}
	//delete single product
	@Transactional
	public void deleteProduct(int pid){
		Product product=this.hibernateTemplate.load(Product.class, pid);
		this.hibernateTemplate.delete(product);
	}
	//Read
   //get single product
	public Product getProduct( int pid) {
		return this.hibernateTemplate.get(Product.class,pid);
	}
	//update
	public void updateProduct(Product product) {
		this.hibernateTemplate.update(product);
	}
	
}