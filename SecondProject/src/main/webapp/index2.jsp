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
      
      <style type="text/css">
      	#btn_logout{
      		position: absolute;
   			top: 620px;
    		left: 270px;
      	
      	}
      	#btn_delete{
      		position: absolute;
   			top: 620px;
    		left: 480px;
      	
      	}
      	#btn_drop{
      		position: absolute;
   			top: 620px;
    		left: 760px;
      	
      	}
      	
      		
html {
	font-family: "Noto Sans KR", sans-serif;
}

/* �븻������ */
body, ul, li, h1, h2, h3, h4, h5, h6 {
	margin: 0;
	padding: 0;
	list-style: none;
}

a:link {
	color: lightblue;
}

/* ���̺귯�� */
.con {
	margin: 0 auto;
}

.img-box>img {
	width: 100%;
	display: block;
}

.row::after {
	content: "";
	display: block;
	clear: both;
}

.cell {
	float: left;
	box-sizing: border-box;
}

.cell-right {
	float: right;
	box-sizing: border-box;
}

.margin-0-auto {
	margin: 0 auto;
}

.block {
	display: block;
}

.inline-block {
	display: inline-block;
}

.text-align-center {
	text-align: center;
}

.line-height-0-ch-only {
	line-height: 0;
}

.line-height-0-ch-only>* {
	line-height: normal;
}

.relative {
	position: relative;
}

.absolute-left {
	position: absolute;
	left: 0;
}

.absolute-right {
	position: absolute;
	right: 0;
}

.absolute-middle {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
}

/* Ŀ���� */
/* ������ ���̾ƿ� */
.con {
	max-width: 950px;
}

.con-min-width {
	min-width: 320px;
}

.top-menu a {
	text-decoration: none;
	color: gray;
	font-weight: bold;
	font-size: 1.2rem;
}

html, body {
	overflow-x: hidden;
}

.table-common>table {
	width: 100%;
	border-collapse: collapse;
}

.table-common .btn-box {
	text-align: center;
}

.table-common>table th, .table-common>table td {
	border: 1px solid black;
	padding: 10px;
}

.article-list table {
	border: none;
	border-top: 2px solid lightgray;
	border-bottom: 2px solid lightgray;
}

.article-list>table th, .article-list>table td {
	border: none;
}

.article-list>table td {
	border-bottom: 1px solid lightgray;
}

.article-list>table thead {
	border-bottom: 2px solid lightgray;
	background-color: #F5F5F5;
}

.article-detail {
	border: 2px solid lightgray;
}

.article-detail>table {
	border: none;
	width: calc(100% - 100px);
}

.article-detail>table th, .article-detail>table td {
	border: none;
}

.article-detail>table tr:not(:last-child) {
	border-bottom: 1px solid lightgray;
}

.article-detail>table tr:not(.article-body), .article-detail>table tr:not(.article-body)>td
	{
	height: 20px;
	font-size: 0.8rem;
}

.article-detail>table tr.article-title>td {
	height: 40px;
	font-weight: bold;
	font-size: 1.2rem;
}

.article-detail>table td:last-child {
	padding-right: 100px;
}

.article-detail>.article-writer {
	width: 100px;
	height: 102px;
	background-color: lightgray;
	border-bottom: 1px solid lightgray;
	text-align: center;
}

.article-detail>.article-writer .writer-icon {
	margin: 0 auto;
	background-color: white;
	width: 80px;
	height: 80px;
	border-radius: 50%;
}

.reply {
	margin-top: 20px;
	border: 2px solid lightgray;
	padding: 15px;
	box-sizing: border-box;
}

.reply-form {
	padding: 10px;
}

.reply-form>form input[type="text"] {
	width: 200px;
}

.reply-form>form textarea {
	width: calc(100% - 100px);
	min-height: 40px;
}

.reply-form>form input[type="submit"] {
	width: 80px;
	height: 40px;
	transform: translatey(-40%);
}

.reply-form>form>div:not(:last-child) {
	margin-bottom: 5px;
}

.reply-list>table {
	border: none;
}

.reply-list>table th {
	display: none;
}

.reply-list>table td {
	border: none;
}

