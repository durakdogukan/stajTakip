<%@ page import="com.stajTakip.model.User" %>
<%@ page import="com.stajTakip.model.Danisman" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--<%--%>
<%-- User user = (User) request.getSession().getAttribute("user");--%>
<%-- if (user==null)--%>
<%--  response.sendRedirect("/student_login");--%>
<%--%>--%>

<%
 User user = (User) request.getSession().getAttribute("user");
 Danisman danisman = (Danisman) request.getSession().getAttribute("danisman");
 if (danisman == null)
  response.sendRedirect("/student_login");
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Add Student</title>
 <link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
 <script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
 <script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
</head>
<body>
 <div class="container">
  <spring:url value="/student/addStudent" var="addURL" />

  <h2>Add Student</h2>

  <form:form modelAttribute="studentForm" method="post" action="${addURL}" cssClass="form" >

   <form:hidden path="id"/>

   <div class="form-group">
    <label>First Name</label>
    <form:input path="firstname" cssClass="form-control" id="firstname" />
   </div>

   <div class="form-group">
    <label>Last Name</label>
    <form:input path="lastname" cssClass="form-control" id="lastname" />
   </div>

   <div class="form-group">
    <label>Number</label>
    <form:input path="number" cssClass="form-control" id="number" />
   </div>

   <div class="form-group">
    <label>Email</label>
    <form:input path="email" cssClass="form-control" id="email" />
   </div>

   <div class="form-group">
    <label>Phone</label>
    <form:input path="phone" cssClass="form-control" id="phone" />
   </div>

   <div class="form-group">
    <label>Gender</label>
<%--    <form:input path="gender" cssClass="form-control" id="gender" />--%>

     <form:select path = "gender" id = "gender" cssClass="form-control">

      <form:option disabled="true" value = "" label = "Cinsiyet Seçiniz" />
      <form:option value = "E" label = "Erkek" />
      <form:option value = "K" label = "Kadın" />
      <form:option value = "D" label = "Diğer" />

     </form:select>
   </div>

   <div class="form-group">
    <label>Birthday</label>
    <form:input path="birthday" type="date" cssClass="form-control"  id="birthday" name="trip-start"/>
   </div>

   <div class="form-group">
    <label>Department</label>
    <form:input path="department" cssClass="form-control" id="department" />
   </div>

<%--   <div class="form-group">--%>
<%--    <label>Danisman</label>--%>
<%--    <form:input path="danisman" cssClass="form-control" id="danisman" />--%>
<%--   </div>--%>


   <div class="form-group">
    <label>Danisman</label>

    <form:select path = "danisman" id = "danisman" cssClass="form-control">

     <form:option disabled="true" value = "" label = "Danisman Seçiniz" />
     <form:options items = "${danismanList}" itemLabel="fullname"/>

    </form:select>



 <div class="form-group">

    <label>User</label>
<%--    <form:input path="user" cssClass="form-control" id="user" />--%>

    <form:select path = "user" id = "user" cssClass="form-control">

     <form:option disabled="true" value = "" label = "Kullanıcı Seçiniz" />
     <form:options items = "${userList}" itemLabel="username"/>

    </form:select>

   </div>


   <button type="submit" class="btn btn-success">Add Student</button>
  </form:form>
  
 </div>
</body>
</html>
