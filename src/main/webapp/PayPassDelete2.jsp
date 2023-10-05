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
  String query = "delete from pay_pass_tb where userid =? and paypass =?";

  if (conn != null) {
    try {
      pstmt = conn.prepareStatement(query);
      pstmt.setString(1, request.getParameter("userid"));
      pstmt.setString(2, request.getParameter("paypass"));


      int rowsDeleted = pstmt.executeUpdate();

      if (rowsDeleted > 0) {
%>
<script>
  alert("PayPass 삭제가 완료 되었습니다.");
  location.href = 'MainPage.jsp';
</script>
<%
} else {
%>
<script>
  alert("PayPass 삭제중 오류 발생 ");
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
  alert("PayPass 삭제중 오류가 발생했습니다. 다시 시도해주세요.");
  history.back();
</script>
<%
    }
  }
%>
