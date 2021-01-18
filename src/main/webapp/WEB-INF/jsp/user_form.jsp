<%@ page import="com.stajTakip.model.User" %>
<%@ page import="com.stajTakip.model.Danisman" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <script>
        function kontrol(){

            if (document.form.username.value == ""){
                alert ( "Kullanıcı Adı Giriniz" );
                return false;
            }
            if (document.form.password.value == ""){
                alert ( "Parola Giriniz" );
                return false;
            }

            <c:forEach items="${userList}" var="user" >

            if ((document.form.username.value == "${user.username}")){
                alert("Bu Kullanıcı Sistemde Kayıtlıdır !\r\n" + "${user.username}" )
                return false;
            }

            </c:forEach>

            return true;
        }
    </script>
</head>
<body>
<div class="container">
    <spring:url value="/user/addUser" var="addURL" />

    <h2>Kullanıcı Ekle / Güncelle</h2>

    <form:form name="form" modelAttribute="userForm" method="post" action="${addURL}" cssClass="form" onsubmit="return kontrol();">

        <form:hidden path="id"/>

        <div class="form-group">
            <label>Username</label>
            <form:input path="username" cssClass="form-control" id="username" maxlength="20" placeholder="Kullanıcı Adı Giriniz"/>
        </div>

        <div class="form-group">
            <label>Password</label>
            <form:input path="password" cssClass="form-control" id="password" type="password" maxlength="20" placeholder="Şifre Giriniz"/>
        </div>

        <button type="submit" class="btn btn-success">Kullanıcı Ekle / Güncelle</button>
    </form:form>

</div>
</body>
</html>
