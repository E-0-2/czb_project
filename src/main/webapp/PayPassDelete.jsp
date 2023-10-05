
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        body {
            background-color: #f4f4f4;
            border-radius: 9px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            padding: 30px;
            margin: 0 auto;
            max-width: 600px;
            text-align: center;
            font-family: Arial, sans-serif;
        }

        a {
            text-decoration: none;
            color: darkred;
        }

        a:hover {
            color: #800000;
        }

        h1 {
            font-size: 48px;
            color: palevioletred;
            margin-top: 20px;
        }

        .input {
            border: 2px solid #ccc;
            width: 100%;
            height: 35px;
            font-size: 18px;
            padding: 5px;
            margin: 10px 0;
            border-radius: 5px;
        }

        input[type="submit"] {
            width: 100%;
            height: 45px;
            background-color: #800000;
            color: #fff;
            font-size: 24px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }

        input[type="submit"]:hover {
            background-color: #cc0000;
        }

        .center-content {
            text-align: center;
        }
    </style>
    <meta charset="UTF-8">
    <title>PayPass</title>
</head>
<body>
<center><h1><a href="MainPage.jsp">CZB</a></h1></center>
<center><h2>PayPass</h2></center>
<table>
    <form action="PayPassDelete2.jsp" method="post">
        <tr>
            <td>아이디</td>
            <td><input class="input" type="text" name="userid" placeholder="아이디 입력" required></td>
        </tr>
        <tr>
            <td>결제 비밀번호</td>
            <td><input class="input" type="password" name="paypass" placeholder="비밀번호 4자리 입력" required></td>
        </tr>
        <tr>
            <td><input class="input" type="submit" value="삭제"></td>
        </tr>
    </form>
</table>
</body>
</html>
