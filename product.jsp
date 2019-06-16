
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>

<%		
String bid=request.getParameter("bid");
String pic=" ";
String amount=" ";
String name=" ";
String note=" ";
String size=" ";
String price=" ";


if(!bid.equals("")){	
con.createStatement().execute("use demo");
sql="select * from product where product_id='"+bid+"'";
ResultSet rs=con.createStatement().executeQuery(sql);



				if(rs.next()){
				pic=rs.getString("productpic");
				amount=rs.getString("productamount");
				name=rs.getString("productname");
				note=rs.getString("productnote");
				size=rs.getString("productsize");
				price=rs.getString("productprice");
				}
}
%>	
<html>
	<head>
		<title><%=name%></title>
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
						<p><%=size%> </p>
						<h2><%=name%> </h2>
					</header>
				</div>
			</section>

		<!-- Two -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<div class="image fit fix">
								<img src="user/imgs/<%=pic%>.png" alt="" />
							</div>
							<p align="center"> <%=note%> </p>
						</div>
						<form action="" method="POST" align="center">
							庫存：<b><%=amount%> </b>&nbsp;本<br><br>
							數量：<select name="" size="1" style="font-size: 20px; width: 45px; display: inline;">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</select>(每次限購5本)<br><br>
							定價：<b><%=price%> </b> 元<br><br>
						　　　<a href="#"><input type="submit" value="立即選購"></a>
						</form>
						<hr>
					<%
						if( session.getAttribute("id") != null ){
							con.createStatement().execute("use demo");
							String sql2 = "SELECT * FROM member WHERE id='" +session.getAttribute("id")+"';"; 
							Statement stmt=con.createStatement();
							ResultSet rs2 =con.createStatement().executeQuery(sql2);
							String idd=" ";
							String mno=" ";
								if(rs2.next()){
								mno=rs2.getString("member_no");
								idd=rs2.getString("id");				
								}
				%>
						<form action="addscore.jsp" method="POST" align="center">
							<input type='hidden' name='pid' value="<%=bid%>" />
							<input type='hidden' name='mno' value="<%=mno%>" />
							<input type='hidden' name='id' value="<%=idd%>" />
     						<textarea name="content" rows="3" placeholder="商品評論..."></textarea><br>
     						商品滿意度：<select name="star" size="1" style="font-size: 15px; width: 110px; display: inline;">
								<option value="非常滿意">非常滿意</option>
								<option value="滿意">滿意</option>
								<option value="普通">普通</option>
								<option value="不滿意">不滿意</option>
								<option value="非常不滿意">非常不滿意</option>
							</select><br><br>
       						<input type="submit" class="btn btn-primary" value="提交">&nbsp;
							<input type="reset" class="btn btn-primary" value="清空"><br>
						</form>
					<%}else{%>
						<p align="center">如要進行商品評論，請先<a href="login.jsp">登入會員</a></p><br>
					<%}%>
					<%
					sql="select * from score where p_id='"+bid+"' order by no desc"; //遞減排序, 此時是否遞減無所謂, 最主要是要算出共幾筆留言
					ResultSet rs=con.createStatement().executeQuery(sql);

					//先移到檔尾, getRow()後, 就可知道共有幾筆記錄
					rs.last();
					int total_content=rs.getRow();
					out.println("<hr><center>目前共有 "+total_content+" 筆評論");
           
					//每頁顯示5筆, 算出共幾頁            
					int page_num=(int)Math.ceil((double)total_content/5.0);
         
					//讀取page變數
					//首次執行時, page不存在, 不可將以下4行寫成Integer current_page=Integer.valueOf(request.getParameter("page"));
					String page_string = request.getParameter("page");
					if (page_string == null) 
					page_string = "0";          
					Integer current_page=Integer.valueOf(page_string);
					//Integer current_page=Integer.valueOf(request.getParameter("page"));
					if(current_page==0)  //表page不存在, 故page_string=="0"
					current_page=1;
					if(current_page>page_num)//若輸入大於總頁數, 則到最後一頁
					current_page=page_num;
	          
					

					out.println("<br>共 "+page_num+" 頁   目前在第 "+current_page+" 頁<p>");
					
           
           
					//計算開始記錄位置 
					//Step 5: 顯示結果 
					int start_record=(current_page-1)*5;
					//遞減排序, 讓最新的資料排在最前面
					sql="select * from score where p_id='"+bid+"' order by no desc limit ";
					sql+=start_record+",5";
					if (start_record>=0)
					rs=con.createStatement().executeQuery(sql);
					out.println("<table border=2 width=60% >");
					while(rs.next())
					{
					out.println("<tr><td><font size=4><b>ID："+rs.getString(4)+"<br>");
					out.println("<tr><td>"+"<font size=4><b>滿意度："+rs.getString(5)+"<br>");
					out.println("<tr><td><font size=4><b>評論："+rs.getString(6)+"<br>");
					out.println("<tr><td><font size=4><b>留言時間："+rs.getString(7)+"<br>");
					}
				out.println("</table>"+"<br>");
				if(current_page!=1)
				{
				out.println("<a href=product.jsp?page=1>第一頁</a>");
				}

				if(current_page>1)
				{
				int p=current_page-1;
				out.println("<a href=product.jsp?page="+p+">上一頁</a>");
				}
				if(current_page<page_num)
				{
				int p=current_page+1;
				out.println("<a href=product.jsp?page="+p+">下一頁</a>");
				}
				if(current_page<page_num)
				{
				out.println("<a href=product.jsp?page="+page_num+">最後一頁</a>");
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