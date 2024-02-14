<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/db.jsp" %>
<%
	String sql="select custno, custname, phone, address, "
			+ " to_char(joindate,'yyyy-mm-dd') joindate, grade, city "
			+ " from member_tbl_02"
			+ " where custno="+request.getParameter("custno");
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
				
					<%if(rs.next()) {%>
					<tr>
						<th>회원번호</th>
						<td><%= rs.getString("custno") %></td>
					</tr>
					<tr>
						<th>회원성명</th>
						<td><%= rs.getString("custname") %></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><%= rs.getString("phone") %></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><%= rs.getString("address") %></td>				
					</tr>
					<tr>
						<th>가입일자</th>
						<td><%= rs.getString("joindate") %></td>
					</tr>
					<tr>
						<th>고객등급</th>
						<td><%= rs.getString("grade") %></td>
					</tr>
					<tr>
						<th>도시코드</th>
						<td><%= rs.getString("city") %></td>
					</tr>
					<%}else{ %>
					<tr>
						<th>회원번호</th>
						<td><%= request.getParameter("custno") %>의 회원정보가 없습니다</td>
					<tr>
					<%} %>
						<th colspan="2">
							<input type="button" value="취소 후 다시 조회" onclick="parent.localtion.href='iquery.jsp'">
							<input type="button" value="회원 목록 조회/수정" onclick="parent.localtion.href='member_list.jsp'">
						</th>
					</tr>
				</table>
	</main>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>