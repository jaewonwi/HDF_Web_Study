<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Memo Update</title>
</head>
<body>
<jsp:include page="/header.jsp" />

<main class="container mt-4">
    <h2 class="mb-3">Memo Update</h2>

    <c:choose>
        <c:when test="${empty memoupdate or empty memoupdate.id}">
            <div class="alert alert-warning">수정할 메모가 없습니다.</div>
            <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/memolist.do">목록</a>
        </c:when>
        <c:otherwise>
            <form action="${pageContext.request.contextPath}/memoupdateok.do" method="post">
                <table class="table table-bordered align-middle">
                    <tr>
                        <th class="table-light text-center" style="width: 160px;">ID</th>
                        <td>
                            <input class="form-control-plaintext" type="text" name="id"
                                   value="${memoupdate.id}" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th class="table-light text-center">EMAIL</th>
                        <td>
                            <input class="form-control" type="email" name="email" maxlength="60"
                                   value="${memoupdate.email}" required>
                        </td>
                    </tr>
                    <tr>
                        <th class="table-light text-center">MEMO</th>
                        <td>
                            <textarea class="form-control" name="content" rows="6" required><c:out value="${memoupdate.content}" /></textarea>
                        </td>
                    </tr>
                </table>

                <div class="d-flex justify-content-center gap-2">
                    <button class="btn btn-primary" type="submit">수정</button>
                    <a class="btn btn-outline-secondary"
                       href="${pageContext.request.contextPath}/memodetail.do?id=${memoupdate.id}">취소</a>
                    <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/memolist.do">목록</a>
                </div>
            </form>
        </c:otherwise>
    </c:choose>
</main>
</body>
</html>