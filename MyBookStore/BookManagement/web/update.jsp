<%-- 
    Document   : update
    Created on : Nov 13, 2019, 10:05:05 PM
    Author     : Do Trong Hieu
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'>
        <title>Update Page</title>
        <link href="css/update.css" rel="stylesheet" type="text/css"/>
    </head>

    <body style="background-image: url('Images/bg/bground.jpg');">
        <c:if test="${sessionScope.ROLEID ne '1'}">
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
            <a href="addNewBook.jsp"><i class="fas fa-book"></i>  Add New Book</a>
            <a href="createNewUser.jsp"><i class="fas fa-book"></i>  Create New User</a>
            <a href="LoadUser"><i class='far fa-user-circle'></i>  Manager User</a>

        </div>
        <div class="welcome">
            <h1>Update Book</h1>
            <form action="logout" class="btn">
                Welcome Admin, <font color="red">${sessionScope.USERNAME}</font>
                <input type="submit" value="Logout" name="btnAction" />
            </form>
        </div>

        <div class="container">
            <c:set var="error" value="${requestScope.ERRORUPDATE}"/> 
            <form action="update" method="POST" class="btn2">        
                Book ID<input type="text" name="txtId" value="${param.txtId}" required="true"  readonly="true"/><br/>
                Book Title<input type="text" name="txtTitle" value="${param.txtTitle}" required="true" /><br/>
                <c:if test="${not empty error.bookTitleLength}">
                    <font color="red">${error.bookTitleLength}</font><br/>
                </c:if>
                Book Author<input type="text" name="txtAuthor" value="${param.txtAuthor}" required="true" /><br/>
                <c:if test="${not empty error.authorLengthErr}">
                    <font color="red">${error.authorLengthErr}</font><br/>
                </c:if>
                Description<textarea name="txtDescription" style="height:200px">${param.txtDescription}</textarea><br/>
                <c:if test="${not empty error.desciptionLengthErr}">
                    <font color="red">${error.desciptionLengthErr}</font><br/>
                </c:if>
                Price<input type="number" name="txtPrice" value="${param.txtPrice}" required="true" /><br/>
                <c:if test="${not empty error.priceFormatErr}">
                    <font color="red">${error.priceFormatErr}</font><br/>
                </c:if>
                Quantity <input type="number"  min="1" name="txtQuantity" value="${param.txtQuantity}" required="true" /><br/>
                <c:if test="${not empty error.quantityFormatErr}">
                    <font color="red">${error.quantityFormatErr}</font><br/>
                </c:if>
                Import date <input type="date" name="txtImportDate" value="${param.txtImportDate}" required="true" /><br/>
                photo <input type="file" name="txtPhoto" value="choose" required="true" /><br/>
                Choose category
                <select name="cbmChoosedCat">
                    <c:if test="${empty error}">
                        <option value="${param.txtCategoryId}" selected="true">${param.txtCatName}</option>
                    </c:if>

                    <c:forEach var="dto" items="${sessionScope.CATEGORYLIST}" varStatus="counter">
                        <c:if test="${dto.categoryName ne param.txtCatNames}">
                            <option value="${dto.categoryId}">${dto.categoryName}</option>
                        </c:if>

                    </c:forEach>
                </select>  
                <input type="submit" value="Update" name="btnAction"/>
            </form>
        </div>
    </body>
</html>
