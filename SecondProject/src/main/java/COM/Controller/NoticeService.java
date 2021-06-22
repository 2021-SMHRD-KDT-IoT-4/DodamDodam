package COM.Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import COM.Model.NoticeDTO;
import COM.Model.NoticeWriteDAO;

@WebServlet("/NoticeService")
public class NoticeService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		

		
		request.setCharacterEncoding("EUC-KR");
		String title = request.getParameter("Notice_title");
		String writer = request.getParameter("notice_writer");
		String content = request.getParameter("notice_content");
		String day = request.getParameter("notice_day");
		
		request.setAttribute("title", title);
		request.setAttribute("writer", writer);
		request.setAttribute("content", content);
		request.setAttribute("day", day);

		
		NoticeDTO dto = new NoticeDTO(0, title, writer, content, day);
		
		NoticeWriteDAO dao = new NoticeWriteDAO();
		ArrayList<NoticeDTO> NoticeDTO = dao.showBoard();
		int cnt = dao.upload(dto);
		NoticeDTO Ndto = dao.showOne(cnt);
		

	}

}
