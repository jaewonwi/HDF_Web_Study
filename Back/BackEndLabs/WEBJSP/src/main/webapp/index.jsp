<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>게시판 메인</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<jsp:include page="common/header.jsp" />

<div class="container my-5">
  <div class="p-5 bg-light rounded">
    <h1>게시판 사이트</h1>
    <p>JSP include를 사용한 공통 상단/하단 예제입니다.</p>
    <a href="board1.jsp" class="btn btn-primary">게시판 보기</a>
  </div>
</div>

<jsp:include page="common/footer.jsp" />

</body>
</html>