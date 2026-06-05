<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Memo Detail</title>
</head>
<body>
<jsp:include page="/header.jsp" />

<main class="container mt-4">
    <h2 class="mb-3">Memo Detail</h2>

    <c:choose>
        <c:when test="${empty memodetail or empty memodetail.id}">
            <div class="alert alert-warning">조회된 메모가 없습니다.</div>
            <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/memolist.do">목록</a>
        </c:when>
        <c:otherwise>
            <table class="table table-bordered align-middle">
                <tr>
                    <th class="table-light text-center" style="width: 160px;">ID</th>
                    <td><c:out value="${memodetail.id}" /></td>
                </tr>
                <tr>
                    <th class="table-light text-center">EMAIL</th>
                    <td><c:out value="${memodetail.email}" /></td>
                </tr>
                <tr>
                    <th class="table-light text-center">MEMO</th>
                    <td><c:out value="${memodetail.content}" /></td>
                </tr>
            </table>

            <div class="d-flex justify-content-center gap-2">
                <a class="btn btn-primary"
                   href="${pageContext.request.contextPath}/memoupdate.do?id=${memodetail.id}">수정</a>
                <a class="btn btn-danger"
                   href="${pageContext.request.contextPath}/memodelete.do?id=${memodetail.id}"
                   onclick="return confirm('삭제하시겠습니까?');">삭제</a>
                <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/memolist.do">목록</a>
            </div>
        </c:otherwise>
    </c:choose>
</main>
</body>
</html>