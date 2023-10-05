<%@ page import="common.JDBConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        conn = JDBConnect.getConnection();

        if (conn != null) {
            String query = "delete from bank_tb where userid = ? and bank_name = ? and account = ? ";
            pstmt = conn.prepareStatement(query);

            pstmt.setString(1, request.getParameter("userid"));
            pstmt.setString(2, request.getParameter("bank_name"));
            pstmt.setString(3, request.getParameter("account"));


            int rowsDeleted = pstmt.executeUpdate();

            if (rowsDeleted > 0) {
%>
<script>
    alert("결제 수단 정보가 성공적으로 삭제되었습니다.");
    location.href = 'CSC.jsp';
</script>
<%
} else {
%>
<script>
    alert("결제 수단 정보 삭제에 실패했습니다. 입력 정보를 다시 확인하세요.");
    history.back();
</script>
<%
    }
} else {
%>
<script>
    alert("데이터베이스 연결에 실패했습니다. 관리자에게 문의하세요.");
    history.back();
</script>
<%
    }
} catch (SQLException e) {
    e.printStackTrace();
%>
<script>
    alert("결제 수단 정보 삭제하는 중 오류가 발생했습니다. 다시 시도해주세요.");
    history.back();
</script>
<%
    } finally {
        try {
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
