<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>로그아웃</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      text-align: center;
      padding: 20px;
    }

    h1 {
      color: darkred;
    }

    p {
      font-size: 18px;
    }

    a {
      text-decoration: none;
      color: darkred;
      font-weight: bold;
    }
  </style>
</head>
<body>
<%

  session.invalidate();
%>
<h1>로그아웃</h1>
<p>로그아웃되었습니다.</p>
<p><a href="Login.html">다시 로그인</a></p>
</body>
</html>
