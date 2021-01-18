<%@ page import="com.stajTakip.model.User" %>
<%@ page import="org.springframework.context.support.AbstractApplicationContext" %>
<%@ page import="org.springframework.context.annotation.AnnotationConfigApplicationContext" %>
<%@ page import="com.stajTakip.services.DanismanService" %>
<%@ page import="com.stajTakip.model.Danisman" %>
<%@ page import="org.springframework.web.servlet.ModelAndView" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <title>Danışman Ekle / Güncelle</title>
    <link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
    <script>
        function kontrol(){

            if (document.form.ad.value == ""){
                alert ( "Danışman Ad Giriniz" );
                return false;
            }
            if (document.form.soyad.value == ""){
                alert ( "Danışman Soyad Giriniz" );
                return false;
            }

            <c:forEach items="${danismanList}" var="danisman" >

            if ((document.form.ad.value == "${danisman.ad}") && (document.form.soyad.value == "${danisman.soyad}") && (document.form.user.value != "${danisman.user.id}")){
                alert("Bu Danışman Sistemde Kayıtlıdır !\r\n" + "${danisman.ad}" + " ${danisman.soyad}");
                return false;
            }

            </c:forEach>

<%--            <c:forEach items="${danismanList}" var="danisman" >--%>

<%--            if ((document.form.user.value != "${danisman.user.id}")){--%>
<%--                alert("Yanlış Kullanıcı Girdiniz !")--%>
<%--                return false;--%>
<%--            }--%>

<%--            </c:forEach>--%>

            return true;
        }
    </script>
</head>
<body>
<div class="container">
    <spring:url value="/danisman/addDanisman" var="addURL" />

    <h2>Danışman Ekle / Güncelle</h2>

    <form:form name="form" modelAttribute="danismanForm" method="post" action="${addURL}" cssClass="form" onsubmit="return kontrol();" >

        <form:hidden path="id"/>

        <div class="form-group">
            <label>Danışman Adı</label>
            <form:input path="ad" cssClass="form-control" id="ad" maxlength="20"/>
        </div>

        <div class="form-group">
            <label>Danışman Soyadı</label>
            <form:input path="soyad" cssClass="form-control" id="soyad" maxlength="30"/>
        </div>

        <div class="form-group">

            <label>Kullanıcı Adı</label>

            <form:select path = "user" id = "user" cssClass="form-control">

                <form:option disabled="true" value = "" label = "Kullanıcı Seçiniz" />
                <form:options items = "${userList}" itemLabel="username"/>

            </form:select>

            <div class="form-group">

        <button type="submit" class="btn btn-success">Danışman Ekle / Güncelle</button>
    </form:form>

</div>
</body>
</html>
