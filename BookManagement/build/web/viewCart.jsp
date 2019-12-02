<%-- 
    Document   : viewCart
    Created on : Nov 27, 2019, 9:52:41 PM
    Author     : hieu
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View cart page</title>
        <link href="css/viewCart.css" rel="stylesheet" type="text/css"/>
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'>
    </head>

    <body style="background-image: url('Images/bg/bg1.jpg');">

        <h1 style="color: #ce1185">My Cart</h1>
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
        <c:if test="${empty sessionScope.ROLEID}">
            <jsp:forward page="login.jsp"></jsp:forward>
        </c:if>
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
            <a href="login.html"><i class="fas fa-history"></i>  History</a>

        </div>

        <c:if test="${empty sessionScope.CART}">    
            <h1 style="color: #ff1dee">Empty cart. Let's Shop first !!!</h1>

        </c:if>
        <c:if test="${not empty sessionScope.CART}">      
            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Book ID</th>
                        <th>Book Title</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Unit Price</th>
                        <th>Remove</th>
                        <th>Update</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="cartDTO" items="${sessionScope.CART.cart}" varStatus="counter">  
                    <form action="updateCart">
                        <tr>

                            <td>${counter.count}</td>
                            <td> <input type="text" name="txtId" value="${cartDTO.getValue().bookId}" readonly="true"/> </td>
                            <td> <input type="text" name="txtTitle" value="${cartDTO.getValue().title}" readonly="true" /> </td>
                            <td> <input type="number" name="txtQuantity" min="1" value="${cartDTO.getValue().quantity}" required="true" />

                            </td>
                            <td> <input type="text" name="txtPrice" value="${cartDTO.getValue().price}" readonly="true" /> </td>
                            <td> <input type="text" name="txtUnitPrice" value="${cartDTO.getValue().totalUnitPrice}" readonly="true" /> </td>
                            <td>
                                <c:url var="removeLink" value="removeCart">
                                    <c:param name="txtId" value="${cartDTO.getValue().bookId}"></c:param>
                                </c:url>
                                <a href="${removeLink}" onclick="return confirm('selected items will be deleted. Are you sure?');">Remove</a>
                            </td>
                            <td>
                                <input type="submit" value="Update" />
                            </td>
                        </tr>
                    </form>
                </c:forEach>
            </tbody>
        </table>
        <h1>Total Order :${sessionScope.CART.totalOrder}</h1> 
        <c:if test="${not empty requestScope.ERROR}">
            <c:forEach var="error" items="${requestScope.ERROR}">
                <h3><font color="red">${error}</font></h3>
                </c:forEach>
            </c:if>
        <form action="confirm">
            <input type="submit" value="Confirm" />
        </form>
    </c:if>
</body>
</html>
