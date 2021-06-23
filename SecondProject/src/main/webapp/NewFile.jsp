
<%@page import="COM.Model.childDAO"%>
<%@page import="COM.Model.childDTO"%>
<%@page import="COM.Model.UserDAO"%>

<%@page import="COM.Model.FaqDTO"%>
<%@page import="COM.Model.FaqWriteDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="COM.Model.NoticeWriteDAO"%>
<%@page import="COM.Model.NoticeDTO"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import = "COM.Model.UserDTO"%>  
<%@page import = "java.util.*" %>  


<!DOCTYPE HTML>
<!--
	Astral by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->

<html>
	<head>
		<title>Astral by HTML5 UP</title>
		<meta charset="EUC-KR" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">
	
		<%
			UserDTO info = (UserDTO)session.getAttribute("login_info");
			//UserDTO u_id = (UserDTO)session.getAttribute("user_id");
		
		%>



		<!-- Wrapper-->
			<div id="wrapper">

				<!-- Nav -->
				<!-- Admin!!!!!!!!!!!!!! -->
					<nav id="nav">
				<%if(info == null) {%>
						<a href="#" class="icon solid fa-home"><span>Home</span></a>
						
						<a href="#join" class="icon brands fa-twitter"><span>Join</span></a>
				<%}else{ %>
						<% if(info.getId().equals("admin")){%>
						
						<a href="#admin_Userinfo" class="icon solid fa-home"><span>adminUserinfo</span></a>
						<%}else{ %>		
						
						<a href="#work" class="icon solid fa-folder"><span>Work</span></a>
						<a href="#contact" class="icon solid fa-envelope"><span>Contact</span></a>
						<a href="#contact3" class="icon brands fa-twitter"><span>child</span></a>
						<% }%>
						<a href="#board" class="icon brands fa-twitter"><span>게시판</span></a>
				<%} %>
					
					</nav>
					
					
				
		
		
		<!-- Main -->
			<div id="main">

				<!-- Me -->
					<article id="home" class="panel intro">
						<header>
							<form action="LoginService" method="post">
								<div>
									<div class="row">
										<div class="col-12">
											<input type="text" name="id" placeholder="ID" />
										</div>
										
										<div class="col-12">
											<input type="text" name="pw" placeholder="PW" />
										</div>
										
										<div class="col-6 col-6-medium">
											<input type="submit" value="  로그인  " />
										</div>
								
										<div class="col-6 col-6-medium">
											<input type="button" value="회원가입" onClick="window.location='#join'" />
										</div>
									</div>
								</div>
							</form>
						</header>
							
						<header style="padding-left: 0px; padding-right: 0px;">
							<img src="images/ee.jpg" alt="" style="width: 400px;height: 400px;"/>
						</header>
					</article>
							
							
							
				<!-- 회원가입 -->
					<article id="join" class="panel">
						<header>
							<h2>회원가입</h2>
						</header>
							<form action="JoinService" method="post">
								<div>
									<div class="row">
										<div class="col-8">
											<input type="text" name="id" placeholder="ID" />
										</div>
										
										<div class="col-8">
											<input type="text" name="pw" placeholder="PW" />
										</div>
										
										<div class="col-8">
											<input type="text" name="name" placeholder="이름" />
										</div>
										
										<div class="col-8">
											<input type="text" name="tel" placeholder="핸드폰" />
										</div>
										
										<div class="col-12">
											<input type="submit" value="확인" onClick="window.location='#'" />
										</div>
									</div>
								</div>
							</form>
					</article>
							
							
							
			
	
						
				
				<!-- Footer -->

					<div id="footer">
						<ul class="copyright">
							<li>&copy; Untitled.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
						</ul>
					</div>

			</div>
			

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>