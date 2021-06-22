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
	<!--게시물 한개만 보기  -->
	<article id="contact4" class="panel">
		<header>
			<h2>FAQ 1개만 보기</h2>
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
						<td colspan="2"><a href="index2.jsp"><button>뒤로가기</button></a></td>
					</tr>
				</table>
			</div>

		</form>
	</article>

</body>
</html>