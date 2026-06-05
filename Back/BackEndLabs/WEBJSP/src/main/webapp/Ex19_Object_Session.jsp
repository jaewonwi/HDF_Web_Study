<%@page import="kr.or.kosa.Emp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Emp emp = (Emp)session.getAttribute("empobj");
%>
emp 정보 출력: <%=emp.toString() %>
</body>
</html>