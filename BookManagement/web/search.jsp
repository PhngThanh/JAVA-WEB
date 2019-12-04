<%-- 
    Document   : search
    Created on : Nov 25, 2019, 11:21:24 PM
    Author     : hieu
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Store</title>
        <link href="css/search.css" rel="stylesheet" type="text/css"/>
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'>
    </head>


    <body style="background-image: url('Images/bg/bg1.jpg');">

        <h1 style="color: #ce1185">My Book Store</h1>
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
            <c:if test="${not empty sessionScope.ROLEID}">
                <c:if test="${sessionScope.ROLEID eq '1'}">
                    <a href="addNewBook.jsp"><i class="fas fa-book"></i>  Add New Book</a>
                    <a href="createNewUser.jsp"><i class="fas fa-book"></i>  Create New User</a>
                    <a href="LoadUser"><i class='far fa-user-circle'></i>  Manager User</a>
                </c:if>
                <c:if test="${sessionScope.ROLEID ne '1'}">
                    <a href="viewCart.jsp"><i class='fas fa-shopping-cart'></i>  Your Cart</a>
                    <a href="history.jsp"><i class="fas fa-history"></i>  History</a>
                </c:if>

            </c:if>
        </div>
        <form action="search">
            Search with title <input type="text" name="txtSearchValue" value="${param.txtSearchValue}" />
            <input type="submit" value="Search" name="btnAction" />
        </form>
        <form action="searchByPrice">
            from <input type="number" name="txtMinPrice" value="${param.txtMinPrice}" required="true" />
            to <input type="number" name="txtMaxPrice" value="${param.txtMaxPrice}" required="true" />
            <input type="submit" value="Search" name="btnAction" />
        </form>
        <c:set var="categoryList" value="${sessionScope.CATEGORYLIST}"/>

        <c:if test="${empty requestScope.BOOKLIST}">
            <h3> No Book is matched!! </h3>
        </c:if>
        <c:if test="${not empty requestScope.BOOKLIST}">
            <div class="container">
                <table border="1" style="margin: 0 auto">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Title</th>
                            <th>image</th>
                            <th>description</th>
                            <th>price</th>
                            <th>author</th>
                            <th>category</th>
                                <c:if test="${sessionScope.ROLEID eq '1'}">
                                <th>Delete</th>
                                <th>Update</th>
                                </c:if>
                                <c:if test="${not empty sessionScope.ROLEID}">
                                    <c:if test="${sessionScope.ROLEID ne '1'}">
                                    <th>Add to Cart</th>
                                    </c:if>
                                </c:if>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dto" items="${requestScope.BOOKLIST}" varStatus="counter">
                        <form action="delete">


                            <tr>
                                <td>${counter.count}</td>
                                <td>${dto.bookTitle}</td>
                                <td><img src="Images/Books/${dto.image}" alt=""/></td>

                                <td>${dto.description}</td>
                                <td>${dto.price}</td>
                                <td>${dto.author}</td>
                                <td>
                                    <c:forEach var="category" items="${sessionScope.CATEGORYLIST}">
                                        <c:if test="${dto.categoryId eq category.categoryId}">
                                            ${category.categoryName}
                                            <c:set var="cat" value="${category.categoryName}"/>
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <c:if test="${sessionScope.ROLEID eq '1'}">
                                    <td>
                                        <input type="hidden" name="txtId" value="${dto.bookId}" />
                                        <input type="submit" value="Delete" name="btnAction" onclick="
                                                return confirm('selected items will be deleted. Are you sure?');" />
                                    </td>
                                    <td>
                                        <c:url var="updateLink" value="update.jsp">
                                            <c:param name="txtId" value="${dto.bookId}"></c:param>
                                            <c:param name="txtTitle" value="${dto.bookTitle}"></c:param>
                                            <c:param name="txtImage" value="${dto.image}"></c:param>
                                            <c:param name="txtDescription" value="${dto.description}"></c:param>
                                            <c:param name="txtPrice" value="${dto.price}"></c:param>
                                            <c:param name="txtAuthor" value="${dto.author}"></c:param>
                                            <c:param name="txtImportDate" value="${dto.importDate}"></c:param>
                                            <c:param name="txtCategoryId" value="${dto.categoryId}"></c:param>
                                            <c:param name="txtCatName" value="${cat}"></c:param>
                                            <c:param name="txtQuantity" value="${dto.quantity}"></c:param>
                                        </c:url>
                                        <a href="${updateLink}">Update</a>
                                    </td>
                                </c:if>
                                <c:if test="${not empty sessionScope.ROLEID}">
                                    <c:if test="${sessionScope.ROLEID ne '1'}">
                                        <td>
                                            <c:url var="addToCartLink" value="addToCart">
                                                <c:param name="txtTitle" value="${dto.bookTitle}"></c:param>
                                                <c:param name="txtPrice" value="${dto.price}"></c:param>
                                                <c:param name="txtId" value="${dto.bookId}"></c:param>
                                            </c:url>
                                           <a href="${addToCartLink}">ADD</a>

                                        </td>                               
                                    </c:if>
                                </c:if>
                            </tr>
                        </form>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
    </body>
</html>
