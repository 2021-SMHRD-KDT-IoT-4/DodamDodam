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

@WebServlet("/JoinService")
public class JoinService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		
		UserDTO dto = new UserDTO(name, id, pw, tel);
		
		UserDAO dao = new UserDAO();
		
		int cnt = dao.join(dto);
		
		
		if(cnt > 0) {
			System.out.println("회원가입 성공!");
			
			HttpSession session = request.getSession();	
			session.setAttribute("id", id);
			
			response.sendRedirect("login.jsp");
			
		}else {
			System.out.println("회원가입 실패!");
			response.sendRedirect("main.jsp");
		}
		
		
		
	}

}
