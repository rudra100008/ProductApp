<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored = "false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Added Successfully</title>
</head>
<body>
    <h2>Product Successfully Added!</h2>
  <h4>${message}</h4>
    <!-- Display uploaded image -->
    <c:url value="/resources/images/${fileName}" var="imagePath" />
    <img alt="Uploaded Product Image" src="${imagePath}" width="200"/>

    <!-- Display additional details if needed -->
    <p><strong>File Name:</strong> ${fileName}</p>

    <a href="<c:url value='/product/add'/>">Add Another Product</a>
</body>
</html>
