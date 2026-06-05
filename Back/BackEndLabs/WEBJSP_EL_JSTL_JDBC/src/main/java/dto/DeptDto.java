package dto;

import lombok.Data;

@Data
public class DeptDto {
	private int deptno;
	private String dname;
	private String loc;

	public DeptDto() {}

	public DeptDto(int deptno, String dname, String loc) {
        this.deptno = deptno;
        this.dname = dname;
        this.loc = loc;
    }
}
