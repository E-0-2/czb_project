<%@ page import="common.JDBConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
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
    <title>Card Delete</title>
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
            String query = "SELECT * FROM card_tb WHERE userid = ? and card_co = ? and card_num = ? and cvc_num = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, request.getParameter("userid"));
            pstmt.setString(2, request.getParameter("card_co"));
            pstmt.setString(3, request.getParameter("card_num"));
            pstmt.setString(4, request.getParameter("cvc_num"));

            resultSet = pstmt.executeQuery();

            if (resultSet.next()) {
                String id = resultSet.getString("userid");
                String cardNum = resultSet.getString("card_num");
                String cvcNum = resultSet.getString("cvc_num");

%>
<center><h1><a href="MainPage.jsp">CZB</a></h1></center>
<center><h2>결제 수단 삭제</h2></center>
<table>
    <form action="CardDelete3.jsp" method="post">
        <table>
            <tr>
                <td>아이디</td>
                <td><input  class="input" type="text" name="userid" value="<%= id%>" placeholder="아이디 입력" readonly></td>
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
                <td><input class="input" type="text" name="card_num" value="<%= cardNum%>"  placeholder="(-) 하이픈 넣고 16자리 입력" required></td>
            </tr>
            <tr>
                <td>cvc</td>
                <td><input class="input" type="text" name="cvc_num" value="<%= cvcNum%>"  placeholder="3자리 입력" required></td>
            </tr>
            <tr>
                <td><input class="input"  type="checkbox" required></td>
                <td>결제 수단 삭정 동의를 하신다면 체크.</td>
            </tr>
        </table>
        <br>
        <input type="submit" value="삭제">
    </form>
</table>
<%
} else {
%>
<script>
    alert("카드 정보가 일치 하지 않습니다..");
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
