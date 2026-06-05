<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h3>jsp 파일은 Servlet forward 한 자원을 (request)사용</h3>
		결과 출력 : <%= request.getAttribute("result") %>
		<hr>
		EL ${requestScope.result}<br>
</body>
</html>