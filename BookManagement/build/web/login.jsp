<%-- 
    Document   : login
    Created on : Nov 26, 2019, 2:26:20 AM
    Author     : hieu
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <body style="background-image: url('Images/bg/vintage-flowers-backgrounds.jpg');">
        
        <div class="nav">
            <c:url var="homeLink" value="search">    
            </c:url>
            <a class="active" href="${homeLink}"><i class="fa fa-fw fa-home"></i>  Home</a> 
        </div>
        <h1>LOGIN</h1>
        <div class="container">
            <form action="login" method="POST">
                User ID<input type="text" name="txtUserId" value="" />
                Password <input type="password" name="txtPassword" value="" />
                <input type="submit" value="Login" name="btnAction" /><br/>
                <c:if test="${not empty requestScope.ERRORLOGIN}">
                    <font color="red">${requestScope.ERRORLOGIN}</font>
                </c:if>
            </form>
        </div>
    </body>
</html>
