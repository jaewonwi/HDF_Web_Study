/*
 * 편리성: DB연결 작업을 편하게 하고 싶다. -> new 없이 사용하고 싶다. -> static 메서드로 사용하겠다. (+ 오버로딩)
 * 확장성: Oracle, MySql, ... 여러 DB 종류를 사용하고 싶다. -> enum 사용하겠다.
 * 
 * 성능: DB연결 작업은 비용과 시간이 많이 소요된다. -> 미리 만들어 놓겠다.
 * -> 실제 프로젝트에서는 Connection Pool(히카리 풀) 사용한다.
 */
package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class ConnectionHelper {
	
	public static Connection getConnection(DBType dbType) {
		if (dbType == DBType.ORACLE) return getConnection(dbType, "KOSA", "0000");
		if (dbType == DBType.MARIADB) return getConnection(dbType, "root", "0000");
		return null;
	}
	
	public static Connection getConnection(DBType dbType, String id, String pwd) {
		Connection conn = null;
		
		try {
			switch (dbType) {
			// 팩토리 패턴 사용해도 된다.
			case ORACLE:
				conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XEPDB1", id, pwd);
				break;
			case MARIADB:
				conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/sampledb", id, pwd);
				break;
			}
		} catch (Exception e) {
			System.out.println("Connection Factory: "+e.getMessage());
		}
		return conn;
	}
	
	public static void close(Connection conn) {
		if (conn!=null) {
			try {
				conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
	
	public static void close(ResultSet rs) {
		if (rs!=null) {
			try {
				rs.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
	
	public static void close(Statement stmt) {
		if (stmt!=null) {
			try {
				stmt.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
	
	public static void close(PreparedStatement pstmt) {
		if (pstmt!=null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
