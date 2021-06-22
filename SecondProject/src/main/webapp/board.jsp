<%@page import="java.util.ArrayList"%>
<%@page import="COM.Model.NoticeDTO"%>
<%@page import="COM.Model.NoticeWriteDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<header class="top-menu con row">
		<div class="cell-right">
			<a href="#">�α���</a> <a href="#">ȸ������</a> <a href="#">�� ���</a> <a
				href="#">�� �ۼ�</a>
		</div>
		<style>
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
</style>
	</header>
	<%
	NoticeWriteDAO dao = new NoticeWriteDAO();
	ArrayList<NoticeDTO> Nlist = dao.showBoard();	
	%>

	<h1 class="con">�Խñ� ���</h1>
	<section class="article-list table-common con">
		<table border="1">
			<thead>
				<tr>
					<th>����1</th>
					<th>����2</th>
					<th>����3</th>
					<th>����4</th>
					<th>����5</th>
				</tr>
			</thead>
			<tbody>
				<%for(int i = 0; i<Nlist.size(); i++) { %>
				<tr>
					<td><%=Nlist.get(i).getNotice_seq() %></td>
					<td><a href="board.jsp?notice_seq=<%=Nlist.get(i).getNotice_seq() %>>">
					<%=Nlist.get(i).getNotice_title() %></a></td>
					<td><%=Nlist.get(i).getNotice_writer() %></td>
					<td><%=Nlist.get(i).getNotice_content() %></td>
					<td><%=Nlist.get(i).getNotice_day() %></td>
				</tr>
				<%} %>
			</tbody>
		</table>
	</section>

	<h1 class="con">�Խñ� ��</h1>
	<section class="article-detail table-common con row">
		<div class="article-writer cell">
			<div class="writer-icon">�̹���</div>
			<span>�ۼ���</span>
		</div>
		<table class="cell" border="1">
			<colgroup>
				<col width="100px">
			</colgroup>
			<tbody>
				<tr class="article-title">
					<th>[��ȣ]����</th>
					<td colspan="3">����2_2</td>
				</tr>
				<tr class="article-info">
					<th>��¥</th>
					<td>����3_2</td>
					<th>��ȸ��</th>
					<td>����4_2</td>
				</tr>
				<tr class="article-body">
					<td colspan="4">Lorem ipsum, dolor sit amet consectetur
						adipisicing elit. Sunt deleniti repellat aliquam quis labore est
						error iste obcaecati laborum illo? Distinctio dolorem quis at
						assumenda! Perferendis, libero earum! Ducimus, ratione!</td>
				</tr>
			</tbody>
		</table>
	</section>

	<div class="con reply">
		<h1 class="">��� �Է�</h1>
		<section class="reply-form">
			<form action="return false;">
				<div>
					<input type="text">
				</div>
				<div>
					<textarea></textarea>
					<input type="submit">
				</div>
			</form>
		</section>

		<h1 class="">��� ���</h1>
		<section class="reply-list table-common">
			<table border="1">
				<colgroup>
					<col width="100px">
				</colgroup>
				<thead>
					<tr>
						<th>����1</th>
						<th>����2</th>
						<th>����3</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>����1</td>
						<td>����2</td>
						<td>����3</td>
					</tr>
					<tr>
						<td>����1</td>
						<td>����2</td>
						<td>����3</td>
					</tr>
					<tr>
						<td>����1</td>
						<td>����2</td>
						<td>����3</td>
					</tr>
					<tr>
						<td>����1</td>
						<td>����2</td>
						<td>����3</td>
					</tr>
					<tr>
						<td>����1</td>
						<td>����2</td>
						<td>����3</td>
					</tr>
				</tbody>
			</table>
		</section>
	</div>

	<footer></footer>

</body>
</html>