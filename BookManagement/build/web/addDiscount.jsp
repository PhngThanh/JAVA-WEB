<%-- 
    Document   : addDiscount
    Created on : Nov 28, 2019, 11:38:42 AM
    Author     : USER
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'>
        <title>Create Discount code Page</title>
    </head>
    <body style="background-image: url('Images/bg/back02.jpg');">
        <c:set var="error" value="${requestScope.ERROR}"/>
        <form action="creatDiscount" method="POST">
            User ID: <input type="text" name="txtUserId" value="${param.txtUserId}" readonly="" /> <br/>
            <c:if test="${not empty error.userIdError}">
                <font color="red">${error.userIdError}</font><br/>
            </c:if>
            Discount ID: <input type="text" name="txtDiscountId" value="" pattern="[A-Z]{3}[0-9]{2}" required=""/> <br/>
            <c:if test="${not empty error.discountCodeError}">
                <font color="red">${error.discountCodeError}</font><br/>
            </c:if>
            Discount Percent:
            <select name="cbPercent">
                <option value="10">10%</option>
                <option value="20">20%</option>
                <option value="30">30%</option>
                <option value="40">40%</option>
                <option value="50">50%</option>
                <option value="60">60%</option>
                <option value="70">70%</option>
            </select>
            <input type="submit" value="Submit" />
        </form>
    </body>
</html>
