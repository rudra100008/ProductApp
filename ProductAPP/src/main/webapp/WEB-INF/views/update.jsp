<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page isELIgnored="false" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
  <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Product</title>
    <link rel="stylesheet" href=" <c:url value='/resources/css/styles.css'/>">
    <script type="text/javascript" src='<c:url value='/resources/js/script.js'></c:url>' ></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>
<body>
    <div class="container">
        <header>
            <div class="logo">
                <h1>Proo<span>duct</span></h1>
            </div>
            <nav>
               <ul class="nav-links">
                <li><a href="http://localhost:8080/ProductAPP">Home</a></li>
                <li><a href="http://localhost:8080/ProductAPP/addProduct">AddProduct</a></li>
                <li><a href="#">Help</a></li>
                 <li><a href="http://localhost:8080/ProductAPP/productDesc">Products</a></li>
                <li><a href="#">Login</a></li>
            </ul>
            </nav>
        </header>

        <div class="add-product-form">
            <h2>Change Product Details</h2>
            <form:form method="post" action="${pageContext.request.contextPath}/sucess" modelAttribute="products" enctype="multipart/form-data">
               <div class="form-group">
                    <input type="hidden" id="product-title" name="id" placeholder="Enter product id" value="${product.id}" >
                </div>
                <div class="form-group">
                    <label for="name">Product Title</label>
                    <input type="text" id="product-title" name="name" placeholder="Enter product title" value="${product.name}" >
                </div>
                
                <div class="form-group">
                    <label for="description">Product description</label>
                    <div class="rich-text-editor">
                        <textarea id="product-description" name="description"placeholder="Enter product description">${product.description} 
                        </textarea>
                    </div>
                </div>

                <div class="form-group">
                    <label for="price"> Product Price</label>
                    <input type="number" id="product-price" name="price" value="${product.price}" placeholder="Enter product price">
                </div>

                
                 <div class="form-group">
                    <button type="submit" class="submit-btn">Change Product</button>
                </div>
            </form:form>
        </div>
    </div>
</body>
</html>
