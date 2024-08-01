
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
  <%@page isELIgnored="false" %>     
<!DOCTYPE html>
<html lang="en">
<head>
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Simple Navigation Bar</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/navbar.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/table.css" />">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
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
    
    
    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Product_Name</th>
                    <th>Product_Price</th>
                    <th>Product_Details</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="product" items="${products}">
             <tr>
                    <td>${product.id}</td>
                    <td>${product.name}</td>
                    <td>${product.price}</td>
                    <td>${product.description }</td> 
                    <td>
                    <a href="delete/${product.id}"><i class="fa-solid fa-trash"></i></a>
                    <a href="update/${product.id}"><i class="fa-solid fa-arrows-rotate"></i></a>
                    </td>
             </tr>
            </c:forEach> 
            </tbody>
        </table>
    </div>
</body>
</html>
