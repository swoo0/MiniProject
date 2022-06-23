package kr.or.mini.dto;

public class ParkVO {

	public String id;		  // 관리번호
	public String nm;         // 공원명
	public String addr;       // 지번
	public String stNmAddr;   // 도로명
	public String area;       // 면접
	public String latitude;   // 위도
	public String longitude;  // 경도
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
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
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
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
