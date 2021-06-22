package COM.Model;

public class NoticeDTO {
	
	private int notice_seq;
	private String notice_title;
	private String notice_writer;
	private String notice_content;
	private String notice_day; 
	
	
	public NoticeDTO(String notice_title, String notice_writer, String notice_content) {
		this.notice_title = notice_title;
		this.notice_writer = notice_writer;
		this.notice_content = notice_content;
	}


	public NoticeDTO(int notice_seq, String notice_title, String notice_writer, String notice_content,
			String notice_day) {
		super();
		this.notice_seq = notice_seq;
		this.notice_title = notice_title;
		this.notice_writer = notice_writer;
		this.notice_content = notice_content;
		this.notice_day = notice_day;
	}
	
	
	public int getNotice_seq() {
		return notice_seq;
	}


	public void setNotice_seq(int notice_seq) {
		this.notice_seq = notice_seq;
	}


	public String getNotice_title() {
		return notice_title;
	}


	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}


	public String getNotice_writer() {
		return notice_writer;
	}


	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}


	public String getNotice_content() {
		return notice_content;
	}


	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}


	public String getNotice_day() {
		return notice_day;
	}


	public void setNotice_day(String notice_day) {
		this.notice_day = notice_day;
	}

}
