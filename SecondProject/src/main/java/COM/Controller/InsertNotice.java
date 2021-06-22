package COM.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import COM.Model.NoticeDTO;
import COM.Model.NoticeWriteDAO;

@WebServlet("/InsertNotice")
public class InsertNotice extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("EUC-KR");
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		System.out.println(title);
		System.out.println(writer);
		System.out.println(content);
		
		// 3���� DB�� �ִ� �ڵ�
		NoticeDTO dto = new NoticeDTO(title, writer, content);
		NoticeWriteDAO dao = new NoticeWriteDAO();
		int cnt = dao.upload(dto);
		if(cnt>0) {
			response.sendRedirect("index2.jsp#board");
		}else {
			response.sendRedirect("insertBoard.jsp");
		}
		
		// int cnt ���� �Ŀ� cnt�� > 0 
		// ����ִ� �������� �̵�
		
		// cnt 0, -1 -> �ٽ� �� �ۼ��ϰ� �̵�
	
	
	}

}
