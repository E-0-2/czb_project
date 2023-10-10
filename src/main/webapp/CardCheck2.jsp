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
    <title>MyInfo</title>
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
            String query = "SELECT * FROM card_tb WHERE userid = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, request.getParameter("userid"));


            resultSet = pstmt.executeQuery();

            if (resultSet.next()) {


%>
<script>
    alert("결제 수단 선택이 완료 되었습니다.");
    location.href = 'RESPay.jsp';
</script>
<%
} else {
%>
<script>
    alert("결제 수단 등록 되어 있지 않거나 아이디가 일치 하지 않습니다.");
    location.href = 'PaymentMethod.jsp';
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
