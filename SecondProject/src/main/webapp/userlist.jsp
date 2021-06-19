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
	ArrayList<UserDTO> list = dao.select();
	%>

<div align="center">
	<table border="1" >
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
</body>
</html>