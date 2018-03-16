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
	String em = request.getParameter("emaillog");
	request.setAttribute("user",em);
	String pas = request.getParameter("passlog");
	String lpass=null;
	String ema=null;
	String lname=null,fname=null,mn=null;
	int flag=0,count=-1,var=0;
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

			 ema = rs.getString("email");
			 lpass = rs.getString("pass");
			 if(ema.equals(ema)&&pas.equals(lpass))
			 {
			 	mn=rs.getString("mno");
			 	lname = rs.getString("lname");
			 	fname = rs.getString("fname");
					flag=1;
			 }
		}
		if(flag!=1)
		{
			request.setAttribute("Error","Enter Correct Detail");
			%>
			<jsp:forward page="home.jsp"></jsp:forward>
			<%
		}
		else
			{
				session.setAttribute("msg",fname);
				session.setAttribute("msg1",lname);
				session.setAttribute("user",mn);
				session.setAttribute("his",count);
			%>
			<jsp:forward page="profile.jsp"></jsp:forward>
			<%
			}
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>
</body>
</html>