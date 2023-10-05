<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String userId = (String) session.getAttribute("userId");
	%>

	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>메인화면 PAGE</title>
	<style>

		body {
			font-family: Arial, sans-serif;
			background-color: #f5f5f5;
			margin: 0;
			padding: 0;
		}

		h1, h2 {
			text-align: center;
			color: darkred;
		}


		.header {
			background-color: darkred;
			color: white;
			text-align: center;
			padding: 20px 0;
		}

		.header a {
			text-decoration: none;
			color: white;
		}

		.navbar {
			background-color: #333;
			overflow: hidden;
			text-align: center;
		}

		.navbar a {
			display: inline-block;
			padding: 14px 16px;
			text-decoration: none;
			color: white;
			transition: background-color 0.3s, color 0.3s;
		}

		.navbar a:hover {
			background-color: #800000;
		}

		.container {
			max-width: 800px;
			margin: 0 auto;
			padding: 20px;
		}

		.movie-images {
			display: flex;
			flex-wrap: wrap;
			justify-content: center;
		}

		.movie-card {
			text-align: center;
			margin: 10px;
			position: relative;
			background-color: white;
			border-radius: 10px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
		}

		.movie-card img {
			border: 2px solid #333;
			border-radius: 10px 10px 0 0;
			width: 150px;
			height: auto;
		}

		.movie-card button {
			background-color: darkred;
			color: white;
			padding: 5px 10px;
			border: none;
			text-align: center;
			text-decoration: none;
			display: block;
			margin: 10px auto 0;
			cursor: pointer;
			position: absolute;
			bottom: 10px;
			left: 50%;
			width: 50px;
			transform: translateX(-50%);
			transition: background-color 0.3s, color 0.3s;
			border-radius: 5px;
		}

		.movie-card button a {
			color: white;
			text-decoration: none;
		}

		.movie-card button:hover {
			background-color: #800000;
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


		.user-info {
			text-align: right;
			margin-right: 20px;
		}

		.user-info a {
			text-decoration: none;
			color: #333333;
			margin-left: 10px;
			font-weight: bold;
		}

		.user-info a:hover {
			color: #800000;
		}

	</style>
</head>
<body>
<div class="header">
	<h1><a href="MainPage.jsp">CZB</a></h1>
</div>

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
<div class="navbar">
	<a href="MainPage.jsp">CZB</a>
	<a href="Movies.jsp">영화</a>
	<a href="RES.jsp">예매</a>
	<a href="CSC.jsp">고객센터</a>
	<a href="Myinfo.jsp">MyPage</a>
	<a href="PayPass.jsp">PayPass</a>
</div>
<div class="container">
	<h1>HOT Movies</h1>

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
	</div>
</div>
</body>
</html>
