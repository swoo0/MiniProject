package kr.or.mini.dto;

public class AnimalVO {

	public String nm;		    // 사업장명
	public String telNum;       // 전화번호
	public String addr;         // 지번
	public String stNmAddr;     // 도로명주소
	public String open24Hours;  // 24시운영여부
	public String latitude;     // 위도
	public String longitude;	// 경도
	
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
	public String getOpen24Hours() {
		return open24Hours;
	}
	public void setOpen24Hours(String open24Hours) {
		this.open24Hours = open24Hours;
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
