<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <li><a href="#">Login</a></li>
            </ul>
            </nav>
        </header>

        <div class="add-product-form">
            <h2>Add new product</h2>
            <form:form method="post" action="sucess" modelAttribute="products" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="name">Product Title</label>
                    <input type="text" id="product-title" name="name" placeholder="Enter product title">
                </div>
                <div class="form-group">
                   <label for="image">Photo of Product</label>
                   <input type="file" id="image" name="image" required>
                </div>
                <div class="form-group">
                    <label for="description">Product description</label>
                    <div class="rich-text-editor">
                        <div class="editor-toolbar">
                            <select>
                                <option>Paragraph</option>
                                <option>Heading 1</option>
                                <option>Heading 2</option>
                                <option>Heading 3</option>
                            </select>
                            <button><i class="fas fa-bold"></i></button>
                            <button><i class="fas fa-italic"></i></button>
                            <button><i class="fas fa-quote-left"></i></button>
                            <button><i class="fas fa-list-ul"></i></button>
                            <button><i class="fas fa-list-ol"></i></button>
                            <button><i class="fas fa-align-left"></i></button>
                            <button><i class="fas fa-align-center"></i></button>
                            <button><i class="fas fa-align-right"></i></button>
                            <button><i class="fas fa-link"></i></button>
                            <button><i class="fas fa-unlink"></i></button>
                        </div>
                        <textarea id="product-description" name="description" placeholder="Enter product description"></textarea>
                    </div>
                </div>

                <div class="form-group">
                    <label for="price"> Product Price</label>
                    <input type="number" id="product-price" name="price" placeholder="Enter product price">
                </div>

                
                 <div class="form-group">
                    <button type="submit" class="submit-btn">Add Product</button>
                </div>
            </form:form>
        </div>
    </div>
</body>
</html>
