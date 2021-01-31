import database.Database;

import java.sql.SQLException;

public class Test {
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        /**
         * 测试数据库连接是否成功，需要连接vpn，运行此测试类会打印出服务器地址
         *  com.mysql.jdbc.JDBC4Connection@4b85612c
         */
//        Database database = new Database();
//        System.out.println(database.getConnection());
        String str = "Java,C语言,Python";
        String[] res = str.split(",");
        for ( String s : res ) {
            System.out.println(s);
        }
    }
}
