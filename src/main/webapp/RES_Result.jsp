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
    String query = "INSERT INTO res_tb (userid, movie_title, movie_location1, movie_location2, movie_date, movie_time, movie_seat) VALUES (?,?,?,?,?,?,?)";

    if (conn != null) {
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, request.getParameter("userid"));
            pstmt.setString(2, request.getParameter("movie_title"));
            pstmt.setString(3, request.getParameter("movie_location1"));
            pstmt.setString(4, request.getParameter("movie_location2"));
            pstmt.setString(5, request.getParameter("movie_date"));
            pstmt.setString(6, request.getParameter("movie_time"));

            // 다음은 선택된 좌석 값을 가져오는 부분입니다.
            String[] selectedSeats = request.getParameterValues("selectedSeats");
            String selectedSeatsStr = ""; // 여러 좌석 값을 하나의 문자열로 저장

            if (selectedSeats != null && selectedSeats.length > 0) {
                selectedSeatsStr = String.join(",", selectedSeats);
            }

            pstmt.setString(7, selectedSeatsStr); // 선택된 좌석 값을 설정

            int rowsAffected = pstmt.executeUpdate(); // INSERT 쿼리 실행

            if (rowsAffected > 0) {
%>
<script>
    location.href = 'RESPay.jsp';
</script>
<%
} else {
%>
<script>
    alert("다시 예매 부탁드립니다.");
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
    alert("영화 예매중 오류가 발생했습니다. 다시 시도해주세요.");
    history.back();
</script>
<%
        }
    }
%>
