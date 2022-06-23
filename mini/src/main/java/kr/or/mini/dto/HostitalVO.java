package kr.or.mini.dto;

public class HostitalVO {

	public String nm;		   // 병원명
	public String telNum;      // 전화번호
	public String addr;        // 지번
	public String stNmAddr;    // 도로명주소
	public String lititude;    // 위도
	public String longitude;   // 경도
	
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
	public String getLititude() {
		return lititude;
	}
	public void setLititude(String lititude) {
		this.lititude = lititude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	
}
