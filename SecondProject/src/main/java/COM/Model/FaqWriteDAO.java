package COM.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class FaqWriteDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
	FaqDTO dto = null;
	
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
	
	public int upload(FaqDTO dto) {
		conn();
		
		String sql = "insert into faq values(faq_seq.nextval, ?, ?, ?, ?)";
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, dto.getFaq_seq());
			psmt.setString(2, dto.getFaq_title());
			psmt.setString(3, dto.getFaq_writer());
			psmt.setString(4, dto.getFaq_content());
			psmt.setString(5, dto.getFaq_answer());
			
			
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
		
	}
	
	public ArrayList<FaqDTO> showFaq() {
		ArrayList<FaqDTO> list = new ArrayList<FaqDTO>();
		conn();
		
		String sql = "select * from faq order by faq_seq desc";
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int faq_seq = rs.getInt(1);
				String faq_title = rs.getString(2);
				String faq_writer = rs.getString(3);
				String faq_content = rs.getString(4);
				String faq_answer = rs.getString(5);
				
				dto = new FaqDTO(faq_seq, faq_title, faq_writer, faq_content, faq_answer);
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	
	public FaqDTO showOne(int faq_seq) {
	      conn();
	      String sql = "select * from faq where faq_seq = ?";
	      try {
	         psmt = conn.prepareStatement(sql);
	         psmt.setInt(1, faq_seq);
	         rs = psmt.executeQuery();
	         
	         if(rs.next()) {
	            int num = rs.getInt(1);
	            String faq_title = rs.getString(2);
	            String faq_writer = rs.getString(3);
	            String faq_content = rs.getString(4);
	            String faq_answer = rs.getString(5);
	            dto = new FaqDTO(num, faq_title, faq_writer, faq_content, faq_answer);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close();
	      }
	      return dto;
	   }
	

}
