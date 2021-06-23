package COM.Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import COM.Model.FaqDTO;
import COM.Model.FaqWriteDAO;
@WebServlet("/FaqService")
public class FaqService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	request.setCharacterEncoding("EUC-KR");
	
	String seq = request.getParameter("faq_seq");
	String title = request.getParameter("faq_title");
	String writer = request.getParameter("faq_writer");
	String content = request.getParameter("faq_content");
	String answer = request.getParameter("faq_answer");
	
	
	request.setAttribute("seq", seq);
	request.setAttribute("title", title);
	request.setAttribute("writer", writer);
	request.setAttribute("content", content);
	request.setAttribute("answer", answer);
	
	
	
	FaqDTO dto = new FaqDTO(0, title, writer, content, answer);
	
	FaqWriteDAO dao = new FaqWriteDAO();
	ArrayList<FaqDTO> FaqDTO = dao.showFaq();
	int cnt = dao.upload(dto);
	FaqDTO Fdto = dao.showOne(cnt);

	
	
	
	}

}
