package COM.Model;

public class UserDTO {

	private String name;
	private String id;
	private String pw;
	private String tel;

	
	
	
	public UserDTO(String name, String id, String pw, String tel) {
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.tel = tel;
	}

	


	public UserDTO(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}

	



	public UserDTO(String id) {
		this.id = id;
	}




	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

}
