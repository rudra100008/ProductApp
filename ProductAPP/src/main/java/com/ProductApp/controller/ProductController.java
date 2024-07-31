package com.ProductApp.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ProductApp.dao.ProductDao;
import com.ProductApp.model.Product;
import com.mysql.cj.Session;


import jakarta.servlet.http.HttpSession;

@Controller
public class ProductController {
	@Autowired
	private ProductDao productDao;
	@RequestMapping("/")
   public String index() {
	   return "index";
   }
	@RequestMapping("/addProduct")
	public String addProduct() {
		return "addProduct";
	}
	
	@PostMapping("/sucess")
	public String handleProduct( 
			@RequestParam("image") MultipartFile imageFile, 
			Model model,@ModelAttribute("products") Product product,
			HttpSession session) 
					throws IOException {
		System.out.println("Received file: " + imageFile.getOriginalFilename());
		System.out.println("Content Type: " + imageFile.getContentType());
		System.out.println("File Size: " + imageFile.getSize());
		
	        if (!imageFile.isEmpty()) {
	        	
	                byte[] imageBytes = imageFile.getBytes();
	                String path=session.getServletContext().getRealPath("/")+"WEB-INF"+File.separator+"resources"+File.separator+"images"+
	                File.separator+imageFile.getOriginalFilename();
	                FileOutputStream fos=new FileOutputStream(path);
	                fos.write(imageBytes);
	                fos.close();
	                model.addAttribute("image", imageFile.getOriginalFilename());
	                List<Product> products = productDao.getAllProduct(); // Example method
	                model.addAttribute("products", products);
	            productDao.createProduct(product);
	            System.out.println(product);
	        
	       
	  
    }
	        return "productDesc";
//	@RequestMapping("/productDesc")
//	public String productDesc() {
//		return "productDesc";
//	}
}
}
