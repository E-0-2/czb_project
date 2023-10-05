<%@ page import="common.JDBConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");

    Connection conn = JDBConnect.getConnection();
    PreparedStatement pstmt = null;
    ResultSet resultSet = null;
    String query = "SELECT userpass FROM client_tb WHERE userid = ? AND username = ? AND useremail = ?";

    if (conn != null) {
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, request.getParameter("userid"));
            pstmt.setString(2, request.getParameter("username"));
            pstmt.setString(3, request.getParameter("useremail"));

            resultSet = pstmt.executeQuery();

            if (resultSet.next()) {
                String password = resultSet.getString("userpass");

%>
<script>
    alert("비밀번호를 찾았습니다. 비밀번호: <%= password %>");
    location.href = 'Login.html';
</script>
<%
} else {
%>
<script>
    alert("정보 입력이 올바르지 않습니다. 다시 확인해주세요.");
    history.back();
</script>
<%
    }

} catch (SQLException e) {
    e.printStackTrace();
%>
<script>
    alert("비밀번호를 찾는 중 오류가 발생했습니다. 다시 시도해주세요.");
    history.back();
</script>
<%
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
    }
%>
