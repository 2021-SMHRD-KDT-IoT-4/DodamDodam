package COM.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import COM.Model.UserDAO;
import COM.Model.UserDTO;

@WebServlet("/UserdeleteService")
public class UserdeleteService extends HttpServlet {
	

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
//		String id = request.getParameter("id");
		
		HttpSession session = request.getSession(); 
		
		UserDTO result = (UserDTO) session.getAttribute("login_info");
		String id = result.getId();
		
		UserDTO dto = new UserDTO(id);
		UserDAO dao = new UserDAO();
		int cnt = dao.userdelete(dto);
		
		session.removeAttribute("login_info");
	
		if(cnt > 0) {
			response.sendRedirect("index2.jsp#main");
			System.out.println("È¸¿øÅ»Åğ ¼º°ø");
		}else {
			response.sendRedirect("index2.jsp#mypage");
			System.out.println("È¸¿øÅ»Åğ ½ÇÆĞ");
		}
	
		
	}

}
