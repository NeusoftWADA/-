package database;

import java.sql.*;

public class Database {
    Connection connection = null;

    public Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        return this.connection = DriverManager.getConnection("jdbc:mysql://172.17.8.19:3306/myk1?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC",
                "myk1", "myk1");
    }

}
