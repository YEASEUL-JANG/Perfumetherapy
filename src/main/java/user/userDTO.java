package user;

public class userDTO {
	private String userid;
	private String passwd;
	private String uname;
	private String gender;
	private String address;
	private String phone;
	private String email;
	private String postcode;
	private String detailaddress;
	private String extraaddress;
	
	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getDetailaddress() {
		return detailaddress;
	}

	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}

	public String getExtraaddress() {
		return extraaddress;
	}

	public void setExtraaddress(String extraaddress) {
		this.extraaddress = extraaddress;
	}

	public userDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public userDTO(String userid, String passwd, String uname, String gender, String address, String phone,
			String email) {
		super();
		this.userid = userid;
		this.passwd = passwd;
		this.uname = uname;
		this.gender = gender;
		this.address = address;
		this.phone = phone;
		this.email = email;
	}

	@Override
	public String toString() {
		return "userDTO [userid=" + userid + ", passwd=" + passwd + ", uname=" + uname + ", gender=" + gender
				+ ", address=" + address + ", phone=" + phone + ", email=" + email + "]";
	}
	
}
