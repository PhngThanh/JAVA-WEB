<%-- 
    Document   : managerUser
    Created on : Nov 28, 2019, 10:48:26 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'>
        <title>Manager User</title>
        <link href="css/managerUser.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <body>
        <c:if test="${sessionScope.ROLEID ne '1'}">
            <jsp:forward page="login.jsp"></jsp:forward>
        </c:if> 
        <div class="welcome">
            <h1>Update Book</h1>
            <form action="logout" class="btn">
                Welcome Admin, <font color="red">${sessionScope.USERNAME}</font>
                <input type="submit" value="Logout" name="btnAction" />
            </form>
        </div>      
        <div class="nav">
            <c:url var="homeLink" value="search">            
            </c:url>
            <a class="active" href="${homeLink}"><i class="fa fa-fw fa-home"></i>  Home</a> 
            <c:if test="${empty sessionScope.ROLEID}">
                <a href="login.jsp"><i class='far fa-user-circle'></i>  Login</a>
            </c:if>  
            <a href="addNewBook.jsp"><i class="fas fa-book"></i>  Add New Book</a>
            <a href="createNewUser.jsp"><i class="fas fa-book"></i>  Create New User</a>
            <a href="LoadUser"><i class='far fa-user-circle'></i>  Manager User</a>
        </div>

        <c:if test="${not empty requestScope.USERLIST}">
            <table border="1" id='tblSubject'>
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>User ID</th>
                        <th>User Name</th>
                        <th>Add Discount Code</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dto" items="${requestScope.USERLIST}" varStatus="counter">
                        <tr>
                            <td>${counter.count}</td>
                            <td>${dto.userId}</td>
                            <td> ${dto.userName}</td>
                            <td>
                                <c:url var="addDiscount" value="addDiscount.jsp">
                                    <c:param name="txtUserId" value="${dto.userId}"></c:param>
                                </c:url>
                                <a href="${addDiscount}">ADD</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </body>
</html>
