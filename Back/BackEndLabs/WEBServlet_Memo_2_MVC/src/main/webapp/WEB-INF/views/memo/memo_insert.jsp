<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Memo Insert</title>
</head>
<body>
<jsp:include page="/header.jsp" />

<main class="container mt-4">
    <h2 class="mb-3">Memo Insert</h2>

    <form action="${pageContext.request.contextPath}/memoinsert.do" method="post">
        <table class="table table-bordered align-middle">
            <tr>
                <th class="table-light text-center" style="width: 160px;">ID</th>
                <td>
                    <input class="form-control" type="text" name="id" maxlength="10" required>
                </td>
            </tr>
            <tr>
                <th class="table-light text-center">EMAIL</th>
                <td>
                    <input class="form-control" type="email" name="email" maxlength="60" required>
                </td>
            </tr>
            <tr>
                <th class="table-light text-center">MEMO</th>
                <td>
                    <textarea class="form-control" name="content" rows="6" required></textarea>
                </td>
            </tr>
        </table>

        <div class="d-flex justify-content-center gap-2">
            <button class="btn btn-primary" type="submit">등록</button>
            <button class="btn btn-secondary" type="reset">취소</button>
            <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/memolist.do">목록</a>
        </div>
    </form>
</main>
</body>
</html>