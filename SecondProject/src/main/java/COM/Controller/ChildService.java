package COM.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import COM.Model.childDAO;
import COM.Model.childDTO;

@WebServlet("/ChildService")
public class ChildService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("EUC-KR");
		
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("u_id"); //session �ҷ�����(����ϱ�)

		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String age = request.getParameter("age");
		String school = request.getParameter("school");
		
		
		childDTO dto = new childDTO(id, name, age, gender, school);
		childDAO dao = new childDAO();
		
		int cnt = dao.child_insert(dto);
		
		//childDTO info = dao.child_check(dto);
		
		if(cnt > 0) {
			System.out.println("���̵�� ����!");
			
			session.setAttribute("id", id);
			//session.setAttribute("child_info", info);
			
			
		}else {
			System.out.println("���̵�� ����!");
		}
		response.sendRedirect("index2.jsp#work");
		
		//System.out.println(info);
		//System.out.println(id);
		
	}

}
