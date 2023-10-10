
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
    <title>결제 수단 선택</title>
</head>
<body>

<h1><a href="MainPage.jsp">CZB</a></h1>
<h2>결제 수단 선택</h2>
<div class="button-container">
    <button><a href="CardCheck.jsp">카드 결제</a></button>
    <button><a href="BankCheck.jsp">계좌 결제</a></button>
</div>

</body>
</html>
