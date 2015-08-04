<%-- 
    Document   : bourak
    Created on : 3.8.2015, 19:21:14
    Author     : david
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <c:redirect url="http://localhost:9090/DatabazePsinec">
            <c:param name="chyba" value="SPATNE JSI ZADAL HODNOTY BLBCE."></c:param>
        </c:redirect>
        <h1>Hello World!</h1>
    </body>
</html>
