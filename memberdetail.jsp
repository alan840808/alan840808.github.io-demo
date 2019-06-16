<!DOCTYPE HTML>
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<html>
	<head>
		<title>會員資料</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<script>
		function Check(){
			if(addmember.id.value == ""){
				window.alert("請輸入帳號!");
				addmember.id.focus();
				return false;
			}

			if(addmember.pwd.value == ""){
				window.alert("請輸入密碼!");
				addmember.pwd.focus();
				return false; 
			}

			if(addmember.tel.value == ""){
				window.alert("請輸入手機號碼!");
				addmember.tel.focus();
				return false;
			}

			if (addmember.tel.value.length !==10){
				window.alert("手機號碼需為10碼!");
				addmember.tel.focus() ;
				return false ;
			}

			if(addmember.email.value == ""){
				window.alert("請輸入Email!");
				addmember.email.focus();
				return false;
			}
  
			if(addmember.email.value.indexOf("@") < 1){
				window.alert("輸入的Email格式不正確!");
				addmember.email.focus();
				return false;
			}	
			else{
				window.alert("註冊成功，點擊確定後跳轉至會員登入");
			}

		}
		</script>
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
								<p>會員資料編輯</p>
							</header>
							<form name="update" action="updatemember.jsp" method="POST" onSubmit="return Check(this)" class="log">		
								<input type='hidden' name='no' value="<%=no%>" />
								帳號 ( 必填 ) <input type="text" name="id" value="<%=id%>"><br>
								密碼 ( 必填 ) <input type="password" name="pwd" value="<%=pwd%>"><br>
								名字 <input type="text" name="name" value="<%=name%>"><br>
								手機 ( 必填 ) <input type="text" name="tel" value="<%=tel%>"><br>
								地址 <input type="text" name="address" value="<%=address%>"><br>
								E-mail ( 必填 ) <input type="text" name="email" value="<%=email%>"><br>
								<input type="submit" value="送出" >&nbsp;<input type="reset" value="清除" >
								<hr>
								<a href="member1.jsp">←購物紀錄</a>&nbsp;<a href="member2.jsp">商品評論紀錄→</a>
							</form>
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
								<p>會員資料編輯</p>
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