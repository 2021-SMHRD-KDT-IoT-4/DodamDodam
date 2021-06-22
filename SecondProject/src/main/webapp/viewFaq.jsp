
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
							<a href="#board" class="icon brands fa-twitter"><span>�Խ���</span></a>
					<%} %>
					
					
					
					</nav>
					<div id="main">
					
				<!--faq �Ѱ��� ����   -->   
                        <article id="" class="panel">
                        <header>
                           <h2>FAQ 1���� ����</h2>
                        </header>
                           <form action="" method="post">
                              <%
                                 int num = Integer.parseInt(request.getParameter("faq_num"));
                                 FaqWriteDAO fdao = new FaqWriteDAO();
                                 FaqDTO fdto = fdao.showOne(num);
                              %>

                              <div id="">
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
                                       <td colspan="2"><a href="index2.jsp#work"><button>�ڷΰ���</button></a></td>
                                    </tr>
                                 </table>
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
			</div>
			

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>