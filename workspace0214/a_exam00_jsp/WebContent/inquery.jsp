<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/db.jsp" %>
<%
	String sql="select max(custno)+1 from member_tbl_02";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs=pstmt.executeQuery();
	rs.next();
	int num=rs.getInt(1);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쇼핑몰 회원관리</title>
	<link rel="stylesheet" href="css/style.css">
	<script type="text/javascript">
		function CV() {
			var cv=document.data;
			if(!cv.custno.value){
				alert("회원번호를 입력하세요.")
				cv.custno.focus();
				return false;
			}
		}
	</script>
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
			<form name="data" action="input.jsp" method="post" onsubmit="return CV()">
				<table class="table_line">
					<tr>
						<th>회원번호입력</th>
						<td><input type="text" name="custno" size="10" autofocus></td>						
					</tr>	
					<tr>
						<th colspan="2">
							<input type="submit" value="등록">
							<input type="button" value="취소" onclick="parent.location.href='inquery.jsp'">
							<input type="button" value="회원목록조회/수정" onclick="parent.location.href='member_list.jsp'">
						</th>
					</tr>			
				</table>
			</form>
	</main>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>