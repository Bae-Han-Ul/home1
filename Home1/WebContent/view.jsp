<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.Board"%>
<%@ page import="board.BoardDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>개인연습 홈페이지</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int boardID = 0;
		if (request.getParameter("boardID") != null) {
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		if (boardID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		}
		Board board = new BoardDAO().getBoard(boardID);
		if (userID == null) {
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">개인연습 홈페이지</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="loginform.jsp">회원가입</a></li>
				<li><a href="login.jsp">로그인</a></li>
				<li class="active"><a href="">게시판</a></li>
			</ul>
		</div>
	</nav>
	<%
		} else {
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">개인연습 홈페이지</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="logout.jsp">로그아웃</a></li>
				<li class="active"><a href="board.jsp">게시판</a></li>
			</ul>
		</div>
	</nav>
	<%
		}
	%>
	<div class="container">
		<div class="row">
			<form method="post" action="writeAction.jsp">
				<table class="table table-stcriped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3"style="background-color: #eeeeee; text-align: center;">게시판 작성 내용</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width:20%;">글 제목</td>
							<td colspan="2"><%=board.getBoardTitle().replaceAll(" ", "&nbsp;").replaceAll(">", "&gt;").replaceAll("<", "&lt;").replaceAll("\n", "<br>") %></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td colspan="2"><%=board.getUserID() %></td>
						</tr>
						<tr>
							<td>작성일</td>
							<td colspan="2"><%=board.getBoardDate().substring(0,11) %></td>
						</tr>
						<tr>
							<td>내 용</td>
							<td colspan="2" style="min-height:200px; text-align: left;"><%=board.getBoardContent().replaceAll(" ", "&nbsp;").replaceAll(">", "&gt;").replaceAll("<", "&lt;").replaceAll("\n", "<br>") %></td>
						</tr>
					</tbody>
				</table>
				<a href="board.jsp" class="btn btn-primary">목록</a>
				<%
					if(userID != null && userID.equals(board.getUserID())) {
				%>
					<a href="update.jsp?boardID=<%= boardID %>" class= "btn btn-primary">수정</a>
					<a onclick="return confirm('게시글을 삭제하시겠습니까?')"href="deleteAction.jsp?boardID=<%= boardID %>" class= "btn btn-primary">삭제</a>
				<%
					}
				%>
			</form>

		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>