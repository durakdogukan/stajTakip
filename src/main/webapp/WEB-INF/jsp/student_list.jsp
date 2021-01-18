<%@ page import="com.stajTakip.model.User" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="com.stajTakip.services.DanismanService" %>
<%@ page import="com.stajTakip.model.Danisman" %>
<%@ page import="org.springframework.web.servlet.ModelAndView" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<%

    Danisman danisman = (Danisman) request.getSession().getAttribute("danisman");
    if (danisman == null)
        response.sendRedirect("/student_login");

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Student List</title>
    <%--    <link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />--%>
    <%--    <script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>--%>
    <%--    <script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        html, body{
            height: 100%;
        }
        .container-fluid{
            height: 100%;
        }

        .row.content{
            height: 100%;
        }

        .sidenav {
            background-color: #f1f1f1;
            height: 100%;
        }


    </style>
</head>
<body>


<div class="container-fluid">
    <div class="row content">
        <div class="col-sm-2 sidenav hidden-xl">
            <h2>Staj Takip Sistemi</h2>
            <br/>
            <hr class="mt-2 mb-3" style="border: 1px solid red;"/>
            <ul class="nav nav-pills nav-stacked">
                <br/>
                <br/>
                <br/> Hoşgeldin, ${danisman.ad} ${danisman.soyad} !

                <%--    <jsp:text>${message}"</jsp:text>--%>
                <%--    ${message}--%>

                <br/>
                <br/>
                <li class="active"><a href="/student/list">Öğrenci Bilgileri</a></li>


                <li><a href="/user/list">Kullanıcı Bilgileri</a></li>
                <li><a href="/danisman/list">Danışman Bilgileri</a></li>
                <li><a href="/sirketbilgisi/list">Şirket Bilgileri</a></li>
                <li><a href="/stajbirim/list">Staj Birim Bilgileri</a></li>
                <li><a href="/stajbilgisi/list">Staj Bilgileri</a></li>
                <br/>

                <br/>
            </ul><br>

            <spring:url value="/logout" var="addURL" />

            <form:form method="post" action="${addURL}" cssClass="form" >
                <input class="btn btn-info" type="submit" value="Çıkış Yap">
            </form:form>
        </div>
        <br>



        <div class="col-sm-10">
            <div class="well">
                <spring:url value="/student/addStudent/" var="addURL" />
                <a class="btn btn-success pull-right" href="${addURL}" role="button" >Yeni Öğrenci Ekle</a>

                <c:if test="${message != null}">
                    <div class="alert alert-success" role="alert"> ${message} </div>
                </c:if>

                <table class="table table-striped">
                    <thead class="thead-dark">
                    <th scope="row">Ad</th>
                    <th scope="row">Soyad</th>
                    <th scope="row">Numara</th>
                    <th scope="row">E-mail</th>
                    <th scope="row">Telefon</th>
                    <th scope="row">Cinsiyet</th>
                    <th scope="row">Doğum Günü</th>
                    <th scope="row">Bölümü</th>
                    <th scope="row">Danışmanı</th>
                    <th scope="row">Kullanıcı Adı</th>
                    <th scope="row">Güncelle</th>
                    <th scope="row">Sil</th>
                    </thead>
                    <tbody>


                    <c:forEach items="${studentList}" var="student" >
                        <tr>
                            <td>${student.firstname}</td>
                            <td>${student.lastname}</td>
                            <td>${student.number}</td>
                            <td>${student.email}</td>
                            <td>${student.phone}</td>
                            <c:if test="${student.gender == 'E'}">
                                <td>Erkek</td>
                            </c:if>
                            <c:if test="${student.gender == 'K'}">
                                <td>Kadın</td>
                            </c:if>
                            <c:if test="${student.gender == 'D'}">
                                <td>Diğer</td>
                            </c:if>

                            <td><fmt:formatDate value="${student.birthday}" pattern="dd/MM/yyyy" /></td>
                            <td>${student.department}</td>
                            <td>${student.danisman.ad} ${student.danisman.soyad}</td>
                            <td>${student.user.username}</td>

                            <td>
                                <spring:url value="/student/editStudent/${student.id}" var="editURL" />
                                <a class="btn btn-info" href="${editURL}" role="button" >Güncelle</a>
                            </td>
                            <td>
                                <spring:url value="/student/deleteStudent/${student.id}" var="deleteURL" />
                                <a class="btn btn-danger" href="${deleteURL}" role="button" >Sil</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class=""></div>
            </div>
        </div>
    </div>
</div>

</body>
</html>