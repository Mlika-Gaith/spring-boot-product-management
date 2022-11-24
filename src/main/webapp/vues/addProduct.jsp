<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add a Product</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" 
rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" 
crossorigin="anonymous">
</head>
<body>
<%@include file="navbar.html" %>
<br>
<br>
<br>
<c:if test="${message!=null}">
<div class="alert alert-success" role="alert">
<c:out value="${message}"></c:out>
${product=null}
</div>
</c:if>
<div class=container>
<div class="card m-5 p-2">
 <div class="card-header"><h2>Add New Product</h2></div>
<div class="card-body">
<form action="/products/saveproduct" enctype="multipart/form-data" method=post>

 <div class="mb-3 mt-3">
 <label for="name" class="form-label">Name:</label>
 <input type=text class="form-control" id="name" name="name" value="${product.name}">
 </div>
 <div class="mb-3">
 <label for="price" class="form-label">Price:</label>
 <input type="number" class="form-control" id="price" name="price" value="${product.price}">
 </div>
 <div class="mb-3">
 <label for="quantity" class="form-label">Quantity:</label>
 <input type="number" class="form-control" id="quantity" name="quantity" value="${product.quantity}">
 </div>
 <div class="mb-3">
 <input type=hidden name=photo value="${produit.photo}">
<label class="form-label">Add a Photo</label> 
<input type="file"name="file" accept="image/png,image/jpeg,image/jpg" class=form-control />
 </div>
 <div class="mb-3">
 <label for="Category" class="form-label">Category:</label>
 <select name="category" >
 <option selected hidden>Choose here</option>
 <c:forEach items="${categories}" var="cc">
 <option value=${cc.id} <c:if test="${product.category.id==cc.id}">selected="true"</c:if>>${cc.name} </option>
 </c:forEach>
 </select>
 </div>
 <input type=hidden name=id value="${product.id}">

 <button type="submit" class="btn btn-primary" >Save</button>
</form></div> </div></div>
</body>
</html>