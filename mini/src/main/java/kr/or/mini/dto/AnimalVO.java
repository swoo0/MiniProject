package kr.or.mini.dto;

public class AnimalVO {

	public String voCode;
	public String gid;			// 고유번호
	public String nm;		    // 사업장명
	public String tel; 	        // 전화번호
	public String addr;         // 지번
	public String stNmAddr;     // 도로명주소
	public String latitude;     // 위도
	public String longitude;	// 경도
	public String geom;			// 지오메트리
	
	public String x;
	public String y;
	
	
	public String getVoCode() {
		return voCode;
	}
	public void setVoCode(String voCode) {
		this.voCode = voCode;
	}
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
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
	public String getGeom() {
		return geom;
	}
	public void setGeom(String geom) {
		this.geom = geom;
	}
	public String getX() {
		return x;
	}
	public void setX(String x) {
		this.x = x;
	}
	public String getY() {
		return y;
	}
	public void setY(String y) {
		this.y = y;
	}
	
}
