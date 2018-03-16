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
	String fname = request.getParameter("fnam");
	String lname = request.getParameter("lnam");
	String email = request.getParameter("email");
	String pas = request.getParameter("pwd");
	String  mn = request.getParameter("mno");
	String mnw=null;
	int flag=0,count=-1;
	Connection conn = null;
	session.setAttribute("his",count);
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/cancer","root","");
		String sql = "select *from registration";
		Statement stmt=conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next())
		{

			 mnw = rs.getString("mno");
			 
			 if(mn.equals(mnw))
			 {
			
					flag=1;
					break;
			 }
		}
		if(flag==1)
		{
			request.setAttribute("Error2","Mobile No already exists");
			%>
			<jsp:forward page="home.jsp"></jsp:forward>
			<%
		}
		else
			{
		
		 sql = "insert into registration(fname,lname,email,pass,mno) values('"+fname+"','"+lname+"','"+email+"','"+pas+"','"+mn+"')";
		
			int action = conn.createStatement().executeUpdate(sql);
			conn.setAutoCommit(true);
			if(action>=1)
			{
				session.setAttribute("msg",fname);
				session.setAttribute("msg1",lname);
				session.setAttribute("user",mn);
				%>
			<jsp:forward page="profile.jsp"></jsp:forward>
			<%
			
			}
			else
			{	
			request.setAttribute("Error3","Cannot save data");
			%>
			<jsp:forward page="home.jsp"></jsp:forward>
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