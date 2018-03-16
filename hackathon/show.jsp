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
	String us = null;
	int flag=0,count=0,id=0,us1=0;
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
			 if(us.equals(user))
			 {
			 	id = rs.getInt("ID");
				flag=1;
				break;
			 }
		}
		if(flag!=1)
		{
			request.setAttribute("Error2","Try Again");
			%>
			<jsp:forward page="profile.jsp"></jsp:forward>
			<%
		}
		else
			{
				flag=0;
				sql = "select favfood,age from form where user_id='"+id+"'";
		stmt=conn.createStatement();
		rs = stmt.executeQuery(sql);
		while(rs.next())
		{
				fav=rs.getString("favfood");
				age=rs.getString("age");
			
		}
		if(flag!=1)
		{
			request.setAttribute("Error2","Try Again");
			%>
			<jsp:forward page="profile.jsp"></jsp:forward>
			<%
		}
		else
		{
			
			%>
			<jsp:forward page="form.jsp"></jsp:forward>
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