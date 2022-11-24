<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Products</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" 
rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" 
crossorigin="anonymous">
</head>
<body>
    <%@include file="navbar.html"%>
    <br><br>
    <div class="container">
        <div class="row">
            <div class="col">
            <form method=get action=productkeyword> 
            <div class="row">
            <div class="col">
            <label for="keyword" class="form-label">Search Product By Name:</label>
            </div>
            <div class="col">
            <input type="text" id="keyword" class="form-control" name=keyword placeholder="keyword ..">
            </div>
            <div class="col">
            <button type="submit" class="btn btn-primary">Search</button>
            </div>
            </div>
            </form>
            </div>
            
            <div class="col-md-auto">
                <form method="GET" action="productByCategory">
                <select class="form-select" name="category" onchange="submit()">
                <option selected hidden>${category}</option>
                <option value="0">All Categories</option>
                <c:forEach items="${categories}" var ="cc">
                <option value="${cc.id}">${cc.name}</option>
                </c:forEach>
                </select>
                </form>
            </div>
        </div>
    </div>
    <br><hr>
    <table class="table table-hover">
    <tr>
     <th>Photo</th><th>Id</th><th>Name</th><th>Price</th><th>Quantity</th><th>Category</th><th>Action</th>
    </tr>
    <c:forEach items="${products}" var="p">
    <tr>
    <td>
    <c:choose>
    <c:when test="${p.photo==''}">
    <img src="/imagesdata/unknown.jpg" width=50 height=50>
    </c:when>
    <c:when test="${p.photo!=''}">
    <img src="/imagesdata/${p.photo}" width=50 height=50>
    </c:when>
    </c:choose>
    </td>
    <td>${p.id}</td>
    <td>${p.name}</td>
    <td>${p.price}</td>
    <td>${p.quantity}</td>
    <td>${p.category.name}</td>
    <td><a href="/products/deleteproduct/${p.id}"
     class="btn btn-danger"><span class="fa fa-trash"></span></a>
     <a href="/products/editproduct/${p.id}" class="btn btn-warning">
     <span class="fa fa-edit"></a></td>
    </tr>
    </c:forEach>
    </table>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/e212a7aef7.js" crossorigin="anonymous"></script>
</html>