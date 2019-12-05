<%-- 
    Document   : createNewUser
    Created on : Nov 27, 2019, 3:18:51 PM
    Author     : hieu
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'>
        <title>Create New User Page</title>
        <link href="css/addNewBook.css" rel="stylesheet" type="text/css"/>
    </head>

    <body style="background-image: url('Images/bg/back02.jpg');">
        <c:if test="${sessionScope.ROLEID ne '1'}">
            <jsp:forward page="login.jsp"></jsp:forward>
        </c:if>
        <c:set var="error" value="${requestScope.ERRORCREATEUSER}"/>
        <div class="nav">
            <c:url var="homeLink" value="search">            
            </c:url>
            <a class="active" href="${homeLink}"><i class="fa fa-fw fa-home"></i>  Home</a> 

            <div class="dropdown">
                <a href="*" class="sub"><i class="fas fa-book-open"></i>Category</a>
                <div class="subMenu"> 
                    <c:forEach var="cat" items="${sessionScope.CATEGORYLIST}">
                        <c:url var="link" value="searchByCategory" >
                            <c:param name="id" value="${cat.categoryId}"></c:param>
                        </c:url> 
                        <div class="menu"> <a href="${link}"> ${cat.categoryName}</a></div>     
                    </c:forEach>
                </div>	
            </div>
            <a href="addNewBook.jsp"><i class="fas fa-book"></i>  Add New Book</a>
            <a href="createNewUser.jsp"><i class="fas fa-book"></i>  Create New User</a>
            <a href="LoadUser"><i class='far fa-user-circle'></i>  Manager User</a>

        </div>
        <div class="welcome">
            <h1>New User</h1>
            <form action="logout" class="btn">
                Welcome Admin, <font color="Blue" style="font-weight:bold;font-size:18px;">${sessionScope.USERNAME}</font>
                <input type="submit" value="Logout" name="btnAction" />
            </form>
        </div>
        <div class="container">
            <form action="createNewUser" method="POST" class="btn2">
                User ID <input type="text" name="txtUserId" value="${param.txtUserId}" /><br/>
                <c:if test="${not empty error.userIdError}">
                    <font color="red">${error.userIdError}</font><br/>
                </c:if>
                User Name <input type="text" name="txtUserName" value="${param.txtUserName}" /><br/>
                <c:if test="${not empty error.userNameError}">
                    <font color="red">${error.userNameError}</font><br/>
                </c:if>
                Password <input type="password" name="txtPassword" value="" /><br/>
                <c:if test="${not empty error.passwordError}">
                    <font color="red">${error.passwordError}</font><br/>
                </c:if>
                Confirm Password <input type="password" name="txtConfirmPassword" value="" /><br/>
                <c:if test="${not empty error.confirmPasswordError}">
                    <font color="red">${error.confirmPasswordError}</font><br/>
                </c:if>
                <select name="cbmChoosedRole">
                    <c:forEach var="dto" items="${sessionScope.ROLELIST}" varStatus="counter">
                        <option value="${dto.roleId}">${dto.roleName}</option><br/>
                    </c:forEach>
                </select>  
                <input type="submit" value="Create" name="btnAction" /><br/>
                <c:if test="${not empty requestScope.SUCCESSCREATEUSER}">
                    <h1>${requestScope.SUCCESSCREATEUSER}</h1>
                </c:if>
            </form>
        </div>
    </body>
</html>
