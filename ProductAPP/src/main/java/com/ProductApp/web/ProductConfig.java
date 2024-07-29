package com.ProductApp.web;

import java.util.Properties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;


@Configuration
@EnableWebMvc
@ComponentScan("com.ProductApp")
@EnableTransactionManagement
public class ProductConfig implements  WebMvcConfigurer{
	  @Bean
	    public InternalResourceViewResolver viewResolver() {
	        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
	        resolver.setPrefix("/WEB-INF/views/");
	        resolver.setSuffix(".jsp");
	        return resolver;
	    }

	  @Override
	    public void addResourceHandlers(ResourceHandlerRegistry registry) {
	        // Map /resources/** to /WEB-INF/resources/
	        registry.addResourceHandler("/resources/**")
	                .addResourceLocations("/WEB-INF/resources/");
	    }
	    
	    // Bean for handling file uploads
	    @Bean
	    public StandardServletMultipartResolver multipartResolver() {
	        return new StandardServletMultipartResolver();
	    }

	    // Configure DataSource
	    @Bean(name = "ds")
	    public javax.sql.DataSource dataSource() {
	        DriverManagerDataSource dataSource = new DriverManagerDataSource();
	        dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
	        dataSource.setUrl("jdbc:mysql://localhost:3306/product");
	        dataSource.setUsername("root");
	        dataSource.setPassword("ashum");
	        return dataSource;
	    }

	    // Configure SessionFactory
	    @Bean(name = "factory")
	    public LocalSessionFactoryBean sessionFactory() {
	        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
	        sessionFactory.setDataSource(dataSource());
	        sessionFactory.setPackagesToScan("com.ProductApp.model.Product"); // Package where entities are located
	        sessionFactory.setHibernateProperties(hibernateProperties());
	        return sessionFactory;
	    }

	    // Configure Hibernate properties
	    private Properties hibernateProperties() {
	        Properties properties = new Properties();
	        properties.put("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
	        properties.put("hibernate.show_sql", "true");
	        properties.put("hibernate.hbm2ddl.auto", "update");
	        return properties;
	    }

	    // Configure HibernateTemplate
	    @Bean(name = "hibernateTemplate")
	    public HibernateTemplate hibernateTemplate() {
	        HibernateTemplate hibernateTemplate = new HibernateTemplate();
	        hibernateTemplate.setSessionFactory(sessionFactory().getObject());
	        return hibernateTemplate;
	    }

	    // Configure Transaction Manager
	    @Bean(name = "transactionManager")
	    public HibernateTransactionManager transactionManager() {
	        HibernateTransactionManager transactionManager = new HibernateTransactionManager();
	        transactionManager.setSessionFactory(sessionFactory().getObject());
	        return transactionManager;
	    }
}
