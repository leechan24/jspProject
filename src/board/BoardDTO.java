package board;
import java.sql.Timestamp;

public class BoardDTO {


    private String name;
    private String email;
    private int tel;
    private String title;
    private String category;
    private String content;
    private String password;
    private String boardid;
    private Timestamp reg_date;
    private int num;
    
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getBoardid() {
		return boardid;
	}
	public void setBoardid(String boardid) {
		this.boardid = boardid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getTel() {
		return tel;
	}
	public void setTel(int tel) {
		this.tel = tel;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "BoardDTO [name=" + name + ", email=" + email + ", tel=" + tel + ", title=" + title + ", category="
				+ category + ", content=" + content + ", password=" + password + ", boardid=" + boardid + ", reg_date="
				+ reg_date + ", num=" + num + "]";
	}

    
}