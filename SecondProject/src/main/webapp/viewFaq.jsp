<%@page import="COM.Model.FaqDTO"%>
<%@page import="COM.Model.FaqWriteDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!--�Խù� �Ѱ��� ����  -->
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

</body>
</html>