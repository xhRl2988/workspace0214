<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/db.jsp" %>
<%
	String sql="select a.custno ,a.custname , decode(grade,'A','VIP','B','일반','C','직원') grade, "
			+ " sum(b.price)price from member_tbl_02 a,money_tbl_02 b "
			+ " where a.custno = b.custno and nvl(b.price,0)>0 "
			+ " group by a.custno, a.custname, a.grade "
			+ " order by sum(b.price) desc";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs=pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쇼핑몰 회원관리</title>
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	<main id="section">
		<h2 class="title">쇼핑몰 회원관리 프로그램</h2>
				<table class="table_line">
					<tr>
						<th>회원번호</th>
						<th>회원성명</th>
						<th>고객등급</th>
						<th>매출</th>
					</tr>
					<%while(rs.next()) {%>
					<tr align="center">
						<td><%= rs.getString("custno") %></td>
						<td><%= rs.getString("custname") %></td>
						<td><%= rs.getString("grade") %></td>
						<td><%= rs.getString("price") %></td>
					</tr>	
					<%} %>
				</table>
	</main>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>