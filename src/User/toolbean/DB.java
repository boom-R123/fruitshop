package User.toolbean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


public class DB {
    public static final String url = "jdbc:mysql://localhost:3306/" + "fruitshop" +
            "?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    public static final String driver = "com.mysql.cj.jdbc.Driver";
    public static final String user = "root";
    public static final String password = "123456";

    public Connection conn = null;
    public PreparedStatement pst = null;

    public DB() {
        try {
            Class.forName(driver); //指定连接类型
            conn = DriverManager.getConnection(url, user, password); //获取连接
            if(conn.isClosed()) {
                System.out.println("连接失败！");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void inputSQL (String sql) {
        try {
            this.pst = this.conn.prepareStatement(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void close() {
        try{
            this.conn.close();
            this.pst.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

}

