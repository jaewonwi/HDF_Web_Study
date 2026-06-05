<%@page import="dto.EmpDto"%>
<%@page import="dao.EmpDao"%>
<%@page import="java.util.List"%>
<%@page import="dao.EmpDao"%>
<%@page import="dto.EmpDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    EmpDao dao = new EmpDao();
    List<EmpDto> empList = dao.getEmpList();

    request.setAttribute("empList", empList);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EMP LIST</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">
</head>

<body>

<div class="container mt-5">

    <h2 class="mb-4">사원 목록</h2>

    <table class="table table-striped table-hover table-bordered">

        <thead class="table-dark">
            <tr>
                <th>사번</th>
                <th>이름</th>
                <th>직무</th>
                <th>급여</th>
                <th>부서번호</th>
            </tr>
        </thead>

        <tbody>

            <c:forEach var="emp" items="${empList}">
                <tr>
                    <td>${emp.empno}</td>
                    <td>${emp.ename}</td>
                    <td>${emp.job}</td>
                    <td>
                        <fmt:formatNumber value="${emp.sal}" pattern="#,###"/>
                    </td>

                    <td>
                        <a href="DeptList.jsp?deptno=${emp.deptno}">
                            ${emp.deptno}
                        </a>
                    </td>

                </tr>
            </c:forEach>

        </tbody>

    </table>

</div>

</body>
</html>