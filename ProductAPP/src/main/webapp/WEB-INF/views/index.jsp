<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>      
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Simple Navigation Bar</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/navbar.css" />">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
</head>
<body>
    <nav class="navbar">
        <div class="navbar-container">
            <div class="logo">
                <h1>Proo<span>duct</span></h1>
            </div>
            <ul class="nav-links">
                <li><a href="http://localhost:8080/ProductAPP">Home</a></li>
                <li><a href="http://localhost:8080/ProductAPP/addProduct">AddProduct</a></li>
                <li><a href="#">Services</a></li>
                <li><a href="http://localhost:8080/ProductAPP/productDesc">Products</a></li>
                <li><a href="#">Our Work</a></li>
            </ul>
        </div>
    </nav>
</body>
</html>
