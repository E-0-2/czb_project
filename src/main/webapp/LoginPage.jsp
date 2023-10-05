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
    ResultSet rs = null;
    String query = "SELECT userid, userpass FROM client_tb WHERE userid = ? AND userpass = ?";

    if (conn != null) {
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, request.getParameter("userid"));
            pstmt.setString(2, request.getParameter("userpass"));
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String userId = rs.getString("userid");
                session.setAttribute("userId", userId);

%>
<script>
        alert("로그인 성공");
        location.href = 'MainPage.jsp?userid=<%=userId%>';

</script>
<%
} else {
    // Failed login
%>
<script>
    alert("로그인 실패");
    history.back();
</script>
<%
        }
        rs.close();
        pstmt.close();
        conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
} else {
%>

<%
    }
%>
