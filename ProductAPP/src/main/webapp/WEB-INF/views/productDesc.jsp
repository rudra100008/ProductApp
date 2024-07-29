<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>     
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/productDesc.css'/>" />
    <script type="text/javascript" src='<c:url value="/resources/js/productDesc.js"></c:url>'></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&display=swap" rel="stylesheet">
</head>
<body>
    <div class="carousel-container">
        <div class="carousel">
            <!-- Use c:forEach to iterate over a collection of products -->
            <c:forEach var="product" items="${productsList}">
                <div class="card">
                    <div class="image">
                        <!-- Display the product image -->
                        <c:url value="/resources/images/${product.fileName}" var="imagePath" />
                        <img alt="${product.name}" src="${imagePath}" width="200"/>
                    </div>
                    <div class="content">
                        <!-- Display the product name and description -->
                        <h3>${product.name}</h3>
                        <p>${product.description}</p>
                        <p>${product.price}</p>
                        <button>View More</button>
                    </div>
                </div>
            </c:forEach>

            <!-- Fallback card if no products are available -->
            <c:if test="${empty productsList}">
                <div class="card">
                    <div class="image">
                        <img src="" alt="No Products Available">
                    </div>
                    <div class="content">
                        <h3>No Products Available</h3>
                        <p>Currently, there are no products to display.</p>
                        <button disabled>View More</button>
                    </div>
                </div>
            </c:if>

        </div>

        <div class="navigation">
            <button class="nav-btn prev">❮</button>
            <button class="nav-btn next">❯</button>
        </div>
    </div>

    <script src="script.js"></script>
</body>
</html>
