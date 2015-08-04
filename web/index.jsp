<%-- 
    Document   : index
    Created on : 4.8.2015, 17:31:07
    Author     : david
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/styles2.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="celek">
            <div id="napis">
            <c:choose>
                <c:when test="${param.user=='admin' && param.heslo=='admin'}">
                    <c:redirect url="/index2.jsp"/>
                </c:when>
                <c:otherwise>
                    <c:out value="NAPIS UZIVATELSKE JMENO A HESLO A JSI V DATABAZI"/>
                </c:otherwise>
            </c:choose>
            </div>
            <div id="obrazek">
             <img src="obrazky/no.jpg">   
            </div>
            <div id="formular">
            <form action="/DatabazePsinec">
                Uzivatelske jmeno:<br>
                <input type="text" name="user" >
                <br>
                Heslo:<br>
                <input type="password" name="heslo">
                <br><br>
                <input type="submit" value="Potvrd">
            </form>
            </div>
            </div>
        </div>
    </body>
</html>
