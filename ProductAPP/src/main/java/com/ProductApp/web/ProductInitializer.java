package com.ProductApp.web;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

import jakarta.servlet.MultipartConfigElement;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRegistration;

public class ProductInitializer implements WebApplicationInitializer{

	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		AnnotationConfigWebApplicationContext context=new AnnotationConfigWebApplicationContext();
		context.register(ProductConfig.class);
		context.setServletContext(servletContext);
		
		ServletRegistration.Dynamic dispatcher = servletContext.addServlet("dispatcher", new DispatcherServlet(context));
		dispatcher.addMapping("/");
		  // Set multipart configuration for the DispatcherServlet
        dispatcher.setMultipartConfig(new MultipartConfigElement(
                null,        // Location to store temporary files (optional)
                20971520,    // Max request size (20 MB)
                5242880,     // Max file size (5 MB)
                0            // Threshold for using file system for temporary storage
        ));
		
	}

}
