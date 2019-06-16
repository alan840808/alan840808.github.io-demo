<%@ page contentType="text/html;charset=utf-8" import="java.sql.*"%>
<%@ include file="config.jsp" %>
<%


String new_id=new String(request.getParameter("id").getBytes("ISO-8859-1"),"UTF-8");
String new_password=new String(request.getParameter("pwd").getBytes("ISO-8859-1"),"UTF-8");
String new_name=new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
String new_tel=new String(request.getParameter("tel").getBytes("ISO-8859-1"),"UTF-8");
String new_addr=new String(request.getParameter("address").getBytes("ISO-8859-1"),"UTF-8");
String new_email=new String(request.getParameter("email").getBytes("ISO-8859-1"),"UTF-8");



sql="UPDATE `member` SET `id`='"+new_id+"', `pwd`='"+new_password+"', `name`='"+new_name+"', `tel`='"+new_tel+"',  `address`='"+new_addr+"', `email`='"+new_email+"' where `member_no`='"+request.getParameter("no")+"' LIMIT 1;";

con.createStatement().execute(sql);
out.print("<h3>更新成功，三秒後會轉上一頁</a>  <meta http-equiv='refresh' content='3; url=memberdetail.jsp'>");




%>