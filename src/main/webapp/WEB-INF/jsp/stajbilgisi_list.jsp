<%@ page import="com.stajTakip.model.User" %>
<%@ page import="com.stajTakip.model.Danisman" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
    <title>Staj Bilgileri</title>
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

        /* Popup container - can be anything you want */
        .popup {
            position: relative;
            display: inline-block;
            cursor: pointer;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        /* The actual popup */
        .popup .popuptext {
            visibility: hidden;
            width: 160px;
            background-color: #555;
            color: #fff;
            text-align: center;
            border-radius: 6px;
            padding: 8px 0;
            position: absolute;
            z-index: 1;
            bottom: 125%;
            left: 50%;
            margin-left: -80px;
        }

        /* Popup arrow */
        .popup .popuptext::after {
            content: "";
            position: absolute;
            top: 100%;
            left: 50%;
            margin-left: -5px;
            border-width: 5px;
            border-style: solid;
            border-color: #555 transparent transparent transparent;
        }

        /* Toggle this class - hide and show the popup */
        .popup .show {
            visibility: visible;
            -webkit-animation: fadeIn 1s;
            animation: fadeIn 1s;
        }

        /* Add animation (fade in the popup) */
        @-webkit-keyframes fadeIn {
            from {opacity: 0;}
            to {opacity: 1;}
        }

        @keyframes fadeIn {
            from {opacity: 0;}
            to {opacity:1 ;}
        }
    </style>
    <script>
        // When the user clicks on div, open the popup
        function myFunction() {
            var popup = document.getElementById("myPopup");
            popup.classList.toggle("show");
        }
    </script>
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
                <li><a href="/user/list">Kullanıcı Bilgileri</a></li>
                <li><a href="/danisman/list">Danışman Bilgileri</a></li>
                <li><a href="/sirketbilgisi/list">Şirket Bilgileri</a></li>
                <li><a href="/stajbirim/list">Staj Birim Bilgileri</a></li>
                <li  class="active"><a href="/stajbilgisi/list">Staj Bilgileri</a></li>
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
                    <th scope="row">Öğrenci Ad Soyad</th>
                    <th scope="row">Öğrenci Numara</th>
                    <th scope="row">Şirket Adı</th>
                    <th scope="row">Staj Birimi</th>
                    <th scope="row">Staja Başlama Tarihi</th>
                    <th scope="row">Staj Bitiş Tarihi</th>
                    <th scope="row">Staj Puanı</th>
                    <th scope="row">Yorum</th>
                    <th scope="row">Güncelle</th>
                    <th scope="row">Sil</th>
                    </thead>
                    <tbody>
                    <c:forEach items="${stajbilgisiList}" var="stajbilgisi" >
                        <tr>
                            <td>${stajbilgisi.student.firstname} ${stajbilgisi.student.lastname}</td>
                            <td>${stajbilgisi.student.number}</td>
                            <td>${stajbilgisi.stajbirim.sirketbilgisi.ad}</td>
                            <td>${stajbilgisi.stajbirim.ad}</td>
                            <td><fmt:formatDate value="${stajbilgisi.baslamatarihi}" pattern="dd/MM/yyyy" /></td>
                            <td><fmt:formatDate value="${stajbilgisi.bitistraihi}" pattern="dd/MM/yyyy" /></td>
                            <c:if test="${stajbilgisi.stajpuani != 0}">
                                <td>${stajbilgisi.stajpuani}</td>
                            </c:if>
                            <c:if test="${stajbilgisi.stajpuani == 0}">
                                <td></td>
                            </c:if>
                            <td width="10%" style="word-break: break-all; ">
                                <div id="accordion">
                                    <div class="card">
                                        <div class="card-header" id="headingThree">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                    Yorumu Okumak İçin Tıkla
                                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                                            <div class="card-body">
                                                ${stajbilgisi.yorum}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <spring:url value="/stajbilgisi/editStajbilgisi/${stajbilgisi.id}" var="editURL" />
                                <a class="btn btn-info" href="${editURL}" role="button" >Güncelle</a>
                            </td>
                            <td>
                                <spring:url value="/stajbilgisi/deleteStajbilgisi/${stajbilgisi.id}" var="deleteURL" />
                                <a class="btn btn-danger" href="${deleteURL}" role="button" >Sil</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <spring:url value="/stajbilgisi/addStajbilgisi/" var="addURL" />
                <a class="btn btn-success" href="${addURL}" role="button" >Yeni Staj Bilgisi Ekle</a>

            </div>

        </div>
    </div>
</div>

</body>
</html>

