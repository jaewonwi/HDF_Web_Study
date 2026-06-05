<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("txtuserid");
    String pwd = request.getParameter("txtpwd");		// name으로 찾아서 가져온다
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    서버 확인 완료<br>

    당신이 입력한 ID : <%= id %><br>
    당신이 입력한 PWD: <%= pwd %><br>

</body>
</html>