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
                  <a href="#main" class="icon solid fa-home"><span>메인</span></a>
                  <a href="#join" class="icon solid fa-user-plus"><span>회원가입</span></a>
                  <%}else{ %>
                  <% if(info.getId().equals("admin")){%>
                  
                  <a href="#admin_Userinfo" class="icon solid fa-users-cog"><span>회원정보</span></a>
                  <%}else{ %>      
                  
                  <a href="#mypage" class="icon Regular fa-user-circle"><span>마이페이지</span></a>
                  <a href="#faq" class="icon Regular fa-question-circle"><span>FAQ</span></a>
                  
                  <a href="#child" class="icon solid fa-child"><span>아이등록</span></a>
                  <% }%>
                  <a href="#board" class="icon Regular fa-list-alt"><span>게시판</span></a>
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
                                    <input type="submit" value="  로그인  " />
                                 </div>
                        
                                    <div class="col-6 col-6-medium">
                                    <input type="button" value="회원가입" onClick="window.location='#join'" />
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
                                    <input type="submit" value="확인" onClick="window.location='#main'" />
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
                     <caption><h2>회원관리페이지</h2></caption>
                     
                     
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
               <a href="LogoutService" class="button next scrolly">로그아웃</a>   
                        
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
                                    <td>이름</td>
                                    <td>아이디</td>
                                    <td>비밀번호</td>
                                    <td>휴대폰번호</td>
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
                                    <td>아이이름</td>
                                    <td>나이</td>
                                    <td>성별</td>
                                    <td>학교</td>
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
                                    	<input type="submit" id="btn_logout" value="  로그아웃  " />
                                    </form>
                                    
                                    <form action="ChilddeleteService">
                                    	<input type="submit" id="btn_delete" value="  아이 정보 삭제   " />
                                    </form>
                                    
                                    <form action="UserdeleteService">
                                    	<input type="submit" id="btn_drop" value="  회원 탈퇴   " />
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
                                 <tr align="center">
                                 
                                    <td>번호</td>
                                    <td>제목</td>
                                    <td>글쓴이</td>
                                    <td>내용</td>
                                    <td>날짜</td>
                                 </tr>
                                 <%
                                 for (int i = 0; i <list.size(); i++){
                                 %>
                                 <tr align="center">
                                    <td><%=list.get(i).getFaq_seq()%></td>
                                    <td><a href="viewFaq.jsp?faq_num=<%=list.get(i).getFaq_seq()%>#faqa">
                                    
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
                     
                     
                     <!-- FAQ content-->
                     <!--faq 한개만 보기   -->   
                        <article id="FAQ" class="panel">
                        <header>
                           <h2>FAQ 1개만 보기</h2>
                        </header>
                   
                              <%
                           
                                 FaqWriteDAO fdao = new FaqWriteDAO();
                                 FaqDTO fdto = fdao.showOne(5);
                              %>

							<div id="">
                                 <table id="list">
                                    <tr>
                                       <td>제목</td>
                                       <td><%=fdto.getFaq_title()%></td>
                                    </tr>
                                    <tr>
                                       <td>작성자</td>
                                       <td><%=fdto.getFaq_writer()%></td>
                                    </tr>
                                    <tr>
                                       <td colspan="2">내용</td>
                                    </tr>
                                    <tr>
                                       <td colspan="2"><%=fdto.getFaq_content()%></td>
                                    </tr>
                                    <tr>
                                       <td colspan="2"><a href="index2.jsp#mypage"><button>뒤로가기</button></a></td>
                                    </tr>
                                 </table>
                              </div>
                              

                     </article>
                     
                     
                        
                     
                  <!-- 아이등록 -->
					<article id="child" class="panel">

						<header>
							<h3>아이등록</h3>
						</header>
								
						<form action="ChildService" method="post">
								
						<div>
							<%if(info != null) {%>
							<h2><%= info.getId() %></h2>
								<div class="row">
									<div class="col-8">
										<input type="text" name="name" placeholder="아이이름" />
									</div>
									
									<div class="col-8">
										여자<input type="radio" name="gender" value="female" >
										남자<input type="radio" name="gender" value="male" >
									</div>
									
									<div class="col-8">
										<input type="text" name="age" placeholder="나이" />
									</div>
									
									<div class="col-8">
										<input type="text" name="school" placeholder="학교" />
									</div>
									
									<div class="col-12">
										<input type="submit" value="확인"  />
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
                           <a href="insertBoard.jsp">글 작성</a>
                     </header>
                     <form action="#" method="post">






            <section class="article-list table-common con">
               <table border="1">
                  <thead>
                     <tr align="center">
                        <th>번호</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>내용</th>
                        <th>날짜</th>
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