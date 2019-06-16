<!DOCTYPE HTML>
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<html>
	<head>
		<title>購物車</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="subpage">
<%
		try{
			Class.forName("com.mysql.jdbc.Driver");
			try{
				 
        String url="jdbc:mysql://localhost/demo?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
				
				Connection con=DriverManager.getConnection(url,"root","1234");
%>
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
		<%
				if(session.getAttribute("id") != null ){
				con.createStatement().execute("use demo");
    				String sql = "SELECT * FROM member WHERE id='" +session.getAttribute("id")+"';"; 
				Statement stmt=con.createStatement();
				ResultSet rs =con.createStatement().executeQuery(sql);
				String no=" ";
				String id=" ";
				String pwd=" ";
				String name=" ";
				String tel=" ";
				String address=" ";
				String email=" ";
				//讀出id, pwd當成使用者要更改時的內定值
				if(rs.next()){
				no=rs.getString("member_no");
				id=rs.getString("id");
				pwd=rs.getString("pwd");
				name=rs.getString("name");
				tel=rs.getString("tel");
				address=rs.getString("address");
				email=rs.getString("email");
				
				}
%>
			<section id="One" class="wrapper style3">
				<div class="inner">
					<header class="align-center">
						<p>welcom</p>
						<h2><%=name%></h2>
					</header>
				</div>
			</section>

		<!-- Two -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<p>購物車</p>
							</header>
							<div class="log">
								<table border="1">
								<tr><td>書名</td><td>數量</td><td>價錢</td></tr>
								<tr><td>歌劇魅影</td><td>1</td><td>350元</td></tr>
								<tr><td>總價錢</td><td></td><td>350元</td></tr>
								</table>
								<a href="end.jsp"><button>結帳</button></a>
								<%
}else{
%>
			<section id="One" class="wrapper style3">
				<div class="inner">
					<header class="align-center">
						<p>welcom</p>
						<h2>XX二手書</h2>
					</header>
				</div>
			</section>

		<!-- Two -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<p>購物車</p>
							</header>
<p class="log">您還未登入會員 三秒後為您轉至會員登入</p>
<meta http-equiv="refresh" content="3; url=login.jsp">
<%
}
			con.close();
	}
	catch(SQLException sExec){
		out.println("SQL錯誤"+sExec.toString());
	}
	}
	catch(ClassNotFoundException err){
		out.println("class錯誤"+err.toString());
	}	

%>
							</div>
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