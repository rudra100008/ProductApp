package com.ProductApp.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import com.ProductApp.dao.ProductDao;
import com.ProductApp.model.Product;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ProductController {
	@Autowired
	private ProductDao productDao;
	@RequestMapping("/")
   public String index(Model model) {
		 List<Product> products = productDao.getAllProduct(); // Example method
         model.addAttribute("products", products);
	   return "index";
   }
	@RequestMapping("/addProduct")
	public String addProduct() {
		return "addProduct";
	}
	
	@PostMapping("/sucess")
	public RedirectView handleProduct( 
			Model model,@ModelAttribute("products") Product product,
			HttpSession session) 
					throws IOException {           
	            productDao.createProduct(product);
	            System.out.println(product);
	        return new RedirectView("/ProductAPP/");
	}
	
	        
	@RequestMapping("/delete/{id}")
	public RedirectView handleDelete(@PathVariable("id") int id,HttpServletRequest request) {
		this.productDao.deleteProduct(id);
		RedirectView redirectView=new RedirectView();
		redirectView.setUrl(request.getContextPath()+"/");
		return redirectView;
	}
	@RequestMapping("/update/{id}")
	public String handleUpdate(@PathVariable("id") int id,HttpServletRequest request,Model model) {
	   Product product =this.productDao.getProduct(id);
	   model.addAttribute("product",product);
		
		return "update";
	}

}
