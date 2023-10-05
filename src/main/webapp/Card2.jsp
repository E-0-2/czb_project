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
  String query = "INSERT INTO card_tb (userid, card_co, card_num, cvc_num) VALUES (?,?,?,?)";

  if (conn != null) {
    try {
      pstmt = conn.prepareStatement(query);
      pstmt.setString(1, request.getParameter("userid"));
      pstmt.setString(2, request.getParameter("card_co"));
      pstmt.setString(3, request.getParameter("card_num"));
      pstmt.setString(4, request.getParameter("cvc_num"));


      int rowsAffected = pstmt.executeUpdate(); // Use executeUpdate() for INSERT

      if (rowsAffected > 0) {
%>
<script>
  alert("결제 수단 등록이 완료 되었습니다.");
  location.href = 'CSC.jsp';
</script>
<%
} else {
%>
<script>
  alert("다시 결제 수단 등록을 부탁드립니다.");
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
  alert("결제 수단 등록" +
          "중 오류가 발생했습니다. 다시 시도해주세요.");
  history.back();
</script>
<%
    }
  }
%>
