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
    <title>Staj Birim Ekle / Güncelle</title>
    <link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
</head>
<body>
<div class="container">

    <spring:url value="/stajbirim/addStajbirim" var="addURL" />

    <h2>Yeni Staj Birimi Ekle</h2>

    <form:form modelAttribute="stajbirimForm" method="post" action="${addURL}" cssClass="form" >

        <form:hidden path="id"/>

        <div class="form-group">

            <label>Şirket Adı</label>

            <form:select path = "sirketbilgisi" id = "sirketbilgisi" cssClass="form-control">

                <form:option disabled="true" value = "" label = "Şirket Seçiniz" />
                <form:options items = "${sirketbilgisiList}" itemLabel="ad"/>

            </form:select>

            <div class="form-group">

        <div class="form-group">
            <label>Staj Birimi Adı</label>
            <form:input path="ad" cssClass="form-control" id="ad" />
        </div>

        <div class="form-group">
            <label>Kontakt Ad</label>
            <form:input path="kontaktad" cssClass="form-control" id="kontaktad" />
        </div>

        <div class="form-group">
            <label>Kontakt Soyad</label>
            <form:input path="kontaktsoyad" cssClass="form-control" id="kontaktsoyad" />
        </div>

        <div class="form-group">
            <label>Kontakt Unvan</label>
            <form:input path="kontaktunvan" cssClass="form-control" id="kontaktunvan" />
        </div>

        <div class="form-group">
            <label>Kontakt Telefon</label>
            <form:input path="kontakttel" cssClass="form-control" id="kontakttel" />
        </div>

        <div class="form-group">
             <label>Kontakt Email</label>
             <form:input path="kontaktemail" cssClass="form-control" id="kontaktemail" />
        </div>

                <button type="submit" class="btn btn-success">Staj Birim Ekle / Güncelle</button>
    </form:form>

</div>
</body>
</html>
