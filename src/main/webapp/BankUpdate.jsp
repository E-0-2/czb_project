<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Bank Update</title>
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
<form action="BankUpdate2.jsp" method="post">
  <table>
    <tr>
      <td>아이디</td>
      <td><input  class="input" type="text" name="userid" placeholder="아이디 입력" required></td>
    </tr>
    <tr>
      <td>은행</td>
      <td><select class="input" name="bank_name" required>
        <option value="농협 은행">농협 은행</option>
        <option value="신한 은행">신한 은행</option>
        <option value="토스 뱅크">토스 뱅크</option>
        <option value="카카오 뱅크">카카오 뱅크</option>
        <option value="국민 은행">국민 은행</option>
        <option value="부산 은행">부산 은행</option>
        <option value="경남 은행">경남 은행</option>
        <option value="기업 은행">기업 은행</option>
        <option value="신협 은행">신협 은행</option>
      </select></td>
    </tr>
    <tr>
      <td>계좌 번호</td>
      <td><input class="input" type="text" name="account" placeholder="(-) 하이픈 넣고 30자리 이하 입력"  required></td>
    </tr>
  </table>
  <br>
  <input type="submit" value="정보 확인">
</form>
</body>
</html>
