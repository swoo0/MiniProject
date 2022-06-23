package kr.or.mini.dto;

public class SchoolVO {

	public String shTypeNm;	   // 학교구분명
	public String schoolCd;    // 공사립구분
	public String nm;          // 학교명
	public String telNum;      // 전화번호
	public String addr;        // 지번
	public String stNmAddr;    // 도로명주소
	public String latitude;    // 위도
	public String longitude;   // 경도
	
	public String getShTypeNm() {
		return shTypeNm;
	}
	public void setShTypeNm(String shTypeNm) {
		this.shTypeNm = shTypeNm;
	}
	public String getSchoolCd() {
		return schoolCd;
	}
	public void setSchoolCd(String schoolCd) {
		this.schoolCd = schoolCd;
	}
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	public String getTelNum() {
		return telNum;
	}
	public void setTelNum(String telNum) {
		this.telNum = telNum;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getStNmAddr() {
		return stNmAddr;
	}
	public void setStNmAddr(String stNmAddr) {
		this.stNmAddr = stNmAddr;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	
	
}
