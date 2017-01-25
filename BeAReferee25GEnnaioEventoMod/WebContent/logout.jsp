<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
Cookie[] cookies = request.getCookies();
if (cookies != null) {   
	for(int i=0; i<cookies.length; i++) {  
		Cookie c = cookies[i];  
		if (c.getName().equals("userinfo")) { 
			c.setMaxAge(0);
			response.addCookie(c);
			break;   
			}
		else if (c.getName().equals("admininfo")) { 
			c.setMaxAge(0);
			response.addCookie(c);
			break;   
			}
		} 
}
session.setAttribute("userid", null);
session.setAttribute("arbitro",null);
session.setAttribute("partita",null);
session.invalidate();
response.sendRedirect("index.jsp");

%>
</body>
</html>