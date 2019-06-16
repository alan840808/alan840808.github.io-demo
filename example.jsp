<!DOCTYPE HTML>
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<html>
	<head>
		<title>範例</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="subpage">

		<!-- Header -->
			<header id="header">
				<div class="logo"><a href="index.jsp">XX二手書 <span>by  第33組</span></a></div>
				<a href="#menu">MENU</a>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="index.jsp">主頁</a></li>
					<li><a href="traditional.jsp">繁體書</a></li>
					<li><a href="simple.jsp">簡體書</a></li>
					<li><a href="original.jsp">原文書</a></li>
					<li><a href="shopping-cart.jsp">購物車</a></li>
					<li><a href="memberdetail.jsp">會員資料</a></li>
					<%
					if( session.getAttribute("id") != null ){
						String id = session.getAttribute("id").toString();
						if( id.equals ("111")){
							out.println("<li><a href='user/member.jsp'>Hi，歡迎管理員! 前往管理區</a></li>");
							out.println("<li><a href='logout.jsp'>登出</a></li>");
						}
						else{
							out.print("<li><a href='logout.jsp'>登出</a></li>");
						}
					}else{
					%>
					<li><a href="login.jsp">登入</a></li>
					<%}%>
					<br><br><br>
					<li><a href="user/view.jsp">討論區-網程留言板</a></li>
				</ul>
			</nav>

		<!-- One -->
			<section id="One" class="wrapper style3">
				<div class="inner">
					<header class="align-center">
						<p>example</p>
						<h2>example</h2>
					</header>
				</div>
			</section>

		<!-- Two -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<p>example</p>
								<h2>example</h2>
							</header>
							<!--put what you want in here-->
						</div>
					</div>
				</div>
			</section>

		<!-- Footer -->
			<footer id="footer">
				<div class="container">
					<ul class="icons">
						<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="icon fa-envelope-o"><span class="label">Email</span></a></li>
					</ul>
				</div>
				<div class="copyright">
					&copy; Untitled. All rights reserved.
				</div>
			</footer>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>