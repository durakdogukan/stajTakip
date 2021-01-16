<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <title>Student List</title>
 <link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
 <script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
 <script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
</head>
<body>
 <div class="container">
  <table class="table table-striped">
   <thead class="thead-dark">
    <th scope="row">ID</th>
    <th scope="row">First Name</th>
    <th scope="row">Last Name</th>
    <th scope="row">Update</th>
    <th scope="row">Delete</th>
   </thead>
   <tbody>
    <c:forEach items="${studentList}" var="student" >
     <tr>
      <td>${student.id}</td>
      <td>${student.firstname}</td>
      <td>${student.lastname}</td>
      <td>${student.number}</td>
      <td>${student.email}</td>
      <td>${student.email}</td>
      <td>${student.phone}</td>
      <td>${student.gender}</td>
      <td>${student.birthday}</td>
      <td>${student.department}</td>
      <td>${student.department}</td>
      <td>
       <spring:url value="/student/editStudent/${student.id}" var="editURL" />
       <a class="btn btn-info" href="${editURL}" role="button" >Update</a>
      </td>
      <td>
       <spring:url value="/student/deleteStudent/${student.id}" var="deleteURL" />
       <a class="btn btn-danger" href="${deleteURL}" role="button" >Delete</a>
      </td>
     </tr>
    </c:forEach>
   </tbody>
  </table>
  <spring:url value="/student/addStudent/" var="addURL" />
  <a class="btn btn-success" href="${addURL}" role="button" >Add New Student</a>
 </div>
</body>
</html>