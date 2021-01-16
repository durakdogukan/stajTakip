<%@ page import="com.stajTakip.model.User" %>
<%@ page import="com.stajTakip.model.Danisman" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%
    User user = (User) request.getSession().getAttribute("user");
    Danisman danisman = (Danisman) request.getSession().getAttribute("danisman");
    if (danisman == null)
        response.sendRedirect("/student_login");
%>

<%--<%--%>
<%--    User user = (User) request.getSession().getAttribute("user");--%>
<%--    if (user==null)--%>
<%--        response.sendRedirect("/student_login");--%>
<%--%>--%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add User</title>
    <link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
</head>
<body>
<div class="container">
    <spring:url value="/user/addUser" var="addURL" />

    <h2>Add User</h2>

    <form:form modelAttribute="userForm" method="post" action="${addURL}" cssClass="form" >

        <form:hidden path="id"/>

        <div class="form-group">
            <label>Username</label>
            <form:input path="username" cssClass="form-control" id="username" />
        </div>

        <div class="form-group">
            <label>Password</label>
            <form:input path="password" cssClass="form-control" id="password" type="password" />
        </div>



        <button type="submit" class="btn btn-success">Add User</button>
    </form:form>

</div>
</body>
</html>
