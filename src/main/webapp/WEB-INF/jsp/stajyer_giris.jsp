<style><%@include file="style.css"%></style>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stajyer Giriş</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
    </head>
    <body> 
        <center>
            
            <h2 id="stajyerh2">Stajyer Giriş</h2>
            
            <form id="form1" action="stajyerGirisKontrol" method="post">
                <br/><i style="color:blue" class="fas fa-user fa-2x"></i> <input id="ogrNoInput" type="text" name="ogrno" placeholder="Öğrenci Numarası"><br/><br/>
                <i class="fas fa-lock fa-2x"></i> <input id="sifreInput" type="password" name="sifre" placeholder="Şifre">
            </form>
            
            <form id="form1" action="kayit" method="post">
                <br/><br/><input id="kayitOl" type="submit" value="Kayıt Ol">
            </form>            
            
            
            <form id="form1" action="stajyerGirisKontrol" method="post">
                <input id="girisYap" type="submit" value="Giriş Yap">
            </form>
            
            <br/>
            
            <form id="form1" action="yonetici_giris" method="post">
                <input id="yoneticiGirisYap" type="submit" value="Yönetici Giriş">
            </form>
            
        </center>
    </body>
</html>