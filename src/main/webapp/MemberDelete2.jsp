<%@ page import="common.JDBConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
      border: 1px solid #ddd;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }

    th, td {
      padding: 10px;
      text-align: left;
      border-bottom: 1px solid #ddd;
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

    form {
      margin-top: 20px;
      text-align: center;
    }

    label {
      display: block;
      font-weight: bold;
      margin-top: 10px;
    }

    input[type="text"],
    input[type="password"],
    input[type="email"] {
      width: 100%;
      padding: 10px;
      margin-top: 5px;
      margin-bottom: 15px;
      border: 1px solid #ddd;
      border-radius: 4px;
    }

    input[type="submit"] {
      background-color: #333;
      color: white;
      border: none;
      border-radius: 4px;
      padding: 10px 20px;
      cursor: pointer;
    }

    input[type="submit"]:hover {
      background-color: #555;
    }
  </style>
  <meta charset="UTF-8">
  <title>회원삭제 PAGE</title>
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
      String query = "SELECT * FROM client_tb WHERE userid = ? and userpass = ? and username = ?";
      pstmt = conn.prepareStatement(query);
      pstmt.setString(1, request.getParameter("userid"));
      pstmt.setString(2, request.getParameter("userpass"));
      pstmt.setString(3, request.getParameter("username"));

      resultSet = pstmt.executeQuery();

      if (resultSet.next()) {
        String id = resultSet.getString("userid");
        String password = resultSet.getString("userpass");
        String name = resultSet.getString("username");
%>
<h1><a href="MainPage.jsp">CZB</a></h1>
<h2>회원 삭제</h2>
<table>
  <form action="MemberDelete3.jsp" method="post">
    <tr>
      <td>아이디</td>
      <td><input type="text" name="userid" value="<%=id%>" readonly></td>
    </tr>
    <tr>
      <td>비밀번호</td>
      <td><input type="password" name="userpass" value="<%=password%>" readonly></td>
    </tr>
    <tr>
      <td>이름</td>
      <td><input type="text" name="username" value="<%=name%>" readonly></td>
    </tr>
    <tr>
      <td></td>
      <td><input type="submit" value="회원 정보 삭제"></td>
    </tr>
  </form>
</table>
<%
} else {
%>
<script>
  alert("없는 회원 입니다.");
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
