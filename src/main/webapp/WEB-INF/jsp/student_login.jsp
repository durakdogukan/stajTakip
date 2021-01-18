<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Student List</title>
    <link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <style><%@include file="style.css"%></style>
    <script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<div class="container login-container">
    <div class="row">
        <div class="col-md-6 login-form-1">
            <h3>Öğrenci Giriş</h3>
            <spring:url value="/student_login" var="addURL" />

            <form:form modelAttribute="user" method="post" action="${addURL}" cssClass="form" >
                <div class="form-group">
                    <input type="text"     name="username" class="form-control" placeholder="Kullanıcı Adınızı Giriniz" value="" />
                </div>
                <div class="form-group">
                    <input type="password" name="password" class="form-control" placeholder="Şifrenizi Giriniz" value="" />
                </div>
                <div class="form-group">
                    <input type="submit" class="btnSubmit" value="Login" />
                </div>
            </form:form>
        </div>


        <div class="col-md-6 login-form-2">
            <h3>Yönetici Giriş</h3>

            <spring:url value="/yonetici_login" var="addURL" />
            <form:form modelAttribute="user" method="post" action="${addURL}" cssClass="form" >
                <div class="form-group">
                    <input type="text"     name="username" class="form-control" placeholder="Kullanıcı Adınızı Giriniz" value="" />
                </div>
                <div class="form-group">
                    <input type="password" name="password"  class="form-control" placeholder="Şifrenizi Giriniz" value="" />
                </div>
                <div class="form-group">
                    <input type="submit" class="btnSubmit" value="Login" />
                </div>
            </form:form>
        </div>
    </div>
</div>


</body>
</html>