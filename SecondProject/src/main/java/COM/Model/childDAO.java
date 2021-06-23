package COM.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;



public class childDAO {
	childDTO info = null;
	ArrayList<childDTO> c_list = null;
	ArrayList<childDTO> c_one_list = null;
	childDTO c_dto = null;
	
	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
	
	public void conn() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String db_url = "jdbc:oracle:thin:@192.168.0.77:1521:xe";
			String db_id = "secondProject";
			String db_pw = "1234";

			conn = DriverManager.getConnection(db_url, db_id, db_pw);

		} catch (Exception e) {

			e.printStackTrace();
		}

	}

	public void close() {

		try {
			if (rs != null) {
				rs.close();
			}

			if (psmt != null) {

				psmt.close();
			}

			if (conn != null) {

				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
	public ArrayList<childDTO> All_Child_info() {

		c_list = new ArrayList<childDTO>();
		conn();

		try {
			String sql = "select * from child";

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {

				String c_name = rs.getString(1);
				String c_age = rs.getString(2);
				String c_gender = rs.getString(3);
				String c_school = rs.getString(4);
				info = new childDTO(c_name, c_age, c_gender,c_school);
				c_list.add(info);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close();
		}
		return c_list;
	}
	
	
	public int child_insert(childDTO dto) {
		
		conn();
		
		String sql = "insert into child values(?, ?, ?, ?, ?)";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getC_id());
			psmt.setString(2, dto.getC_name());
			psmt.setString(3, dto.getC_age());
			psmt.setString(4, dto.getC_gender());
			psmt.setString(5, dto.getC_school());
			
			cnt = psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
			
		}
		
		return cnt;
		
		
	}
	

public childDTO child_check(childDTO dto) {
		
		conn();
		
		String sql = "select * from child where users_id = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getC_name());
			
			//select : executeQuery(ResultSet형태로 반환)
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				String child_name = rs.getString(1);
				String child_age = rs.getString(2);
				String child_gender = rs.getString(3);
				String child_school = rs.getString(4);
				
				info = new childDTO(child_name, child_age, child_gender, child_school);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			close();
		}
		
		return info;
	}



	public ArrayList<childDTO> Child_one_info(UserDTO dto) {

		c_one_list = new ArrayList<childDTO>();
		
		
		
		conn();

		try {
			String sql = "select * from child where users_id = ?";

			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getId());

			rs = psmt.executeQuery();

			while (rs.next()) {
				String user_id = rs.getString(1);
				String c_name = rs.getString(2);
				String c_age = rs.getString(3);
				String c_gender = rs.getString(4);
				String c_school = rs.getString(5);
				
				c_dto = new childDTO(user_id, c_name, c_age, c_gender, c_school);
				
				c_one_list.add(c_dto);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close();
		}
		return c_one_list;
	}

}
