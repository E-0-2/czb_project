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
            border-radius: 4px;
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
            margin-top: 100px;
        }


        .button-container {
            text-align: center;
        }

        .button-container button {
            display: block;
            margin: 10px auto;
        }
    </style>
    <meta charset="UTF-8">
    <title>최초 결제 수단 설정</title>
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

%>
<h1><a href="MainPage.jsp">CZB</a></h1>
<h2>결제 수단 수정</h2>
<div class="button-container">
    <button><a href="CardUpdate.jsp">카드 결제 수정</a></button>
    <button><a href="BankUpdate.jsp">계좌 결제 수정</a></button>
</div>
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
