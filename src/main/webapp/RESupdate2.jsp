<%@ page import="common.JDBConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html lang="en">



<head>
    <meta charset="UTF-8">
    <title>예매</title>
    <style>
        .seat-grid {
            display: grid;
            grid-template-columns: repeat(5, 70px);
            gap: 10px;
            margin: 0 auto;
            text-align: center;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            justify-content: center;
            align-content: center;
        }


        .seat {
            width: 70px;
            height: 70px;
            background-color: #ccc;
            text-align: center;
            line-height: 70px;
            border: 2px solid #000;
            cursor: pointer;
            user-select: none;
            font-size: 18px;
            position: relative;
            transition: background-color 0.3s ease, transform 0.3s ease;
            display: flex;
            justify-content: center;
            align-items: center;
        }


        .seat.selected {
            background-color: #f00;
            color: #fff;
            font-weight: bold;
            transform: scale(1.05);
        }

        .seat.selected {
            background-color: #f00;
            color: #fff;
            font-weight: bold;
            transform: scale(1.05);
        }

        .seat-label {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        a {
            text-decoration: none;
            color: darkred;
        }

        a:hover {
            color: #800000;
        }

        h1 {
            font-size: 48px;
            color: palevioletred;
            margin-top: 20px;
        }



        #reserveButton {
            padding: 10px 20px;
            font-size: 18px;
            background-color: darkred;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        #reserveButton:hover {
            background-color: red;
        }
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 20px;
            background-color: #f5f5f5;
        }

        h2 {
            color: darkred;
        }

        label {
            font-weight: bold;
            margin-right: 10px;
            font-size: 18px;
        }

        select, input {
            padding: 10px;
            margin: 10px;
            font-size: 16px;
        }

        #seatSelection {
            margin-top: 20px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
        }


        .login a {
            text-decoration: none;
            color: #333333;
            margin-left: 10px;
            font-weight: bold;
        }

        .login a:hover {
            color: #800000;
        }

        select#movie, select#location1, select#location2, select#cinema, select#time {
            width: 300px;
        }

        input#date {
            width: 300px;
        }
    </style>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet resultSet = null;

    try {
        conn = JDBConnect.getConnection();

        if (conn != null) {
            String query = "SELECT * FROM res_tb WHERE userid = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, request.getParameter("userid"));


            resultSet = pstmt.executeQuery();

            if (resultSet.next()) {
                String id = resultSet.getString("userid");

%>
<h1><a href="MainPage.jsp">CZB</a></h1>
<h2>예매</h2>

<form action="RESupdate3.jsp" method="post">
    아이디: <input type="text" name="userid" value="<%=id%>" readonly>
    <label>영화 선택:</label>
    <select name="movie_title"  id="movie">
        <option value="콘크리트 유토피아">콘크리트 유토피아</option>
        <option value="엘리멘탈">엘리멘탈</option>
        <option value="오펜하이머">오펜하이머</option>
        <option value="달짝 지근해">달짝 지근해</option>
        <option value="가디언즈 오브 갤럭시">가디언즈 오브 갤럭시</option>
        <option value="콘스탄틴">콘스탄틴</option>
        <option value="컨택트">컨택트</option>
        <option value="코렐라인">코렐라인</option>
        <option value="현기증">현기증</option>
        <option value="인터스텔라">인터스텔라</option>
        <option value="그래비티">그래비티</option>
        <option value="알라딘">알라딘</option>
        <option value="완벽한 타인">완벽한 타인</option>
        <option value="추격자">추격자</option>
        <option value="범죄도시2">범죄도시2</option>
        <option value="범죄도시3">범죄도시3</option>
    </select>


    <label for="location1">지역 선택:</label>
    <select name="movie_location1" id="location1">
        <option value="서울특별시-강남구">서울특별시-강남구</option>
        <option value="서울특별시-송파구">서울특별시-송파구</option>
        <option value="경기도-성남시">경기도-성남시</option>
        <option value="경기도-수원시">경기도-수원시</option>
        <option value="강원도-원주시">강원도-원주시</option>
        <option value="강원도-강릉시">강원도-강릉시</option>
        <option value="충청도-대전">충청도-대전</option>
        <option value="충청도-청주시">충청도-청주시</option>
        <option value="경상도-대구">경상도-대구</option>
        <option value="경상도-부산">경상도-부산</option>
        <option value="전라도-광주">전라도-광주</option>
        <option value="전라도-전주시">전라도-전주시</option>
        <option value="제주도-제주시">제주도-제주시</option>
        <option value="제주도-서귀포시">제주도-서귀포시</option>
    </select>

    <label for="location1">상영관 선택:</label>
    <select name="movie_location2" id="location2">
        <option value="CZB-강남점-1호점">CZB-강남점-1호점</option>
        <option value="CZB-강남점-2호점">CZB-강남점-2호점</option>
        <option value="CZB-송파점-1호점">CZB-송파점-1호점</option>
        <option value="CZB-송파점-2호점">CZB-송파점-2호점</option>
        <option value="CZB-성남점-1호점">CZB-성남점-1호점</option>
        <option value="CZB-성남점-2호점">CZB-성남점-2호점</option>
        <option value="CZB-수원점-1호점">CZB-수원점-1호점</option>
        <option value="CZB-수원점-2호점">CZB-수원점-2호점</option>
        <option value="CZB-원주점-1호점">CZB-원주점-1호점</option>
        <option value="CZB-원주점-2호점">CZB-원주점-2호점</option>
        <option value="CZB-강릉점-1호점">CZB-강릉점-1호점</option>
        <option value="CZB-강릉점-2호점">CZB-강릉점-2호점</option>
        <option value="CZB-강릉점-1호점">CZB-강릉점-1호점</option>
        <option value="CZB-대전점-1호점">CZB-대전점-1호점</option>
        <option value="CZB-대전점-2호점">CZB-대전점-2호점</option>
        <option value="CZB-청주점-1호점">CZB-청주점-1호점</option>
        <option value="CZB-청주점-2호점">CZB-청주점-2호점</option>
        <option value="CZB-대구점-1호점">CZB-대구점-1호점</option>
        <option value="CZB-대구점-2호점">CZB-대구점-2호점</option>
        <option value="CZB-부산점-1호점">CZB-부산점-1호점</option>
        <option value="CZB-부산점-2호점">CZB-부산점-2호점</option>
        <option value="CZB-광주점-1호점">CZB-광주점-1호점</option>
        <option value="CZB-광주점-2호점">CZB-광주점-2호점</option>
        <option value="CZB-전주점-1호점">CZB-전주점-1호점</option>
        <option value="CZB-전주점-2호점">CZB-전주점-2호점</option>
        <option value="CZB-제주점-1호점">CZB-제주점-1호점</option>
        <option value="CZB-제주점-2호점">CZB-제주점-2호점</option>
        <option value="CZB-서귀포점-1호점">CZB-서귀포점-1호점</option>
        <option value="CZB-서귀포점-2호점">CZB-서귀포점-2호점</option>
    </select>
    <br>

    <br>

    <label for="date">상영일 선택:</label>
    <input type="date" name="movie_date" id="date" required>

    <label for="time">상영시간 선택:</label>
    <select name="movie_time" id="time" required>
        <option value="10:00">10:00</option>
        <option value="11:00">11:00</option>
        <option value="12:00">12:00</option>
        <option value="13:00">13:00</option>
        <option value="14:00">14:00</option>
        <option value="15:00">15:00</option>
        <option value="16:00">16:00</option>
        <option value="17:00">17:00</option>
        <option value="18:00">18:00</option>
        <option value="19:00">19:00</option>
        <option value="20:00">20:00</option>
        <option value="21:00">21:00</option>
        <option value="22:00">22:00</option>
        <option value="23:00">23:00</option>
        <option value="00:00">00:00</option>
    </select>

    <div id="seatSelection">
        <h2>영화 좌석 선택</h2>
        <div class="seat-grid">
            <label class="seat"><input id="A1" type="checkbox" name="selectedSeats" value="A1"> A1</label>
            <label class="seat"><input id="A2" type="checkbox" name="selectedSeats" value="A2"> A2</label>
            <label class="seat"><input id="A3" type="checkbox" name="selectedSeats" value="A3"> A3</label>
            <label class="seat"><input id="A4" type="checkbox" name="selectedSeats" value="A4"> A4</label>
            <label class="seat"><input id="A5" type="checkbox" name="selectedSeats" value="A5"> A5</label>
            <label class="seat"><input id="B1" type="checkbox" name="selectedSeats" value="B1"> B1</label>
            <label class="seat"><input id="B2" type="checkbox" name="selectedSeats" value="B2"> B2</label>
            <label class="seat"><input id="B3" type="checkbox" name="selectedSeats" value="B3"> B3</label>
            <label class="seat"><input id="B4" type="checkbox" name="selectedSeats" value="B4"> B4</label>
            <label class="seat"><input id="B5" type="checkbox" name="selectedSeats" value="B5"> B5</label>
            <label class="seat"><input id="C1" type="checkbox" name="selectedSeats" value="C1"> C1</label>
            <label class="seat"><input id="C2" type="checkbox" name="selectedSeats" value="C2"> C2</label>
            <label class="seat"><input id="C3" type="checkbox" name="selectedSeats" value="C3"> C3</label>
            <label class="seat"><input id="C4" type="checkbox" name="selectedSeats" value="C4"> C4</label>
            <label class="seat"><input id="C5" type="checkbox" name="selectedSeats" value="C5"> C5</label>
            <label class="seat"><input id="D1" type="checkbox" name="selectedSeats" value="D1"> D1</label>
            <label class="seat"><input id="D2" type="checkbox" name="selectedSeats" value="D2"> D2</label>
            <label class="seat"><input id="D3" type="checkbox" name="selectedSeats" value="D3"> D3</label>
            <label class="seat"><input id="D4" type="checkbox" name="selectedSeats" value="D4"> D4</label>
            <label class="seat"><input id="D5" type="checkbox" name="selectedSeats" value="D5"> D5</label>
            <label class="seat"><input id="E1" type="checkbox" name="selectedSeats" value="E1"> E1</label>
            <label class="seat"><input id="E2" type="checkbox" name="selectedSeats" value="E2"> E2</label>
            <label class="seat"><input id="E3" type="checkbox" name="selectedSeats" value="E3"> E3</label>
            <label class="seat"><input id="E4" type="checkbox" name="selectedSeats" value="E4"> E4</label>
            <label class="seat"><input id="E5" type="checkbox" name="selectedSeats" value="E5"> E5</label>
            <label class="seat"><input id="F1" type="checkbox" name="selectedSeats" value="F1"> F1</label>
            <label class="seat"><input id="F2" type="checkbox" name="selectedSeats" value="F2"> F2</label>
            <label class="seat"><input id="F3" type="checkbox" name="selectedSeats" value="F3"> F3</label>
            <label class="seat"><input id="F4" type="checkbox" name="selectedSeats" value="F4"> F4</label>
            <label class="seat"><input id="F5" type="checkbox" name="selectedSeats" value="F5"> F5</label>
            <label class="seat"><input id="G1" type="checkbox" name="selectedSeats" value="G1"> G1</label>
            <label class="seat"><input id="G2" type="checkbox" name="selectedSeats" value="G2"> G2</label>
            <label class="seat"><input id="G3" type="checkbox" name="selectedSeats" value="G3"> G3</label>
            <label class="seat"><input id="G4" type="checkbox" name="selectedSeats" value="G4"> G4</label>
            <label class="seat"><input id="G5" type="checkbox" name="selectedSeats" value="G5"> G5</label>
        </div>

    </div>

    <center><input type="submit" value="예매"></center>
</form>
<%
} else {
%>
<script>
    alert("예매 정보가 존재 하지 않거나 아이디가 존재 하지 않습니다.");
    history.back();
</script>
<%
    }
} else {
%>
<script>
    alert("데이터베이스 연결에 실패했습니다.");
    history.back();
</script>
<%
        }
    } catch (SQLException e) {
        e.printStackTrace();
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
%>
</body>
</html>

