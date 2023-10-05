<%@ page import="common.JDBConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css">
<head>


  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 0;
    }

    h2 {
      text-align: center;
      color: #333;
    }

    table {
      width: 80%;
      margin: 20px auto;
      border-collapse: collapse;
      background-color: white;
    }

    table, th, td {
      border: 1px solid #ddd;
    }

    th, td {
      padding: 10px;
      text-align: left;
    }

    th {
      background-color: #333;
      color: white;
    }

    tr:nth-child(even) {
      background-color: #f2f2f2;
    }

    tr:hover {
      background-color: #ddd;
    }

    button {
      background-color: #333;
      color: white;
      padding: 10px 20px;
      border: none;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 16px;
      margin: 10px auto;
      cursor: pointer;
    }

    button a {
      color: white;
      text-decoration: none;
    }

    button:hover {
      background-color: #555;
    }
    a {
      text-decoration: none;
      color: darkred;
    }

    a:hover {
      color: #800000;
    }

    h1 {
      text-align: center;
      font-size: 48px;
      color: palevioletred;
      margin-top: 20px;
    }

  </style>
  <meta charset="UTF-8">
  <title>회원정보 PAGE</title>
</head>
<body>
<%
  request.setCharacterEncoding("UTF-8");
  response.setContentType("text/html; charset=UTF-8");

  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet resultSet = null;

  try {

    conn = JDBConnect.getConnection();

    if (conn != null) {
      String query = "SELECT * FROM res_tb WHERE userid = ?";
      pstmt = conn.prepareStatement(query);
      pstmt.setString(1, request.getParameter("userid"));


      resultSet = pstmt.executeQuery();

      if (resultSet.next()) {
        String id = resultSet.getString("userid");
        String movieTitle = resultSet.getString("movie_title");
        String movieLocation1 = resultSet.getString("movie_location1");
        String movieLocation2 = resultSet.getString("movie_location2");
        String movieDate = resultSet.getString("movie_date");
        String movieTime = resultSet.getString("movie_time");
        String selectedSeats = resultSet.getString("movie_seat");
%>
<h1><a href="MainPage.jsp">CZB</a></h1>
<h2>회원 정보</h2>
<table border="1">
  <thead>
  <tr>
    <th>아이디</th>
    <th>영화</th>
    <th>지역</th>
    <th>상영관</th>
    <th>날짜</th>
    <th>영화 시간</th>
    <th>좌석</th>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td><%= id %></td>
    <td><%= movieTitle %></td>
    <td><%= movieLocation1 %></td>
    <td><%= movieLocation2 %></td>
    <td><%= movieDate %></td>
    <td><%= movieTime %></td>
    <td><%= selectedSeats %></td>
  </tr>
  </tbody>
</table>
<center><button><a href="MainPage.jsp">메인 화면으로</a></button></center>
<%
} else {
%>
<script>
  alert("예매 정보가 존재 하지 않습니다 혹은 아이디가 존재 하지 않습니다.");
  history.back();
</script>
<%
  }
} else {
%>
<script>
  alert("데이터베이스 연결에 실패했습니다.");
  history.back();
</script>
<%
    }
  } catch (SQLException e) {
    e.printStackTrace();
  } finally {
    try {
      if (resultSet != null) {
        resultSet.close();
      }
      if (pstmt != null) {
        pstmt.close();
      }
      if (conn != null) {
        conn.close();
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
%>
</body>
</html>