.reply-list>table tr:nth-child(2n+1) {
	background-color: rgba(0, 0, 0, 0.06);
}

.reply-list>table td:first-child {
	font-weight: bold;
}

.reply-list>table td:first-child::after {
	content: " : ";
	font-weight: bold;
}

.panel{

 border-radius: 15px;


}

      </style>
      
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
                  <a href="#main" class="icon solid fa-home"><span>����</span></a>
                  <a href="#join" class="icon solid fa-user-plus"><span>ȸ������</span></a>
                  <%}else{ %>
                  <% if(info.getId().equals("admin")){%>
                  
                  <a href="#admin_Userinfo" class="icon solid fa-users-cog"><span>ȸ������</span></a>
                  <%}else{ %>      
                  
                  <a href="#mypage" class="icon Regular fa-user-circle"><span>����������</span></a>
                  <a href="#faq" class="icon Regular fa-question-circle"><span>FAQ</span></a>
                  
                  <a href="#child" class="icon solid fa-child"><span>���̵��</span></a>
                  <% }%>
                  <a href="#board" class="icon Regular fa-list-alt"><span>�Խ���</span></a>
               <%} %>
               
               
               
               </nav>
               
               
               
            
      
      
      <!-- Main -->
               <div id="main" style="border-radius : 40px">

                  <!-- Me -->
                     <article id="main" class="panel intro">
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
                                    <input type="button" value="ȸ������" onClick="window.location='#join'" />
                                    </div>
                           </div>
                        </form>
                        </header>
                     
                        <header style="padding-left: 0px; padding-right: 0px;">
                           <img src="images/ee.jpg" alt="" style="width: 400px;height: 400px;"/>
                        </header>
                        
                  

                           
                     </article>
                     
                     
                     <!-- ȸ������ -->
                     <article id="join" class="panel">
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
                                    <input type="submit" value="Ȯ��" onClick="window.location='#main'" />
                                 </div>
                              </div>
                           </div>
                        </form>
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
                     
                     
                     
                  </table>
               </nav>      
               <a href="LogoutService" class="button next scrolly">�α׾ƿ�</a>   
                        
                     </article>
   
                  
                     
                  <!-- mypage -->
                     <article id="mypage" class="panel">
                        <header>
                           <h2>My page</h2>
                        </header>
                        
                        <section>
                        
                        
                        
                        <%if(info!=null){ 
                        
                           childDAO c_dao = new childDAO();
                           ArrayList<childDTO> c_one_list = c_dao.Child_one_info(info);
                        
                        %>
                        
                        <form action="#" method="post">
					<section class="article-list table-common con">
                              <table border="1">
                                 <thead>
								<tr align="center">
									<th>�̸�</th>
									<th>���̵�</th>
									<th>��й�ȣ</th>
									<th>��ȭ��ȣ</th>
								</tr>
							</thead>
                                 <%if(info!=null){ %>
                                 <tr align="center">
                                    <td><%=info.getName()%></td>
                                    <td><%=info.getId()%></td>
                                    <td><%=info.getPw()%></td>
                                    <td><%=info.getTel()%></td>
                                    
                                 </tr>
                                 <%} %>   
                                 
                                       
                              
                              </table>
                        	</section>
						</form>
                        
                        <header>
                           <h2>Kids page</h2>
                        </header>
                        
                        <form action="#" method="post">
					<section class="article-list table-common con">
                              <table border="1">
                                <thead>
								<tr align="center">
									<th>���̵�</th>
									<th>���� �̸�</th>
									<th>���� ����</th>
									<th>���� ����</th>
									<th>���� �б�</th>
								</tr>
							</thead>
                                <%for(int i = 0; i < c_one_list.size(); i++) { %>
										<tr align="center">
													
											<td><%= c_one_list.get(i).getC_id()%></td>
											<td><%= c_one_list.get(i).getC_name()%></td>
											<td><%= c_one_list.get(i).getC_age()%></td>
											<td><%= c_one_list.get(i).getC_gender()%></td>
											<td><%= c_one_list.get(i).getC_school()%></td>
										</tr>
									<%} %> 
                                 <hr>         
                                    <form action="LogoutService">
                                    	<input type="submit" id="btn_logout" value="  �α׾ƿ�  " />
                                    </form>
                                    
                                    <form action="ChilddeleteService">
                                    	<input type="submit" id="btn_delete" value="  ���� ���� ����   " />
                                    </form>
                                    
                                    <form action="UserdeleteService">
                                    	<input type="submit" id="btn_drop" value="  ȸ�� Ż��   " />
                                    </form>
                              
                              </table>
                        
                        </section>
                     </article>





			<!-- FAQ -->
			<%
			FaqWriteDAO dao = new FaqWriteDAO();
			ArrayList<FaqDTO> list = dao.showFaq();
			%>
			<article id="faq" class="panel">
				<header>
					<h2>FAQ</h2>
				</header>
				<form action="#" method="post">
					<section class="article-list table-common con">
						<table border="1">
							<thead>
								<tr align="center">
									<th>��ȣ</th>
									<th>����</th>
									<th>�۾���</th>
									<th>����</th>
									<th>��¥</th>
								</tr>
							</thead>
							<tbody>
							<%
							for (int i = 0; i < list.size(); i++) {
							%>
							<tr align="center">
								<td><%=list.get(i).getFaq_seq()%></td>

								<td><a
									href="viewFaq.jsp?faq_seq=<%=list.get(i).getFaq_seq()%>"> <%=list.get(i).getFaq_title()%></a>
								</td>
								<td><%=list.get(i).getFaq_writer()%></td>
								<td><%=list.get(i).getFaq_content()%></td>
								<td><%=list.get(i).getFaq_answer()%></td>
							</tr>
							<%
							}
							%>
							</tbody>
						</table>
					</section>
				</form>
			</article>


			<!-- FAQ content-->
                     <!--faq �Ѱ��� ����   -->   
                        <article id="FAQ" class="panel">
                        <header>
                           <h2>FAQ 1���� ����</h2>
                        </header>
                   
                              <%
                                                 FaqWriteDAO fdao = new FaqWriteDAO();
                                                 FaqDTO fdto = fdao.showOne(5);
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
                                       <td colspan="2"><a href="index2.jsp#mypage"><button>�ڷΰ���</button></a></td>
                                    </tr>
                                 </table>
                              </div>
                              

                     </article>
                     
                     
                        
                     
                  <!-- ���̵�� -->
					<article id="child" class="panel">

						<header>
							<h3>���̵��</h3>
						</header>
								
						<form action="ChildService" method="post">
								
						<div>
							<%if(info != null) {%>
							<h2><%= info.getId() %></h2>
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
										<input type="submit" value="Ȯ��"  />
									</div>
								</div>
								
								<% session.setAttribute("u_id", info.getId()); %>
							<%} %>
						</div>
						</form>
					</article>

                  <%
                     NoticeWriteDAO Noticedao = new NoticeWriteDAO();
                     ArrayList<NoticeDTO> Nlist = Noticedao.showBoard();
                  %>

                     <article id="board" class="panel">
                     <header>
                        <h2>Notice</h2>
                           <a href="insertBoard.jsp">�� �ۼ�</a>
                     </header>
                     <form action="#" method="post">
         
            <section class="article-list table-common con">
               <table border="1">
                  <thead>
                     <tr align="center">
                        <th>��ȣ</th>
                        <th>����</th>
                        <th>�۾���</th>
                        <th>����</th>
                        <th>��¥</th>
                     </tr>
                  </thead>
                  <tbody>
                     <%
                     for (int i = 0; i < Nlist.size(); i++) {
                     %>
                     <tr align="center">
                        <td><%=Nlist.get(i).getNotice_seq()%></td>
                        <td><a
                           href="detailsBoard.jsp?notice_seq=<%=Nlist.get(i).getNotice_seq()%>">
                              <%=Nlist.get(i).getNotice_title()%></a></td>
                        <td><%=Nlist.get(i).getNotice_writer()%></td>
                        <td><%=Nlist.get(i).getNotice_content()%></td>
                        <td><%=Nlist.get(i).getNotice_day()%></td>

                     </tr>
                     <%
                     }}
                     %>
                  </tbody>
               </table>
            </section>
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