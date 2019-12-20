<%-- 
    Document   : History
    Created on : Nov 28, 2019, 9:59:28 PM
    Author     : hieu
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping History Page</title>
        <link href="css/search.css" rel="stylesheet" type="text/css"/>
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'>
    </head>

    <body style="background-image: url('Images/bg/bg1.jpg');">

        <h1 style="color: #ce1185">Shopping History</h1>
        <div class="welcome">
            <c:if test="${sessionScope.ROLEID eq '1'}">
                Welcome Admin, <font color="red"> ${sessionScope.USERNAME}</font>
            </c:if>
            <c:if test="${not empty sessionScope.ROLEID}">
                <c:if test="${sessionScope.ROLEID ne '1'}">
                    Welcome User, <font color="red">${sessionScope.USERNAME}</font>
                </c:if>
            </c:if>
            <c:if test="${not empty sessionScope.ROLEID}">
                <form action="logout" class="btn">
                    <input type="submit" value="Logout" name="btAction"/>
                </form>
            </c:if>

            <c:if test="${empty sessionScope.ROLEID}">
                <div class="login">
                    <a href="login.jsp"><i class='far fa-user-circle'></i>  Login</a>
                </div>
            </c:if>        

        </div>


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
            <a href="viewCart.jsp"><i class='fas fa-shopping-cart'></i>  Your Cart</a>
            <a href="history.jsp"><i class="fas fa-history"></i>  History</a>

        </div>
        <c:if test="${not empty sessionScope.ORDERLIST}">
            <h2>My History</h2>
            <div class="container">
                <table border="1" style="margin: 0 auto">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>User ID</th>
                            <th>Total Price </th>
                            <th>Shopping Date</th>
                            <th>View Detail</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="orderList" items="${sessionScope.ORDERLIST}">
                            <tr>
                                <td>${orderList.orderId}</td>
                                <td>${orderList.userId}</td>
                                <td>${orderList.totalPrice}</td>
                                <td>${orderList.date}</td>
                                <td>
                                    <c:url var="detailLink" value="viewDetail">
                                        <c:param name="txtOrderId" value="${orderList.orderId}"></c:param>
                                    </c:url>
                                    <a href="${detailLink}">View Detail</a>
                                </td>
                            </tr>    
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>


    </body>
</html>
