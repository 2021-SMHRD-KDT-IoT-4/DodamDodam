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
               <div id="main">

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
                        
                        
                        <div>
                              <table border="1">
                                 <tr align="center">
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
                                 
                                       
                              
                              </table>
                        </div>
                        
                        
                        <header>
                           <h2>Kids page</h2>
                        </header>
                        <div>
                        
                        
                              <table border="1">
                                 <tr align="center">
                                    
                                    <td>ID</td>
                                    <td>�����̸�</td>
                                    <td>����</td>
                                    <td>����</td>
                                    <td>�б�</td>
                                 </tr>
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
                                    	<input type="submit" style="float:right;" value="  �α׾ƿ�  " />
                                    </form>
                                    
                                    <form action="ChilddeleteService">
                                    	<input type="submit" style="float:right;" value="  ���� ���� ����   " />
                                    </form>
                                    
                                    <form action="UserdeleteService">
                                    	<input type="submit" style="float:right;" value="  ȸ�� Ż��   " />
                                    </form>
                                  

                                

                              
                              </table>
                        </div>
                        
                        </section>
                     </article>
                     
                     
                     
                     

                  <!-- FAQ -->
                     <article id="faq" class="panel">
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
                                    <td>��¥</td>
                                 </tr>
                                 <%
                                 for (int i = 0; i <list.size(); i++){
                                 %>
                                 <tr align="center">
                                    <td><%=list.get(i).getFaq_seq()%></td>
                                    <td><a href="viewFaq.jsp?faq_seq=<%=list.get(i).getFaq_seq()%>">
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
                     //System.out.print(Nlist.size());
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
                     <tr>
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
                     <tr>
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