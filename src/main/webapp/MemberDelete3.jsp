<%@ page import="common.JDBConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("UTF-8");
  response.setContentType("text/html; charset=UTF-8");

  Connection conn = null;
  PreparedStatement pstmt1 = null;
  PreparedStatement pstmt2 = null;
  PreparedStatement pstmt3 = null;
  PreparedStatement pstmt4 = null;
  PreparedStatement pstmt5 = null;

  try {
    conn = JDBConnect.getConnection();

    if (conn != null) {
      // 먼저 다른 테이블에서 해당 userid의 레코드를 삭제합니다.
      String resQuery = "DELETE FROM res_tb WHERE userid = ?";
      pstmt1 = conn.prepareStatement(resQuery);
      pstmt1.setString(1, request.getParameter("userid"));
      int resRowsDeleted = pstmt1.executeUpdate();

      String payPassQuery = "DELETE FROM pay_pass_tb WHERE userid = ?";
      pstmt2 = conn.prepareStatement(payPassQuery);
      pstmt2.setString(1, request.getParameter("userid"));
      int payPassRowsDeleted = pstmt2.executeUpdate();

      String cardQuery = "DELETE FROM card_tb WHERE userid = ?";
      pstmt3 = conn.prepareStatement(cardQuery);
      pstmt3.setString(1, request.getParameter("userid"));
      int cardRowsDeleted = pstmt3.executeUpdate();

      String bankQuery = "DELETE FROM bank_tb WHERE userid = ?";
      pstmt4 = conn.prepareStatement(bankQuery);
      pstmt4.setString(1, request.getParameter("userid"));
      int bankRowsDeleted = pstmt4.executeUpdate();

      // 그 후 client_tb 테이블에서 userid, userpass, username에 해당하는 레코드를 삭제합니다.
      String clientQuery = "DELETE FROM client_tb WHERE userid = ? AND userpass = ? AND username = ?";
      pstmt5 = conn.prepareStatement(clientQuery);
      pstmt5.setString(1, request.getParameter("userid"));
      pstmt5.setString(2, request.getParameter("userpass"));
      pstmt5.setString(3, request.getParameter("username"));
      int clientRowsDeleted = pstmt5.executeUpdate();

      if (resRowsDeleted >= 0 && payPassRowsDeleted >= 0 && cardRowsDeleted >= 0 && bankRowsDeleted >= 0 && clientRowsDeleted > 0) {
%>
<script>
  alert("회원 정보가 성공적으로 삭제되었습니다.");
  location.href = 'Login.html'; // 삭제 성공 시 이동할 페이지 설정
</script>
<%
} else {
%>
<script>
  alert("회원 정보 삭제에 실패했습니다. 입력 정보를 다시 확인하세요.");
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
  alert("회원 정보를 삭제하는 중 오류가 발생했습니다. 다시 시도해주세요.");
  history.back();
</script>
<%
  } finally {
    try {
      if (pstmt1 != null) {
        pstmt1.close();
      }
      if (pstmt2 != null) {
        pstmt2.close();
      }
      if (pstmt3 != null) {
        pstmt3.close();
      }
      if (pstmt4 != null) {
        pstmt4.close();
      }
      if (pstmt5 != null) {
        pstmt5.close();
      }
      if (conn != null) {
        conn.close();
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
%>
