package com.ProductApp.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ProductApp.model.Product;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProductController {
	@RequestMapping("/")
   public String index() {
	   return "index";
   }
	@RequestMapping("/addProduct")
	public String addProduct() {
		return "addProduct";
	}
	
	@PostMapping("/sucess")
	public String handleProduct( @ModelAttribute("products") Product product,HttpSession session,Model model)throws IOException {
		MultipartFile file=product.getImage();
		if (file == null || file.isEmpty()) {
            model.addAttribute("message", "No file selected or file is empty.");
            return "addProduct"; // Return to the form page if no file was uploaded
        }
		String path=session.getServletContext().getRealPath("/")+"WEB-INF"+File.separator+"resources"+File.separator 
				+"images"+File.separator + file.getOriginalFilename() ;
		System.out.println("\nPath: "+path);
		try (FileOutputStream fos = new FileOutputStream(path)) {
	        byte[] data = file.getBytes();
	        fos.write(data);
	        fos.flush();
	    }
		System.out.println("\nPhoto uploaded......");
		model.addAttribute("message", "File Uploaded");
		model.addAttribute("fileName", file.getOriginalFilename());
		return "productDesc";
		
	}
//	@RequestMapping("/productDesc")
//	public String productDesc() {
//		return "productDesc";
//	}
}
