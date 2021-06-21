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


@WebServlet("/UserInfo")
public class UserInfoService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		
		UserDTO dto = new UserDTO(name, id, pw, tel);
		UserDAO dao = new UserDAO();
		UserDTO info = dao.login(dto);
		
		if(info != null) {
			System.out.println("회원 목록 성공!");
			
			HttpSession session = request.getSession();
			session.setAttribute("login_info", info);
			
		}else {
			System.out.println("회원 목록 실패!");
			
		}
		
		
	}

}
