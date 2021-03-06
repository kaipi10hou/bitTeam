<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>알파카 - 헌 책 알고 팔자! 중고책거래 사이트</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon"
	href="${contextPath}/resources/images/favicon.ico" />
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="${contextPath}/resources/css/animate.css">

<link rel="stylesheet"
	href="${contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/magnific-popup.css">

<link rel="stylesheet"
	href="${contextPath}/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/jquery.timepicker.css">

<link rel="stylesheet" href="${contextPath}/resources/css/flaticon.css">
<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
<style type="text/css">
.form-group {
	text-align: center;
}

.center {
	text-align: center;
}

.kakao {
	text-align: center;
	background: #FEE500;
	padding: 6px 1px 10px 1px;
	border-radius: 20px;
	margin: -20px 9px 50px 9px;
}


#function {
	text-align: center;
}

#login {
	text-align: center;
	padding: 20px 0 15px 0px;
	border-radius: 20px;
	margin: -23px 0 5px 0px;
}
.index_box{
	padding : 0;
}
</style>

</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="${contextPath}/index.do"
				style="background-image: url('${contextPath}/resources/images/logo.png');"><span
				class="navbar-brandsp"></span></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="${contextPath}/index.do"
						class="nav-link">Home</a></li>
					<li class="nav-item"><a
						href="${contextPath}/board/listArticles.do" class="nav-link">책거래</a></li>
					<li class="nav-item"><a
						href="${contextPath}/around/aroundMap.do" class="nav-link">주변거래</a></li>
					<li class="nav-item"><a href="${contextPath}/chat/login.do"
						class="nav-link">채팅하기</a></li>
					<li class="nav-item"><a
						href="${contextPath}/community/listCommunity.do" class="nav-link">커뮤니티</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<div class="hero-wrap js-fullheight"
		style="background-image: url('${contextPath}/resources/images/bg_1.png');">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-center"
				data-scrollax-parent="true">
				<div class="col-md-7 ftco-animate">
					<p class="caps">
						먼지 쌓인 책들을 그냥 버린다고?<br>헌 책 주면 새 돈으로 받는 믿을 수 있는 중고 책 거래 사이트
					</p>
					<h1 class="mb-4">
						<span class="maintitle">책도 알고 팔자 <br>알파카
						</span>
					</h1>
					<p class="mb-0">
						<a href="board/listArticles.do" class="main_btn btn btn-primary">책
							구매</a> 	<a href="javascript:fn_articleForm('${isLogOn}','${contextPath}/board/articleForm.do', 
		                                                    '${contextPath}/index.do')" class="btn btn-white">책 판매</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<!-- 카카오 로그인 됐을 때 창 -->
	<c:choose>
		<c:when test="${kakaoID ne null}">
			<section id="loginbox_kakao" class="ftco-section ftco-no-pb ftco-no-pt">
				<div class="container">
					<div class="row">
						<div class="col-md-7"></div>
						<div class="col-md-5 order-md-last">
							<div class="login-wrap p-4 p-md-5">
								<div class="bg-color-box" style="background-image:url('${profileImage}')"></div>
								<!--                        추가                           -->
								<h3 class="form-group">Welcome to <span>Alpaca!</span></h3>
								<!--  ------------------------------------------- -->
								<div class="form-group l_imgbox">
										<!--  <img src="${contextPath}/resources/images/_profile_alpaca.png" width="250px" height="250px" style="border-radius:250px">-->
								</div>
								<form class="signup-form">
									<div class="form-group member-id">
										<span>${nickname} </span> 님
										
									</div>
									<p class="point">카카오 회원<span> 0p</span></p>
									<div id="logout">
									<a
										href="https://kauth.kakao.com/oauth/logout?client_id=4d6c516eb262829dabdcac45cae9703c&logout_redirect_uri=http://localhost:8090/alpaca/logout">
										<input
										type="button" class="logout_btn btn btn-outline-primary" value="로그아웃"></a>
									</div>
								</form>
								<!--  
								<div id="function">
									<button type="button" class="gray_p"
										onclick="location.href='memberUpdateView'">회원 정보 수정</button>
									<button type="button" class="gray_p gray_p2"
										onclick="location.href='${contextPath}/around/aroundMap.do'">&nbsp; | &nbsp;주변 거래</button>	
								</div>
								-->
							</div>
						</div>
					</div>
				</div>
			</section>
		</c:when>

		<c:when test="${member.id ne null}">
		<!-- 일반 로그인 -->
			<section id="loginbox_after" class="ftco-section ftco-no-pb ftco-no-pt">
				<div class="container">
					<div class="row">
						<div class="col-md-7"></div>
						<div class="col-md-5 order-md-last">
							<div class="login-wrap p-4 p-md-5">
								<div class="bg-color-box"></div>
								<h3 class="form-group">
									Welcome to <span>Alpaca!</span>
								</h3>
								<div class="form-group l_imgbox">
									<img src="resources/images/profile_alpaca.png" /><br>
								</div>
								<form class="signup-form">
									<div class="form-group member-id">
										<span>${member.name} </span> 님
									</div>
									<p class="point">일반 회원<span> 0p</span></p>
									<div id="logout">
									<button type="button" class="logout_btn btn btn-outline-primary"
										onclick="location.href='logout'">로그아웃</button>
									</div>
								</form>
								<div id="function">
									<button type="button" class="gray_p"
										onclick="location.href='memberUpdateView'">회원 정보 수정</button>
									<button type="button" class="gray_p gray_p2"
										onclick="location.href='${contextPath}/around/aroundMap.do'">&nbsp; | &nbsp;주변 거래</button>	
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</c:when>


		<c:otherwise>
			<!-- 로그인 전 -->
			<section id="loginbox_before" class="ftco-section ftco-no-pb ftco-no-pt">
				<div class="container">
					<div class="row">
						<div class="col-md-7"></div>
						<div class="col-md-5 order-md-last">
							<div class="login-wrap p-4 p-md-5">
								<h3 class="mb-4" >Sign in to Alpaca</h3>
								<form action="${contextPath}/member/login.do"
									class="signup-form" method="post">
									<div class="form-group">
										<label class="label" for="id">ID</label> <input type="text"
											class="form-control" name="id">
									</div>
									<div class="form-group">
										<label class="label" for="pwd">Password</label> <input
											id="password-field" type="password" class="form-control"
											name="pwd">
									</div>
									<c:if test="${result == 'loginFailed' }">
										<div class="alert alert-danger" id="alert-danger">아이디 또는
											비밀번호를 확인해주세요</div>
									</c:if>

										<div class="form-group d-flex justify-content-end mt-4" id="index_box">
											<button type="submit" id="login"
												class="btn btn-primary submit btn-primary_submit">
												로그인<span class="fa fa-paper-plane"></span>
											</button>
										</div>
								</form>

								<c:if test="${kakaoID eq null}">
									<a
										href="https://kauth.kakao.com/oauth/authorize?client_id=4d6c516eb262829dabdcac45cae9703c&redirect_uri=http://localhost:8090/alpaca/login&response_type=code">
										<div class="kakao">
											<img src="resources/images/kakao_login.png">
										</div>
									</a>
								</c:if>


								<p class="text-center">
									아직 회원이 아니신가요? <a href="signUp.do">회원가입</a>
								</p>

								<c:if test="${kakaoID ne null}">
									<a
										href="https://kauth.kakao.com/oauth/logout?client_id=4d6c516eb262829dabdcac45cae9703c&logout_redirect_uri=http://localhost:8090/alpaca/logout"><input
										type="button" value="로그아웃"
										onclick="location.href='${contextPath}/logout'"></a>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</section>
		</c:otherwise>
	</c:choose>

	<!---->

	<footer class="ftco-footer ftco-no-pt">
		<div class="container">

			<div class="row">
				<div class="col-md-12 text-center">
					<p>
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved by Alpaca
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
         <circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
         <circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>
	<script>
		function fn_articleForm(isLogOn, articleForm, loginForm) {
			if (isLogOn != '' && isLogOn != 'false') {
				location.href = articleForm;
			} else {
				alert("로그인 후 글쓰기가 가능합니다.")
				location.href = loginForm + '?action=/board/articleForm.do';
			}
		}
	</script>
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="resources/js/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.easing.1.3.js"></script>
	<script src="resources/js/jquery.waypoints.min.js"></script>
	<script src="resources/js/jquery.stellar.min.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/js/jquery.animateNumber.min.js"></script>
	<script src="resources/js/bootstrap-datepicker.js"></script>
	<script src="resources/js/scrollax.min.js"></script>
	<script
		src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=c8f1e98d3b42f208e812d6c641c3952e"></script>
	<script src="resources/js/kakao-map.js"></script>
	<script src="resources/js/main.js"></script>
</body>
</html>