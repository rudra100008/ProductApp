<%@ page isErrorPage="true" contentType="text/html;charset=UTF-8" language="java"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.io.PrintWriter, java.io.StringWriter" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Error Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            color: #333;
        }
        .container {
            max-width: 600px;
            margin: 100px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #d9534f;
        }
        pre {
            background-color: #f5f5f5;
            padding: 10px;
            border-radius: 5px;
            overflow-x: auto;
        }
        .footer {
            margin-top: 20px;
            font-size: 0.8em;
            text-align: center;
        }
        .link-container {
            display: flex;
            justify-content: center; /* Optional: Centers the container */
            gap: 20px; /* Adjust the gap as needed */
        }
    </style>
</head>
<body>
<div class="container">
    <h1>An error occurred</h1>
    <p>We're sorry, but an unexpected error has occurred. Please try again later.</p>

    <!-- Displaying error details for developers -->
    <c:if test="${not empty exception}">
        <h2>Error Details</h2>
        <p><strong>Message:</strong> ${exception.message}</p>
        <h3>Stack Trace:</h3>
        <p>${exception}</p>
        <%-- <pre>
            <c:forEach var="element" items="${exception.stackTrace}">
                ${element}<br/>
            </c:forEach>
        </pre> --%>
    </c:if>

    <!-- Optional error logging -->
    <%
        // Log the exception for further analysis
        StringWriter sw = new StringWriter();
        exception.printStackTrace(new PrintWriter(sw));
        String exceptionStackTrace = sw.toString();
    %>
    <div class="link-container">
    <a href="http://localhost:8080/SpringMVC/">Home</a>
   <a href="#">Contact-Help</a>
    </div>
    <div class="footer">
        <p>&copy; 2024 Your Company. All rights reserved.</p>
    </div>
</div>
</body>
</html>
