package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.EmpDto;
import utils.ConnectionHelper;
import utils.DBType;

public class EmpDao {

    public List<EmpDto> getEmpList() {

        List<EmpDto> list = new ArrayList<>();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            conn = ConnectionHelper.getConnection(DBType.ORACLE);

            String sql = "select * from emp order by empno";

            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();

            while(rs.next()) {

                EmpDto emp = new EmpDto();

                emp.setEmpno(rs.getInt("empno"));
                emp.setEname(rs.getString("ename"));
                emp.setJob(rs.getString("job"));
                emp.setMgr(rs.getInt("mgr"));
                emp.setHiredate(rs.getString("hiredate"));
                emp.setSal(rs.getInt("sal"));
                emp.setComm(rs.getInt("comm"));
                emp.setDeptno(rs.getInt("deptno"));

                System.out.println(emp);
                list.add(emp);
            }

        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionHelper.close(rs);
            ConnectionHelper.close(pstmt);
            ConnectionHelper.close(conn);
        }

        return list;
    }
}