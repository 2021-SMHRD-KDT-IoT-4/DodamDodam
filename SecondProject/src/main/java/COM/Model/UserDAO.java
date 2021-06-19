package COM.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;





public class UserDAO {
	UserDTO info = null;
	ArrayList<UserDTO> list = null;

	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;


	public void conn() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String db_url = "jdbc:oracle:thin:@192.168.0.115:1521:xe";
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


	public ArrayList<UserDTO> select() {

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

}
