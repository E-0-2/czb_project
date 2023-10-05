<%@ page import="common.JDBConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");

    Connection conn = JDBConnect.getConnection();
    PreparedStatement pstmt = null;
    String query = "INSERT INTO pay_pass_tb (userid, paypass) VALUES (?,?)";

    if (conn != null) {
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, request.getParameter("userid"));
            pstmt.setString(2, request.getParameter("paypass"));


            int rowsAffected = pstmt.executeUpdate(); // Use executeUpdate() for INSERT

            if (rowsAffected > 0) {
%>
<script>
    alert("PayPass 등록을 진심으로 축하드립니다.");
    location.href = 'MainPage.jsp';
</script>
<%
} else {
%>
<script>
    alert("다시 PayPass 등록을 부탁드립니다.");
    history.back();
</script>
<%
    }

    pstmt.close();
    conn.close();
} catch (SQLException e) {
    e.printStackTrace();
%>
<script>
    alert("PayPass 등록중 오류가 발생했습니다. 다시 시도해주세요.");
    history.back();
</script>
<%
        }
    }
%>
