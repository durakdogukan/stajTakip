<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="com.stajTakip.services.DanismanService" %>
<%@ page import="org.springframework.web.servlet.ModelAndView" %>
<%@ page import="com.stajTakip.model.User" %>
<%@ page import="com.stajTakip.model.Student" %>
<%@ page import="com.stajTakip.model.Stajbirim" %>
<%@ page import="com.stajTakip.model.Sirketbilgisi" %>
<%@ page import="com.stajTakip.model.Stajbilgisi" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<%
    User user = (User) request.getSession().getAttribute("user");
    if (user==null)
        response.sendRedirect("/student_login");

    Student student = (Student) request.getSession().getAttribute("student");
    Sirketbilgisi sirketbilgisi = (Sirketbilgisi) request.getSession().getAttribute("sirketbilgisi");
    Stajbirim stajbirim = (Stajbirim) request.getSession().getAttribute("stajbirim");
    Stajbilgisi stajbilgisi = (Stajbilgisi) request.getSession().getAttribute("stajbilgisi");

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Öğrenci Bilgileri</title>
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


        hr.style18 {
            height: 30px;
            border-style: solid;
            border-color: #8c8b8b;
            border-width: 1px 0 0 0;
            border-radius: 20px;
        }
        hr.style18:before {
            display: block;
            content: "";
            height: 30px;
            margin-top: -31px;
            border-style: solid;
            border-color: #8c8b8b;
            border-width: 0 0 1px 0;
            border-radius: 20px;
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
                <li class="active" style="text-align: center"><a href="">Öğrenci Bilgileri</a></li>
                <br/>
                <br/> Hoşgeldin, ${student.firstname} ${student.lastname} !
                <br/>
            </ul>

            <br>
            <spring:url value="/logout" var="addURL" />

            <form:form method="post" action="${addURL}" cssClass="form" >

                <input class="btn btn-info" type="submit" value="Çıkış Yap">

            </form:form>
        </div>
        <br>

        <div class="col-sm-10">
            <div class="well">
                <br/>

                <h3 style="text-align: center">Öğrenci Bilgileri</h3> <br/>
                <hr class="style18">

                    <table class="table table-striped">
                        <thead class="thead-dark">
                        <th scope="row">Ad</th>
                        <th scope="row">Soyad</th>
                        <th scope="row">Numara</th>
                        <th scope="row">E-mail</th>
                        <th scope="row">Telefon</th>
                        <th scope="row">Cinsiyet</th>
                        <th scope="row">Doğum Tarihi</th>
                        <th scope="row">Departman</th>
                        <th scope="row">Danışman</th>
                        <th scope="row">Kullanıcı Adı</th>
                        </thead>
                        <tbody>

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
                            </tr>
                        </tbody>
                    </table>

                    <br/>

                    <h3 style="text-align: center">Şirket Bilgileri</h3> <br/>
                    <hr class="style18">

                <table class="table table-striped">
                    <thead class="thead-dark">
                        <th scope="row">Şirket Adı</th>
                        <th scope="row">Adres</th>
                        <th scope="row">Şehir</th>
                        <th scope="row">Web Site</th>
                    </thead>

                    <tbody>
                    <tr>
                        <td>
                            ${sirketbilgisi.ad}
                        </td>
                        <td>
                            ${sirketbilgisi.sehir}
                        </td>
                         <td>
                            ${sirketbilgisi.adres}
                         </td>
                         <td>
                            ${sirketbilgisi.website}
                         </td>
                    </tr>
                    </tbody>

                </table>

                <br/>

                <h3 style="text-align: center">Staj Birim Bilgileri</h3> <br/>
                <hr class="style18">

                <table class="table table-striped">
                    <thead class="thead-dark">
                    <th scope="row">Şirket Adı</th>
                    <th scope="row">Staj Birimi</th>
                    <th scope="row">Kontakt Adı Soyadı</th>
                    <th scope="row">Ünvan</th>
                    <th scope="row">Telefon</th>
                    <th scope="row">E-Mail</th>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                ${stajbirim.sirketbilgisi.ad}
                            </td>
                            <td>
                                ${stajbirim.ad}
                            </td>
                            <td>
                                ${stajbirim.kontaktad} ${stajbirim.kontaktsoyad}
                            </td>
                            <td>
                                ${stajbirim.kontaktunvan}
                            </td>
                            <td>
                                ${stajbirim.kontakttel}
                            </td>
                            <td>
                                ${stajbirim.kontaktemail}
                            </td>
                        </tr>
                    </tbody>
                </table>

                <br/>

                <h3 style="text-align: center">Staj Bilgisi</h3> <br/>
                <hr class="style18">

                <table class="table table-striped">
                    <thead class="thead-dark">
                    <th scope="row">Öğrenci Ad Soyad</th>
                    <th scope="row">Öğrenci Numara</th>
                    <th scope="row">Şirket Adı</th>
                    <th scope="row">Staj Birimi</th>
                    <th scope="row">Staja Başlama Tarihi</th>
                    <th scope="row">Staj Bitiş Tarihi</th>
                    <th scope="row">Staj Puanı</th>
                    <th scope="row">Yorum</th>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                ${stajbilgisi.student.firstname} ${stajbilgisi.student.lastname}
                            </td>
                            <td>
                                ${stajbilgisi.student.number}
                            </td>
                            <td>
                                ${stajbilgisi.stajbirim.sirketbilgisi.ad}
                            </td>
                            <td>
                                ${stajbilgisi.stajbirim.ad}
                            </td>
                            <td>
                                <fmt:formatDate value="${stajbilgisi.baslamatarihi}" pattern="dd/MM/yyyy" />
                            </td>
                            <td>
                                <fmt:formatDate value="${stajbilgisi.bitistraihi}" pattern="dd/MM/yyyy" />
                            </td>
                            <c:if test="${stajbilgisi.stajpuani != 0}">
                                <td>
                                        ${stajbilgisi.stajpuani}
                                </td>
                            </c:if>
                            <c:if test="${stajbilgisi.stajpuani == 0}">
                                <td>

                                </td>
                            </c:if>
                            <td width="10%">
                                ${stajbilgisi.yorum}
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>