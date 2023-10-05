<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Card Delete</title>
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
</head>
<body>
<center><h1><a href="MainPage.jsp">CZB</a></h1></center>
<br><br>
<center><h2>본인 카드 정보 입력</h2></center>

<br><br>
<form action="CardDelete2.jsp" method="post">
    <table>
        <tr>
            <td>아이디</td>
            <td><input  class="input" type="text" name="userid" placeholder="아이디 입력" required></td>
        </tr>
        <tr>
            <td>카드 회사</td>
            <td><select class="input" name="card_co" required>
                <option value="삼성 카드">삼성 카드</option>
                <option value="현대 카드">현대 카드</option>
                <option value="롯데 카드">롯데 카드</option>
                <option value="신한 카드">신한 카드</option>
                <option value="하나 카드">하나 카드</option>
            </select></td>
        </tr>
        <tr>
            <td>카드 번호</td>
            <td><input class="input" type="text" name="card_num" placeholder="(-) 하이픈 넣고 16자리 입력" required></td>
        </tr>
        <tr>
            <td>cvc</td>
            <td><input class="input" type="text" name="cvc_num" placeholder="3자리 입력" required></td>
        </tr>
    </table>
    <br>
    <input type="submit" value="정보 확인">
</form>
</body>
</html>
