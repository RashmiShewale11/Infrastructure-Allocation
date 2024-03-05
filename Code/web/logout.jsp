<%--
  Created by IntelliJ IDEA.
  User: shubham
  Date: 12/9/18
  Time: 2:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Logout</title>
</head>
<body>
<%
    String user_name;
    user_name= String.valueOf(session.getAttribute("user_name"));
    if(user_name!=null) {
        session.invalidate();
        response.sendRedirect("index.jsp");
    }
%>
</body>
</html>
