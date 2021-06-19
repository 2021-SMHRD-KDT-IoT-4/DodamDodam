<%@page import="COM.Model.childDTO"%>
<%@page import="COM.Model.childDAO"%>
<%@page import="COM.Model.UserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="COM.Model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	UserDAO dao = new UserDAO();
	ArrayList<UserDTO> list = dao.All_info();

	childDAO c_dao = new childDAO();
	ArrayList<childDTO> c_list = c_dao.All_Child_info();
	%>

	<div align="center">
		<table border="1">
			<tr>
				<td>이름</td>
				<td>아이디</td>
				<td>비밀번호</td>
				<td>연락처</td>

			</tr>
			<%
			for (int i = 0; i < list.size(); i++) {
			%>
			<tr align="center">
				<td><%=list.get(i).getName()%></td>
				<td><%=list.get(i).getId()%></td>
				<td><%=list.get(i).getTel()%></td>
				<td><%=list.get(i).getTel()%></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
	<br>
	<div align="center">
	<table border="1">
		<tr align="center">
			<td>아이이름</td>
			<td>아이나이</td>
			<td>성별</td>
			<td>아이학교</td>
		</tr>
		<%
		for (int i = 0; i < c_list.size(); i++) {
		%>
		<tr align="center">
			<td><%=c_list.get(i).getC_name()%></td>
			<td><%=c_list.get(i).getC_age()%></td>
			<td><%=c_list.get(i).getC_gender()%></td>
			<td><%=c_list.get(i).getC_school()%></td>
		</tr>
		<%
		}
		%>

	</table>
</div>
</body>
</html>