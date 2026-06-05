<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Memo List</title>
</head>
<body>
<jsp:include page="/header.jsp" />

<main class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2 class="mb-0">Memo List</h2>
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/memo.do">글쓰기</a>
    </div>

    <table class="table table-striped table-bordered align-middle">
        <thead class="table-light">
        <tr class="text-center">
            <th>Writer</th>
            <th>Email</th>
            <th>MemoContent</th>
            <th>Detail</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${empty memoList}">
                <tr>
                    <td colspan="4" class="text-center py-4">등록된 메모가 없습니다.</td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach var="memo" items="${memoList}">
                    <tr>
                        <td><c:out value="${memo.id}" /></td>
                        <td><c:out value="${memo.email}" /></td>
                        <td><c:out value="${memo.content}" /></td>
                        <td class="text-center">
                            <a class="btn btn-sm btn-outline-primary"
                               href="${pageContext.request.contextPath}/memodetail.do?id=${memo.id}">상세보기</a>
                        </td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
</main>
</body>
</html>