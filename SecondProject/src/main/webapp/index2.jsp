
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
		
	%>



		<!-- Wrapper-->
			<div id="wrapper">

				<!-- Nav -->
				<!-- Admin!!!!!!!!!!!!!! -->
					<nav id="nav">
				<%if(info == null) {%>
						<a href="#" class="icon solid fa-home"><span>Home</span></a>
						<a href="#contact2" class="icon brands fa-twitter"><span>Twitter</span></a>
						<%}else{ %>
						<% if(info.getId().equals("admin")){%>
						
						<a href="#admin_Userinfo" class="icon solid fa-home"><span>adminUserinfo</span></a>
						<%}else{ %>		
						
						<a href="#work" class="icon solid fa-folder"><span>Work</span></a>
						<a href="#contact" class="icon solid fa-envelope"><span>Contact</span></a>
						<a href="#contact3" class="icon brands fa-twitter"><span>child</span></a>
						<% }%>
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
							
							
							<%
								UserDAO Udao = new UserDAO();
								ArrayList<UserDTO> Ulist = Udao.All_info();
							%>
							
							<!-- admin_Userinfo -->
							<article id="admin_Userinfo" class="panel">
							
								<header>
									<h2>Admin_Userinfo</h2>
								</header>
								<nav id="Update">	
						<table>
							<caption><h2>ȸ������������</h2></caption>
							
							
							<%for(int i = 0; i<Ulist.size(); i++) { %>
								<tr>
									<td><%=Ulist.get(i).getName() %></td>
									<td><%=Ulist.get(i).getId() %></td>
									<td><%=Ulist.get(i).getPw()%></td>	
									<td><%=Ulist.get(i).getTel()%></td>							
								</tr>
							<%} %>
							
							
							<!-- 2.��� ȸ���� �̸���(email),��ȭ��ȣ(tel),�ּ�(address)�� ����Ͻÿ�. -->
						</table>
					</nav>		
					<a href="index2.jsp#home" class="button next scrolly">�ǵ��ư���</a>	
								
							</article>
	
						
							
						<!-- Work -->
							<article id="work" class="panel">
								<header>
									<h2>My page</h2>
								</header>
								
								<section>
								
								<% 
							
									info = (UserDTO)session.getAttribute("login_info");
								%>
								
								<div>
										<table border="1">
											<tr>
												<td>�̸�</td>
												<td>���̵�</td>
												<td>��й�ȣ</td>
												<td>�޴�����ȣ</td>
											</tr>
											<%if(info!=null){ %>
											<tr align="center">
												<td><%=info.getName()%></td>
												<td><%=info.getId()%></td>
												<td><%=info.getPw()%></td>
												<td><%=info.getTel()%></td>
												
											</tr>
											<%} %>	
											<hr>					
										
										</table>
								</div>
								
								<header>
									<h2>Kids page</h2>
								</header>
								
								
								<div>
										<table border="1">
											<tr>
												<td>�̸�</td>
												<td>���̵�</td>
												<td>��й�ȣ</td>
												<td>�޴�����ȣ</td>
											</tr>
											<%if(info!=null){ %>
											<tr align="center">
												<td><%=info.getName()%></td>
												<td><%=info.getId()%></td>
												<td><%=info.getPw()%></td>
												<td><%=info.getTel()%></td>
											</tr>
											<%} %>	
											<hr>					
										
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
												<td><a href="viewBoard.jsp?faq_num=<%= list.get(i).getFaq_seq() %>">
												<%=list.get(i).getFaq_title()%></a>
												</td>
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
								
							<!--faq �Ѱ��� ����   -->	
								<article id="contact4" class="panel">
								<header>
									<h2>FAQ 1���� ����</h2>
								</header>
									<form action="#" method="post">
										<%
											int num = Integer.parseInt(request.getParameter("faq_num"));
											FaqWriteDAO fdao = new FaqWriteDAO();
											FaqDTO fdto = fdao.showOne(num);
										%>

										<div id="board">
											<table id="list">
												<tr>
													<td>����</td>
													<td><%=fdto.getFaq_title()%></td>
												</tr>
												<tr>
													<td>�ۼ���</td>
													<td><%=fdto.getFaq_writer()%></td>
												</tr>
												<tr>
													<td colspan="2">����</td>
												</tr>
												<tr>
													<td colspan="2"><%=fdto.getFaq_content()%></td>
												</tr>
												<tr>
													<td colspan="2"><a href="index2.jsp"><button>�ڷΰ���</button></a></td>
												</tr>
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
							
						<!-- ���̵�� -->
							<article id="contact3" class="panel">
								<header>
									<h2>���̵��</h2>
								</header>
								<form action="JoinService" method="post">
									<div>
										<div class="row">
											<div class="col-8">
												<input type="text" name="name" placeholder="�����̸�" />
											</div>
											<div class="col-8">
												����<input type="radio" name="gender" value="female" >
												����<input type="radio" name="gender" value="male" >
											</div>
											<div class="col-8">
												<input type="text" name="age" placeholder="����" />
											</div>
												<div class="col-8">
												<input type="text" name="school" placeholder="�б�" />
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