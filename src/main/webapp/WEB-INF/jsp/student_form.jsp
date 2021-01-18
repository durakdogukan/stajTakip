<%@ page import="com.stajTakip.model.User" %>
<%@ page import="com.stajTakip.model.Danisman" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--<%--%>
<%-- User user = (User) request.getSession().getAttribute("user");--%>
<%-- if (user==null)--%>
<%--  response.sendRedirect("/student_login");--%>
<%--%>--%>

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
 <title>Öğrenci Ekle / Güncelle</title>
 <link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
 <script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
 <script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
 <script>
  function kontrol(){
   if (document.form.firstname.value == ""){
    alert ( "Öğrenci Adını Giriniz" );
    return false;
   }
   if (document.form.lastname.value == ""){
    alert ( "Öğrenci Soyadı Giriniz" );
    return false;
   }
   if (document.form.number.value == ""){
    alert ( "Öğrenci Numarası Giriniz" );
    return false;
   }
   if (document.form.email.value == ""){
    alert ( "Öğrenci Email Giriniz" );
    return false;
   }
   if (document.form.phone.value == ""){
    alert ( "Öğrenci Telefon Numarasını Giriniz" );
    return false;
   }
   if (document.form.birthday.value == ""){
    alert ( "Öğrenci Doğum Tarihi Giriniz" );
    return false;
   }
   if (document.form.department.value == ""){
    alert ( "Öğrenci Bölümü Giriniz" );
    return false;
   }
   if (document.form.danisman.value == ""){
    alert ( "Öğrenci Danışman Giriniz" );
    return false;
   }
   if (document.form.danisman.value == ""){
    alert ( "Öğrenci User Giriniz" );
    return false;
   }
   return true;
  }
 </script>
</head>
<body>
 <div class="container">
  <spring:url value="/student/addStudent" var="addURL" />

  <h2>Öğrenci Ekle / Güncelle</h2>
  <form:form name="form" modelAttribute="studentForm" method="post" action="${addURL}" cssClass="form" onsubmit="return kontrol();">

   <form:hidden path="id"/>

   <div class="form-group">
    <label>Öğrencinin Adı</label>
    <form:input path="firstname" cssClass="form-control" id="firstname" maxlength="20"/>
   </div>

   <div class="form-group">
    <label>Öğrencinin Soyadı</label>
    <form:input path="lastname" cssClass="form-control" id="lastname" maxlength="30"/>
   </div>

   <div class="form-group">
    <label>Öğrencinin Numarası</label>
    <form:input path="number" type="number" cssClass="form-control" id="number" maxlength="15"/>
   </div>

   <div class="form-group">
    <label>Öğrencinin E-mail Adresi</label>
    <form:input path="email" cssClass="form-control" id="email" maxlength="45"/>
   </div>

   <div class="form-group">
    <label>Öğrencinin Telefonu</label>
    <form:input path="phone" type="number" cssClass="form-control" id="phone" maxlength="11"/>
   </div>

   <div class="form-group">

    <label>Öğrencinin Cinsiyeti</label>
     <form:select path = "gender" id = "gender" cssClass="form-control">

        <form:option disabled="true" value = "" label = "Cinsiyet Seçiniz" />
        <form:option value = "E" label = "Erkek" />
        <form:option value = "K" label = "Kadın" />
        <form:option value = "D" label = "Diğer" />

     </form:select>

   </div>

   <div class="form-group">
    <label>Öğrencinin Doğum Tarihi</label>
    <form:input path="birthday" type="date" cssClass="form-control"  id="birthday" name="trip-start"/>
   </div>

   <div class="form-group">
    <label>Öğrencinin Bölümü</label>
    <form:input path="department" cssClass="form-control" id="department" maxlength="45"/>
   </div>


   <div class="form-group">
    <label>Öğrencinin Danışmanı</label>

    <form:select path = "danisman" id = "danisman" cssClass="form-control">

       <form:option disabled="true" value = "" label = "Danisman Seçiniz" />
       <form:options items = "${danismanList}" itemLabel="fullname"/>

    </form:select>
   </div>


    <div class="form-group">
    <label>Öğrencinin Kullanıcı Adı</label>

    <form:select path = "user" id = "user" cssClass="form-control">

       <form:option disabled="true" value = "" label = "Kullanıcı Seçiniz" />
       <form:options items = "${userList}" itemLabel="username"/>

    </form:select>
   </div>


   <button type="submit" class="btn btn-success">Öğrenci Ekle / Güncelle</button>
  </form:form>
  
 </div>
</body>
</html>
