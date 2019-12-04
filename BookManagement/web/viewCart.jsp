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
    <style>
        /* Add Zoom Animation */
        .animate {
            -webkit-animation: animatezoom 0.6s;
            animation: animatezoom 0.6s
        }

        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            padding-top: 60px;
        }

        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
            border: 1px solid #888;
            width: 80%; /* Could be more or less, depending on screen size */
        }
    </style>
    <c:if test="${ not empty requestScope.WORNG}">
        <body  style="background-image: url('Images/bg/bg1.jpg');" onload="document.getElementById('id01').forms['myForm'].submit()">
            <h1 style="color: #ce1185">My Cart DDDDĐ</h1>
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
                <a href="history.jsp"><i class="fas fa-history"></i>  History</a>

            </div>

            <c:if test="${empty sessionScope.CART}">    
                <h1 style="color: #ff1dee">Empty cart. Let's Shop first !!!</h1>

            </c:if>
            <c:if test="${not empty sessionScope.CART}">   
                <div class="container">
                    <h3 style="margin-top: -20px">My Order: </h3>
                    <c:if test="${ not empty requestScope.CORRECT}">
                        ${requestScope.CORRECT}
                    </c:if>

                    <table border="1" style="margin: 0 auto">
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
                                    <td> 
                                        <input type="hidden" name="txtId" value="${cartDTO.getValue().bookId}" readonly="true"/>
                                        ${cartDTO.getValue().bookId}
                                    </td>
                                    <td> 
                                        <input type="hidden" name="txtTitle" value="${cartDTO.getValue().title}" readonly="true" />
                                        ${cartDTO.getValue().title}
                                    </td>
                                    <td> 
                                        <input type="number" name="txtQuantity" min="1" value="${cartDTO.getValue().quantity}" required="true" />

                                    </td>
                                    <td> 
                                        <input type="hidden" name="txtPrice" value="${cartDTO.getValue().price}" readonly="true" />
                                        ${cartDTO.getValue().price}
                                    </td>
                                    <td>
                                        <input type="hidden" name="txtUnitPrice" value="${cartDTO.getValue().totalUnitPrice}" readonly="true" /> 
                                        ${cartDTO.getValue().totalUnitPrice}
                                    </td>
                                    <td>
                                        <c:url var="removeLink" value="removeCart">
                                            <c:param name="txtId" value="${cartDTO.getValue().bookId}"></c:param>
                                        </c:url>
                                        <a href="${removeLink}" onclick="return confirm('selected items will be deleted. Are you sure?');">Remove</a>
                                    </td>
                                    <td>
                                        <input type="submit" value="Update"/>
                                    </td>
                                </tr>
                            </form>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="price">
                        <h1 >Total Order :${sessionScope.CART.totalOrder}</h1> 
                        <button onclick="document.getElementById('id01').style.display = 'block'" style="width:auto;" class="button">Add Discount code</button>
                        <form action="confirm" class="btn2">
                            <input type="submit" value="Confirm" />

                        </form>
                    </div>
                </div>



                        <div id="id01" class="modal btn3">
                    <form name="myForm" class="modal-content animate" action="useDiscount" method="post">
                        <div class="container2">
                            <label for="txtDiscountID"><b>Discount Code</b></label>
                            <input type="text" placeholder="Enter Discount Code" name="txtDiscountID" required>
                            <br/>
                            <div class="buttonn">
                                <input type="submit" value="OK" name="btnAction" />
                            </div>
                        </div>
                        <button type="button" onclick="document.getElementById('id01').style.display = 'none'" class="cancelbtn">Close</button>
                        <br/>
                    </form>
                </div>
                <script>
                    // Get the modal
                    var modal = document.getElementById('id01');

                    // When the user clicks anywhere outside of the modal, close it
                    window.onclick = function (event) {
                        if (event.target == modal) {
                            modal.style.display = "none";
                        }
                    }
                </script>   

                <c:if test="${not empty requestScope.ERROR}">
                    <c:forEach var="error" items="${requestScope.ERROR}">
                        <h3><font color="red">${error}</font></h3>
                        </c:forEach>
                    </c:if>

            </c:if>
        </body>
    </c:if>
    <c:if test="${empty requestScope.WORNG or not empty requestScope.CORRECT}">
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
                <a href="history.jsp"><i class="fas fa-history"></i>  History</a>

            </div>

            <c:if test="${empty sessionScope.CART}">    
                <h1 style="color: #ff1dee">Empty cart. Let's Shop first !!!</h1>

            </c:if>
            <c:if test="${not empty sessionScope.CART}">   
                <div class="container">
                    <h3 style="margin-top: -20px">My Order: </h3>
                    <c:if test="${ not empty requestScope.CORRECT}">
                        ${requestScope.CORRECT}
                    </c:if>

                    <table border="1" style="margin: 0 auto">
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
                                    <td> 
                                        <input type="hidden" name="txtId" value="${cartDTO.getValue().bookId}" readonly="true"/>
                                        ${cartDTO.getValue().bookId}
                                    </td>
                                    <td> 
                                        <input type="hidden" name="txtTitle" value="${cartDTO.getValue().title}" readonly="true" />
                                        ${cartDTO.getValue().title}
                                    </td>
                                    <td> 
                                        <input type="number" name="txtQuantity" min="1" value="${cartDTO.getValue().quantity}" required="true" />

                                    </td>
                                    <td> 
                                        <input type="hidden" name="txtPrice" value="${cartDTO.getValue().price}" readonly="true" />
                                        ${cartDTO.getValue().price}
                                    </td>
                                    <td>
                                        <input type="hidden" name="txtUnitPrice" value="${cartDTO.getValue().totalUnitPrice}" readonly="true" /> 
                                        ${cartDTO.getValue().totalUnitPrice}
                                    </td>
                                    <td>
                                        <c:url var="removeLink" value="removeCart">
                                            <c:param name="txtId" value="${cartDTO.getValue().bookId}"></c:param>
                                        </c:url>
                                        <a href="${removeLink}" onclick="return confirm('selected items will be deleted. Are you sure?');">Remove</a>
                                    </td>
                                    <td>
                                        <input type="submit" value="Update"/>
                                    </td>
                                </tr>
                            </form>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="price">
                        <h1 >Total Order :${sessionScope.CART.totalOrder}</h1> 
                        <button onclick="document.getElementById('id01').style.display = 'block'" style="width:auto;" class="button">Add Discount code</button>
                        <form action="confirm" class="btn2">
                            <input type="submit" value="Confirm" />

                        </form>
                    </div>
                </div>



                <div id="id01" class="modal btn3">
                    <form name="myForm" class="modal-content animate" action="useDiscount" method="post">
                        <div class="container2">
                            <label for="txtDiscountID"><b>Discount Code</b></label>
                            <input type="text" placeholder="Enter Discount Code" name="txtDiscountID" required>
                            <br/>
                            <div class="buttonn">
                                <input type="submit" value="OK" name="btnAction" />
                            </div>
                        </div>
                        <button type="button" onclick="document.getElementById('id01').style.display = 'none'" class="cancelbtn">Close</button>
                        <br/>
                    </form>
                </div>
                <script>
                    // Get the modal
                    var modal = document.getElementById('id01');

                    // When the user clicks anywhere outside of the modal, close it
                    window.onclick = function (event) {
                        if (event.target == modal) {
                            modal.style.display = "none";
                        }
                    }
                </script>   

                <c:if test="${not empty requestScope.ERROR}">
                    <c:forEach var="error" items="${requestScope.ERROR}">
                        <h3><font color="red">${error}</font></h3>
                        </c:forEach>
                    </c:if>

            </c:if>
        </body>
    </c:if>

</html>
