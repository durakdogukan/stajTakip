<%@ page import="com.stajTakip.model.User" %>
<%@ page import="com.stajTakip.model.Danisman" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <title>Staj Bilgisi Ekle / Güncelle</title>
    <link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
    <script>
        function kontrol(){
            if (document.form.baslamatarihi.value == ""){
                alert ( "Staja Başlama Tarihi Giriniz" );
                return false;
            }
            if (document.form.bitistraihi.value == ""){
                alert ( "Staj Bitiş Tarihi Giriniz" );
                return false;
            }
            if (document.form.stajpuani.value == ""){
                alert ( "Staj puanı Giriniz" );
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<div class="container">

    <spring:url value="/stajbilgisi/addStajbilgisi" var="addURL" />

    <h2>Staj Birimi Ekle / Güncelle</h2>

    <form:form name="form" modelAttribute="stajbilgisiForm" method="post" action="${addURL}" cssClass="form" onsubmit="return kontrol();" >

        <form:hidden path="id"/>

    <div class="form-group">

        <div class="form-group">
            <label>Öğrenci Adı</label>

            <form:select path = "student" id = "student" cssClass="form-control">

                <form:option disabled="true" value = "" label = "Öğrenci Seçiniz" />
                <form:options items = "${studentList}" itemLabel="fullname"/>

            </form:select>

        </div>

        <div class="form-group">
            <label>Öğrenci Numarası</label>

            <form:select path = "student" id = "student" cssClass="form-control">

                <form:option disabled="true" value = "" label = "Öğrenci Numarası Seçiniz" />
                <form:options items = "${studentList}" itemLabel="number"/>

            </form:select>

        </div>

        <div class="form-group">
            <label>Şirket Adı</label>

            <form:select path = "stajbirim.sirketbilgisi" id = "stajbirim.sirketbilgisi" cssClass="form-control">

                <form:option disabled="true" value = "" label = "Şirket Seçiniz" />
                <form:options items = "${sirketbilgisiList}" itemLabel="ad"/>

            </form:select>

        </div>


        <div class="form-group">
            <label>Staj Birimi</label>

            <form:select path = "stajbirim" id = "stajbirim" cssClass="form-control">

                <form:option disabled="true" value = "" label = "Staj Birimi Seçiniz" />

                <form:options items = "${stajbirimList}" itemLabel="ad"/>

            </form:select>

        </div>



        <div class="form-group">
            <label>Staja Başlama Tarihi</label>
            <form:input path="baslamatarihi" type="date" cssClass="form-control"  id="baslamatarihi" name="trip-start" />
        </div>


        <div class="form-group">
            <label>Staj Bitiş Tarihi</label>
            <form:input path="bitistraihi" type="date" cssClass="form-control"  id="bitistraihi" name="trip-start"/>
        </div>


        <div class="form-group">
            <label>Staj Puanı</label>
            <form:input path="stajpuani" cssClass="form-control" id="stajpuani" />
        </div>

        <div class="form-group">
            <label>Yorum</label>
            <form:input path="yorum" cssClass="form-control" id="yorum" maxlength="500"/>
        </div>

        <button type="submit" class="btn btn-success">Staj Birimi Ekle / Güncelle</button>

        </form:form>

    </div>
</body>
</html>
