<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String user = (String)session.getAttribute("user");
	String fav = request.getParameter("fav");
	String age = request.getParameter("age");
	String us = null;
	int flag=0,count=0,id=0;
	Connection conn = null;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/cancer","root","");
		String sql = "select *from registration";
		Statement stmt=conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next())
		{

			 us = rs.getString("mno");
			 if(user.equals(us))
			 {
			 	id = rs.getInt("ID");
				flag=1;
				break;
			 }
		}
		if(flag!=1)
		{
			request.setAttribute("Error","Try Again");
			%>
			<jsp:forward page="profile.jsp"></jsp:forward>
			<%
		}
		else
			{
				sql = "insert into form(favfood,age,user_id) values('"+fav+"','"+age+"','"+id+"')";
		
			int action = conn.createStatement().executeUpdate(sql);
			conn.setAutoCommit(true);
			if(action>=1)
			{
				%>
			<jsp:forward page="check.jsp"></jsp:forward>
			<%
			
			}
			else
			{	
			request.setAttribute("Error3","Cannot save data");
			%>
			<jsp:forward page="profile.jsp"></jsp:forward>
			<%
			}
			}
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>
</body>
</html>