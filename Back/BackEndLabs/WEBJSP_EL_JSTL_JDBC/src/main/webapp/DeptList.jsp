<%@page import="dto.DeptDto"%>
<%@page import="dao.DeptDao"%>
<%@page import="java.util.List"%>
<%@page import="dao.DeptDao"%>
<%@page import="dto.DeptDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    String deptno = request.getParameter("deptno");

    DeptDao dao = new DeptDao();

    List<DeptDto> deptList =
        dao.getDeptList(Integer.parseInt(deptno));

    request.setAttribute("deptList", deptList);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEPT LIST</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">
</head>

<body>

<div class="container mt-5">

    <h2 class="mb-4">
        부서 정보 (부서번호 : ${param.deptno})
    </h2>

    <table class="table table-bordered table-hover">

        <thead class="table-primary">
            <tr>
                <th>부서번호</th>
                <th>부서명</th>
                <th>지역</th>
            </tr>
        </thead>

        <tbody>

            <c:forEach var="dept" items="${deptList}">
                <tr>
                    <td>${dept.deptno}</td>
                    <td>${dept.dname}</td>
                    <td>${dept.loc}</td>
                </tr>
            </c:forEach>

        </tbody>

    </table>

    <a href="EmpList.jsp" class="btn btn-secondary">
        사원목록으로
    </a>

</div>

</body>
</html>