<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    String userId = (String) session.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
    <title>MoviesList</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }

        h1, h2 {
            text-align: center;
            color: darkred;
        }

        h1 a {
            text-decoration: none;
            color: darkred;
        }

        .movie-images {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin-top: 20px;
        }

        .movie-card {
            text-align: center;
            margin: 10px;
            position: relative;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease-in-out;
        }

        .movie-card:hover {
            transform: scale(1.05);
        }

        .movie-card img {
            border: 2px solid #333;
            border-radius: 10px 10px 0 0;
            width: 200px;
            height: 225px;
        }

        .movie-card button {
            background-color: darkred;
            color: white;
            padding: 5px 20px;
            border: none;
            text-align: center;
            text-decoration: none;
            display: block;
            margin-top: 20px;
            margin: 10px auto 0;
            cursor: pointer;
            position: absolute;
            bottom: 10px;
            left: 50%;
            transform: translateX(-50%);
            transition: background-color 0.3s, color 0.3s;
            border-radius: 5px;
        }

        .movie-card button a {
            color: white;
            text-decoration: none;
        }

        h2 {
            font-size: 24px;
        }

        .login {
            color: #333333;
            text-align: right;
            margin-right: 20px;
        }

        .login a {
            text-decoration: none;
            color: #333333;
            margin-left: 10px;
            font-weight: bold;
        }

        .login a:hover {
            color: #800000;
        }

        .user-info {
            text-align: right;
            margin-right: 20px;
        }

        .user-info p {
            font-weight: bold;
            margin: 0;
        }
    </style>
</head>
<body>

<h1><a href="MainPage.jsp">CZB</a></h1>
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
<div class="movie-images">
<h2>Moveis</h2>
<div class="movie-images">
    <div class="movie-card">
        <img src="https://raw.githubusercontent.com/mang3018/MovieJavaProject/main/czb1.png" alt="Movie 1" width="200" height="225">

        <button><a href="RES.jsp">예매</a></button>
    </div>
    <div class="movie-card">
        <img src="https://raw.githubusercontent.com/mang3018/MovieJavaProject/main/czb2.png" alt="Movie 2" width="200" height="225">

        <button><a href="RES.jsp">예매</a></button>
    </div>
    <div class="movie-card">
        <img src="https://raw.githubusercontent.com/mang3018/MovieJavaProject/main/czb3.png" alt="Movie 3" width="200" height="225">

        <button><a href="RES.jsp">예매</a></button>
    </div>
    <div class="movie-card">
        <img src="https://raw.githubusercontent.com/mang3018/MovieJavaProject/main/czb4.png" alt="Movie 4" width="200" height="225">

        <button><a href="RES.jsp">예매</a></button>
    </div>
    <div class="movie-card">
        <img src="https://raw.githubusercontent.com/mang3018/MovieJavaProject/main/czb5.png" alt="Movie 5" width="200" height="225">

        <button><a href="RES.jsp">예매</a></button>
    </div>
    <div class="movie-card">
        <img src="https://raw.githubusercontent.com/mang3018/MovieJavaProject/main/czb6.png" alt="Movie 6" width="200" height="225">

        <button><a href="RES.jsp">예매</a></button>
    </div>
    <div class="movie-card">
        <img src="https://raw.githubusercontent.com/mang3018/MovieJavaProject/main/czb7.png" alt="Movie 7" width="200" height="225">

        <button><a href="RES.jsp">예매</a></button>
    </div>
    <div class="movie-card">
        <img src="https://raw.githubusercontent.com/mang3018/MovieJavaProject/main/czb8.png" alt="Movie 8" width="200" height="225">

        <button><a href="RES.jsp">예매</a></button>
    </div>
    <div class="movie-card">
        <img src="https://raw.githubusercontent.com/mang3018/MovieJavaProject/main/czb9.png" alt="Movie 9" width="200" height="225">

        <button><a href="RES.jsp">예매</a></button>
    </div>
    <div class="movie-card">
        <img src="https://raw.githubusercontent.com/mang3018/MovieJavaProject/main/czb10.png" alt="Movie 9" width="200" height="225">

        <button><a href="RES.jsp">예매</a></button>
    </div>
    <div class="movie-card">
        <img src="https://raw.githubusercontent.com/mang3018/MovieJavaProject/main/czb11.png" alt="Movie 9" width="200" height="225">

        <button><a href="RES.jsp">예매</a></button>
    </div>
    <div class="movie-card">
        <img src="https://raw.githubusercontent.com/mang3018/MovieJavaProject/main/czb12.png" alt="Movie 9" width="200" height="225">

        <button><a href="RES.jsp">예매</a></button>
    </div>
    <div class="movie-card">
        <img src="https://raw.githubusercontent.com/mang3018/MovieJavaProject/main/czb13.png" alt="Movie 9" width="200" height="225">

        <button><a href="RES.jsp">예매</a></button>
    </div>
    <div class="movie-card">
        <img src="https://raw.githubusercontent.com/mang3018/MovieJavaProject/main/czb14.png" alt="Movie 9" width="200" height="225">

        <button><a href="RES.jsp">예매</a></button>
    </div>
    <div class="movie-card">
        <img src="https://raw.githubusercontent.com/mang3018/MovieJavaProject/main/czb15.png" alt="Movie 9" width="200" height="225">

        <button><a href="RES.jsp">예매</a></button>
    </div>
    <div class="movie-card">
        <img src="https://raw.githubusercontent.com/mang3018/MovieJavaProject/main/czb16.png" alt="Movie 9" width="200" height="225">

        <button><a href="RES.jsp">예매</a></button>
    </div>
</div>
</div>
</body>
</html>
