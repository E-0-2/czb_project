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
    String query = "INSERT INTO client_tb (userid, userpass, username, userrrn, useraddr, userphone, useremail) VALUES (?,?,?,?,?,?,?)";

    if (conn != null) {
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, request.getParameter("userid"));
            pstmt.setString(2, request.getParameter("userpass"));
            pstmt.setString(3, request.getParameter("username"));
            pstmt.setString(4, request.getParameter("userrrn"));
            pstmt.setString(5, request.getParameter("useraddr"));
            pstmt.setString(6, request.getParameter("userphone"));
            pstmt.setString(7, request.getParameter("useremail"));

            int rowsAffected = pstmt.executeUpdate(); // Use executeUpdate() for INSERT

            if (rowsAffected > 0) {
%>
<script>
    alert("회원가입을 진심으로 축하드립니다.");
    location.href = 'Login.html';
</script>
<%
} else {
%>
<script>
    alert("다시 회원 가입을 부탁드립니다.");
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
    alert("회원 가입 중 오류가 발생했습니다. 다시 시도해주세요.");
    history.back();
</script>
<%
        }
    }
%>
