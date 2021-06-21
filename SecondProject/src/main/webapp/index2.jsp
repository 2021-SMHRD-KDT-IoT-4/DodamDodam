
<%@page import="COM.Model.UserDAO"%>

<%@page import="COM.Model.FaqDTO"%>
<%@page import="COM.Model.FaqWriteDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="COM.Model.NoticeWriteDAO"%>
<%@page import="COM.Model.NoticeDTO"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
		
	%>


		<!-- Wrapper-->
			<div id="wrapper">

				<!-- Nav -->
					<nav id="nav">
						<a href="#" class="icon solid fa-home"><span>Home</span></a>
						<a href="#work" class="icon solid fa-folder"><span>Work</span></a>
						<a href="#contact" class="icon solid fa-envelope"><span>Contact</span></a>
						<a href="#contact2" class="icon brands fa-twitter"><span>Twitter</span></a>
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
												<input type="text" name="ID" placeholder="ID" />
											</div>
											<div class="col-12">
												<input type="text" name="PW" placeholder="PW" />
											</div>
											<div class="col-6 col-6-medium">
												<input type="submit" value="  �α���  " />
											</div>
												<div class="col-6 col-6-medium">
												<input type="button" value="ȸ������" onClick="window.location='#contact2'" />
										</div>
									</div>
								</form>
								</header>
							
								<header style="padding-left: 0px; padding-right: 0px;">
									<img src="images/ee.jpg" alt="" style="width: 400px;height: 400px;"/>
								</header>
								
						

									
							</article>

						<!-- Work -->
							<article id="work" class="panel">
								<header>
									<h2>My page</h2>
								</header>
								
								<section>
								
								<% 
									String id=request.getParameter("login_info");
								UserDAO Udao = new UserDAO();
								
								ArrayList<UserDTO> Ulist = Udao.getData(id);
								
								%>
								<div>
										<table border="1">
											<tr>
												<td>�̸�</td>
												<td>���̵�</td>
												<td>��й�ȣ</td>
												<td>�޴�����ȣ</td>
											</tr>
											<%
											for (int i = 0; i <Ulist.size(); i++){
											%>
											<tr align="center">
												<td><%=Ulist.get(i).getName()%></td>
												<td><%=Ulist.get(i).getId()%></td>
												<td><%=Ulist.get(i).getPw()%></td>
												<td><%=Ulist.get(i).getTel()%></td>
											</tr>
											<%
											}
											%>										
										
										</table>
									</div>
								
								</section>
							</article>

						<!-- Contact -->
							<article id="contact" class="panel">
								<header>
									<h2>FAQ</h2>
								</header>
								<form action="#" method="post">
									<%
									FaqWriteDAO dao = new FaqWriteDAO();
									ArrayList<FaqDTO> list = dao.showFaq();
									%>
									<div>
										<table border="1">
											<tr>
											
												<td>��ȣ</td>
												<td>����</td>
												<td>�۾���</td>
												<td>����</td>
												<td>�亯</td>
											</tr>
											<%
											for (int i = 0; i <list.size(); i++){
											%>
											<tr align="center">
												<td><%=list.get(i).getFaq_seq()%></td>
												<td><%=list.get(i).getFaq_title()%></td>
												<td><%=list.get(i).getFaq_writer()%></td>
												<td><%=list.get(i).getFaq_content()%></td>
												<td><%=list.get(i).getFaq_answer()%></td>
											</tr>
											<%
											}
											%>										
										
										</table>
									</div>
								</form>
							</article>




						<!-- ȸ������ -->
							<article id="contact2" class="panel">
								<header>
									<h2>ȸ������</h2>
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
												<input type="text" name="name" placeholder="�̸�" />
											</div>
												<div class="col-8">
												<input type="text" name="tel" placeholder="�ڵ���" />
											</div>
											<div class="col-12">
												<input type="submit" value="Ȯ��" onClick="window.location='#'" />
											</div>
										</div>
									</div>
								</form>
							</article>
					</div>

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