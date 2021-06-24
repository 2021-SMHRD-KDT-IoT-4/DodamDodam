package COM.Model;

public class FaqDTO {
	
	private int faq_seq;
	private String faq_title;
	private String faq_writer;
	private String faq_content;
	private String faq_answer;
	
	
	public FaqDTO(int faq_seq, String faq_title, String faq_writer, String faq_content, String faq_answer) {
		this.faq_seq = faq_seq;
		this.faq_title = faq_title;
		this.faq_writer = faq_writer;
		this.faq_content = faq_content;
		this.faq_answer = faq_answer;
	}
	
	
	public FaqDTO(String faq_title, String faq_writer, String faq_content) {
		super();
		this.faq_title = faq_title;
		this.faq_writer = faq_writer;
		this.faq_content = faq_content;
	}


	public int getFaq_seq() {
		return faq_seq;
	}


	public void setFaq_seq(int faq_seq) {
		this.faq_seq = faq_seq;
	}


	public String getFaq_title() {
		return faq_title;
	}


	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}


	public String getFaq_writer() {
		return faq_writer;
	}


	public void setFaq_writer(String faq_writer) {
		this.faq_writer = faq_writer;
	}


	public String getFaq_content() {
		return faq_content;
	}


	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}


	public String getFaq_answer() {
		return faq_answer;
	}


	public void setFaq_answer(String faq_answer) {
		this.faq_answer = faq_answer;
	}



}
