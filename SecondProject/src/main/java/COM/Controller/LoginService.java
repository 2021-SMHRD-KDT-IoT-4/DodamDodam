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

@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		System.out.println(id);
		System.out.println(pw);
		
		UserDTO dto = new UserDTO(id, pw);
		UserDAO dao = new UserDAO();
		UserDTO info = dao.login(dto);
		
		if(info != null) {
			System.out.println("로그인 성공!");
			
			HttpSession session = request.getSession(); //session 선언
			session.setAttribute("login_info", info); //session 저장
			
			if(info.getId().equals("admin")) {
				response.sendRedirect("index2.jsp#admin_Userinfo");
			}else {
			
			response.sendRedirect("index2.jsp#mypage");
			}
		}else {
			System.out.println("로그인 실패!");
			response.sendRedirect("index2.jsp#join");
			
		}
		
		
		
	
	}

}
