<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width", initial-scale="1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/custom.css">
	<title>개인연습 홈페이지</title>
</head>
<body onload="popup()">
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) {
	%>
	<nav class="navbar navbar-default">
		<div class ="navbar-header">
			<button type ="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">개인연습 홈페이지</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="loginform.jsp">회원가입</a></li>
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="board.jsp">게시판</a></li>
			</ul>
		</div>
	</nav>
	<%
		} else {
	%>
	<nav class="navbar navbar-default">
		<div class ="navbar-header">
			<button type ="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">개인연습 홈페이지</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="logout.jsp">로그아웃</a></li>
				<li><a href="board.jsp">게시판</a></li>
			</ul>
		</div>
	</nav>
	<%
		}
	%>
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1>사이트 소개</h1>
				<p>이 사이트는 공부목적으로 만든 JSP 웹 사이트 입니다.<br> 간단한 로직만을 사용한 기능들로 구현되어 있습니다.</p>
				<p>개발 도구 : Eclipse, MYSQL, Tomcat</p>
				<p>디자인 템플릿 : BOOTSTRAP</p>
			</div>
		</div>
	</div>
	<div class="container">
		<div id = "myCarousel" class="carousel" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active" style="text-align:center">
					<h1>간략한 기능</h1>
				</div>
				<div class="item"  style="text-align:center">
					<h1>회원가입 및 로그인</h1>
					<p>사용자의 간단한 아이디, 비밀번호, 이름, 성별, 이메일을 받아들여 DB에 저장</p>
					<h2>세션관리</h2>
					<p>회원가입을 한 아이디로 로그인 성공 후 메뉴바에 있던 회원가입 및 로그인은 사라지고 로그아웃 메뉴가 생성</p>
					<p>비로그인시 게시판 열람은 가능하나 그 외의 기능 사용 불가</p>
				</div>
				<div class="item"  style="text-align:center">
					<h1>게시판</h1>
					<p>작성 양식은 간단하게 제목 및 내용만 있으며 작성에 성공하면 DB에서 NOW로 인한 날짜 계산 및 번호 부여로</p>
					<p>번호, 제목, 내용, 작성일 4개의 값이 DB에 담김</p>
					<p>글쓰기,글수정,글삭제 기능이 있으며 수정 및 삭제는 userID,boardID가 맞지 않으면 기능이 실행되지 않음</p>
					<p>xss방어를 위한 제목 및 내용에 스크립트를 작성하여도 치환되도록 설정</p>
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
	<a href="javascript:popup()" target="_blank">팝업</a>
	<script src ="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src ="js/bootstrap.js"></script>
	<script>
		function popup(){
      	  var url="test.jsp";
     	  var option="width=500, height=300, top=200"
     	  window.open(url, "", option);
  		}
	</script>
	
</body>
</html>