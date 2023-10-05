<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    String userId = (String) session.getAttribute("userId");
%>
<html>
<head>
    <title>CZB 고객 센터</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: darkred;
            margin-top: 20px;
        }

        h2 {
            text-align: center;
            color: darkred;
        }

        h3 {
            text-align: center;
            color: darkred;
            margin-left: 20px;
        }

        .login {
            text-align: right;
            margin: 10px;
            padding: 10px;
            background-color: #fff;
            border-radius: 5px;
        }

        .login a {
            text-decoration: none;
            color: darkred;
            margin-left: 10px;
        }

        .login a:hover {
            color: #800000;
        }

        .navbar {
            text-align: center;
            background-color: darkred;
            padding: 10px 0;
        }

        .navbar a {
            text-decoration: none;
            color: white;
            padding: 10px 20px;
            margin: 5px;
            border: 2px solid darkred;
            border-radius: 5px;
            display: inline-block;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .navbar a:hover {
            background-color: #800000;
            color: white;
        }

        a {
            text-decoration: none;
            color: darkred;
        }

        a:hover {
            color: #800000;
        }
    </style>
</head>
<body>
<div class="login">
    <% if (userId != null) { %>
    <div class="user-info">
        <p>로그인 사용자: <%= userId %></p>
        <a href="Logout.jsp">로그아웃</a>
    </div>
    <% } else { %>
    <a href="Login.html">로그인</a>
    <a href="CreateMemberPage.html">회원가입</a>
    <a href="IDSearch.html">아이디찾기</a>
    <a href="PassSearch.html">비밀번호찾기</a>
    <% } %>
</div>
<h1><a href="MainPage.jsp">CZB</a></h1>
<br>
<h2>고객 센터</h2>
<br>
<h3>정보 설정 및 수정 및 삭제</h3>
<br>
<div class="navbar">
    <a href="MemberUpdate.jsp">회원 수정</a>
    <a href="MemberDelete.jsp">회원 삭제</a>
    <a href="PaymentMethod.jsp">결제 수단 등록</a>
    <a href="PaymentUpdate.jsp">결제 수단 수정</a>
    <a href="PaymentDelete.jsp">결제 수단 삭제</a>
    <a href="RESupdate.jsp">예매 변경</a>
    <a href="RESdelete.jsp">예매 취소</a>
    <a href="RES_info.jsp">예매 정보</a>
</div>
    <form action="MemberUpdate2.jsp" method="post">

    </form>
</body>
</html>
