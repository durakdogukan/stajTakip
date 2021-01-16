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
    User user = (User) request.getSession().getAttribute("user");
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
                <br/>
                <br/>

                <li><a href="/student/list">Öğrenci Bilgileri</a></li>
                <li  class="active"><a href="/user/list">Kullanıcı Bilgileri</a></li>
                <li><a href="/danisman/list">Danışman Bilgileri</a></li>
                <li><a href="/sirketbilgisi/list">Şirket Bilgileri</a></li>
                <li><a href="/stajbirim/list">Staj Birim Bilgileri</a></li>
                <li><a href="/stajbilgisi/list">Staj Bilgileri</a></li>
            </ul><br>

            <spring:url value="/logout" var="addURL" />

            <form:form method="post" action="${addURL}" cssClass="form" >
                <input class="btn btn-info" type="submit" value="Çıkış Yap">
            </form:form>
        </div>
        <br>



        <div class="col-sm-10">
            <div class="well">

                <table class="table table-striped">
                    <thead class="thead-dark">
                    <th scope="row">UserName</th>
                    <th scope="row">Password</th>
                    <th scope="row">Name</th>
                    <th scope="row">Lastname</th>
                    <th scope="row">Danisman</th>
                    <th scope="row">Update</th>
                    <th scope="row">Delete</th>
                    </thead>
                    <tbody>

                    <c:forEach items="${userList}" var="user" >
                        <tr>
                            <td>${user.username}</td>
                            <td>${user.password}</td>

                            <c:if test="${user.student.firstname == null}">
                                <td>${user.danisman.ad}</td>
                                <td>${user.danisman.soyad}</td>

                                <c:if test="${user.danisman.ad != null}">
                                    <td>✓</td>
                                </c:if>

                                <c:if test="${user.danisman.ad == null}">
                                    <td></td>
                                </c:if>

                            </c:if>

                            <c:if test="${user.student.firstname != null}">
                                <td>${user.student.firstname}</td>
                                <td>${user.student.lastname}</td>
                                <td>${user.student.danisman.ad} ${user.student.danisman.soyad}</td>
                            </c:if>

                            <td>
                                <spring:url value="/user/editUser/${user.id}" var="editURL" />
                                <a class="btn btn-info" href="${editURL}" role="button" >Update</a>
                            </td>

                            <td>
                                <spring:url value="/user/deleteUser/${user.id}" var="deleteURL" />
                                <a class="btn btn-danger" href="${deleteURL}" role="button" >Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <spring:url value="/user/addUser/" var="addURL" />
                <a class="btn btn-success" href="${addURL}" role="button" >Add New User</a>




            </div>

        </div>
    </div>
</div>

</body>
</html>