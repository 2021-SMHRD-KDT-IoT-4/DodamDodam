package COM.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;




public class UserDAO {
	UserDTO info = null;
	UserDTO dto = null;
	ArrayList<UserDTO> list = null;
	ArrayList<UserDTO> c_list = null;

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


	public ArrayList<UserDTO> All_info() {

		list = new ArrayList<UserDTO>();
		conn();

		try {
			String sql = "select * from USERS";

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {

				String name = rs.getString(1);
				String id = rs.getString(2);
				String pw = rs.getString(3);
				String tel = rs.getString(4);
				info = new UserDTO(name,id, pw, tel);
				list.add(info);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	

	public UserDTO my_info(UserDTO dto) {

		conn();

		String sql = "select * from users";

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getId());
			psmt.setString(3, dto.getPw());
			psmt.setString(4, dto.getTel());

			rs = psmt.executeQuery();
			
			if (rs.next()) {

				String name = rs.getString(1); 
				String id = rs.getString(2);
				String pw = rs.getString(3);
				String tel = rs.getString(4);

			info = new UserDTO(name, id, pw, tel);
			}


		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close();
		}
		return info;

	}
	
	
	public int join(UserDTO dto) {
		
		conn();
		
		String sql = "insert into users values(?, ?, ?, ?)";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getId());
			psmt.setString(3, dto.getPw());
			psmt.setString(4, dto.getTel());
			
			cnt = psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
			
		}
		
		return cnt;
		
		
	}
	
	
	public UserDTO login(UserDTO dto) {
		
		conn();
		
		String sql = "select * from users where users_id = ? and users_pw = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				String name = rs.getString(1);
				String id = rs.getString(2);
				String pw = rs.getString(3);
				String tel = rs.getString(4);
				
				info = new UserDTO(name, id, pw, tel);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return info;
		
		
		
		
	}
	
	public int modify_info(UserDTO dto) {
		conn();

		String sql = "update users set users_pw=?, users_tel=?, users_name=? where users_id =?";

		try {
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getPw()); 
			psmt.setString(2, dto.getTel());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getId());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close();
		}
		return cnt;
	}
	
	
	public ArrayList<UserDTO> getData(String idd) {
		 list = new ArrayList<UserDTO>();
		conn();
		
		String sql = "select * from users where users_id = ?";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, idd);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				String name = rs.getString(1);
				String id = rs.getString(2);
				String pw = rs.getString(3);
				String tel = rs.getString(4);
				
				dto = new UserDTO(name, id, pw, tel);
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	
	
	
	
}
