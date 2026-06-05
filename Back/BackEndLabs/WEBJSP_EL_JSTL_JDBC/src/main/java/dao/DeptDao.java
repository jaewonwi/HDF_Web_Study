package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.DeptDto;
import utils.ConnectionHelper;
import utils.DBType;

public class DeptDao {

    public List<DeptDto> getDeptList(int deptno) {

        List<DeptDto> list = new ArrayList<>();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            conn = ConnectionHelper.getConnection(DBType.ORACLE);

            String sql =
                "select deptno,dname,loc " +
                "from dept " +
                "where deptno=?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, deptno);

            rs = pstmt.executeQuery();

            while(rs.next()) {

                DeptDto dept = new DeptDto();

                dept.setDeptno(rs.getInt("deptno"));
                dept.setDname(rs.getString("dname"));
                dept.setLoc(rs.getString("loc"));

                list.add(dept);
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