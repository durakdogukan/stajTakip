<%@ page import="com.stajTakip.model.User" %>
<%@ page import="com.stajTakip.model.Danisman" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%
    User user = (User) request.getSession().getAttribute("user");
    Danisman danisman = (Danisman) request.getSession().getAttribute("danisman");
    if (danisman == null)
        response.sendRedirect("/student_login");
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Sirket Bilgisi Ekle / Güncelle</title>
    <link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
</head>
<body>
<div class="container">

    <spring:url value="/sirketbilgisi/addSirketbilgisi" var="addURL" />

    <h2>Add User</h2>

    <form:form modelAttribute="sirketbilgisiForm" method="post" action="${addURL}" cssClass="form" >

        <form:hidden path="id"/>

        <div class="form-group">
            <label>Ad</label>
            <form:input path="ad" cssClass="form-control" id="ad" />
        </div>

        <div class="form-group">
            <label>Şehir</label>
            <form:input path="sehir" cssClass="form-control" id="sehir" />
        </div>

        <div class="form-group">
            <label>Adres</label>
            <form:input path="adres" cssClass="form-control" id="adres" />
        </div>

        <div class="form-group">
            <label>Web Site</label>
            <form:input path="website" cssClass="form-control" id="password" />
        </div>

        <button type="submit" class="btn btn-success">Sirket Bilgisi Ekle / Güncelle</button>
    </form:form>

</div>
</body>
</html>
