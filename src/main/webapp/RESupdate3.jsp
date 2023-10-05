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
  String query = "update res_tb set movie_title=?, movie_location1=?, movie_location2=?, movie_date=?, movie_time=?, movie_seat=? where userid=?";

  if (conn != null) {
    try {
      pstmt = conn.prepareStatement(query);

      pstmt.setString(1, request.getParameter("movie_title"));
      pstmt.setString(2, request.getParameter("movie_location1"));
      pstmt.setString(3, request.getParameter("movie_location2"));
      pstmt.setString(4, request.getParameter("movie_date"));
      pstmt.setString(5, request.getParameter("movie_time"));


      String[] selectedSeats = request.getParameterValues("selectedSeats");
      String selectedSeatsStr = "";

      if (selectedSeats != null && selectedSeats.length > 0) {
        selectedSeatsStr = String.join(",", selectedSeats);
      }

      pstmt.setString(6, selectedSeatsStr);
      pstmt.setString(7, request.getParameter("userid"));

      int rowsUpdated = pstmt.executeUpdate();

      if (rowsUpdated > 0) {
%>
<script>
  alert(" 예매 변경이 완료 되었습니다.");
  location.href = 'MainPage.jsp';
</script>
<%
} else {
%>
<script>
  alert("다시 예매 변경 부탁드립니다.");
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
  alert("영화 예매 변경중 오류가 발생했습니다. 다시 시도해주세요.");
  history.back();
</script>
<%
    }
  }
%>
