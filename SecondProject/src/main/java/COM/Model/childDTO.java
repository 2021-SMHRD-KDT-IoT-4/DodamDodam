package COM.Model;

public class childDTO {
	
	private String c_id;
	private String c_name;
	private String c_age;
	private String c_gender;
	private String c_school;
	
	public childDTO(String c_id, String c_name, String c_age, String c_gender, String c_school) {
		super();
		this.c_id = c_id;
		this.c_name = c_name;
		this.c_age = c_age;
		this.c_gender = c_gender;
		this.c_school = c_school;
	}
	
	
	
	public childDTO(String c_name, String c_age, String c_gender, String c_school) {
		super();
		this.c_name = c_name;
		this.c_age = c_age;
		this.c_gender = c_gender;
		this.c_school = c_school;
	}





	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	
	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_age() {
		return c_age;
	}

	public void setC_age(String c_age) {
		this.c_age = c_age;
	}

	public String getC_gender() {
		return c_gender;
	}

	public void setC_gender(String c_gender) {
		this.c_gender = c_gender;
	}

	public String getC_school() {
		return c_school;
	}

	public void setC_school(String c_school) {
		this.c_school = c_school;
	}

}
