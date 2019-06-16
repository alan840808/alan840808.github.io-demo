<!DOCTYPE HTML>
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<html>
	<head>
		<title>XX二手書 by  第33組</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body>

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

		<!-- Banner -->
			<section class="banner full">
				<article>
					<img src="images/1.png" alt="" />
				</article>
				<article>
					<img src="images/2.png" alt="" />
				</article>
				<article>
					<img src="images/3.png" alt="" />
				</article>
				<article>
					<img src="images/4.png" alt="" />
				</article>
				<article>
					<img src="images/5.png" alt="" />
				</article>
			</section>

		<!-- One -->
			<section id="one" class="wrapper style2">
				<header class="align-center">
						<p class="special">HOT</p>
						<h2>熱銷書籍</h2>
					</header>
				<div class="inner">
					<div class="grid-style">			
					<%
try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線	
        String url="jdbc:mysql://localhost/demo?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫  
           sql="use demo";
           con.createStatement().execute(sql);
//Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet	
           sql="select * from product"; 
           ResultSet rs=con.createStatement().executeQuery(sql);

           
//Step 5: 顯示結果 
           
           sql="SELECT * from product order by productamount  limit 2";
           
               rs=con.createStatement().executeQuery(sql);
		   while(rs.next())
                {
					out.println("<div><div class='box'><div class='image fit '><img src='user/imgs/"+rs.getString(2)+".png'  /></div><div class='content'><header class='align-center'><h2>"+rs.getString(4)+"</h2></header><hr><p align='center'>"+rs.getString(5)+"</p><footer class='align-center'><a href='product.jsp?bid="+rs.getString(1)+"' class='button alt'>See More</a></footer></div></div></div>");


          }

          
          
//Step 6: 關閉連線
          con.close();
      }
     
      
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
      out.println("class錯誤"+err.toString());
}
%>	

					</div>
				</div>
			</section>

		<!-- Two -->
			<section id="one" class="wrapper style2">
				<header class="align-center">
						<p class="special">NEW</p>
						<h2>新書上市</h2>
					</header>
				<div class="inner">
					<div class="grid-style">			
					<%
try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線	
        String url="jdbc:mysql://localhost/demo?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫  
           sql="use demo";
           con.createStatement().execute(sql);
//Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet	
           sql="select * from product"; 
           ResultSet rs=con.createStatement().executeQuery(sql);

           
//Step 5: 顯示結果 
           
           sql="SELECT * from product order by product_ID DESC  limit 2";
           
               rs=con.createStatement().executeQuery(sql);
		   while(rs.next())
                {
					out.println("<div><div class='box'><div class='image fit '><img src='user/imgs/"+rs.getString(2)+".png'  /></div><div class='content'><header class='align-center'><h2>"+rs.getString(4)+"</h2></header><hr><p align='center'>"+rs.getString(5)+"</p><footer class='align-center'><a href='product.jsp?bid="+rs.getString(1)+"' class='button alt'>See More</a></footer></div></div></div>");


          }

          
          
//Step 6: 關閉連線
          con.close();
      }
     
      
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
      out.println("class錯誤"+err.toString());
}
%>	

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
					&copy; . All rights reserved.
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