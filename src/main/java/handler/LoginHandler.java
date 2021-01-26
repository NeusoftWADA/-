package handler;

import database.Database;
import entity.Userdata;

import java.sql.*;

public class LoginHandler {
    Database database = new Database();
    Connection connection = null;

    public LoginHandler() throws ClassNotFoundException, SQLException {
        connection = database.getConnection();
    }

    public void closeConnection() throws SQLException {
        connection.close();
    }

    public Userdata check (String username, String password) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement("SELECT password FROM user WHERE username = ?");
        preparedStatement.setString(1, username);
        preparedStatement.executeQuery();

        ResultSet resultSet =preparedStatement.getResultSet();
        if ( resultSet.next() ) {
            String pwd = resultSet.getString("password");
            if ( pwd.equals(password) ) {
                return getUser(username);
            }
            else {
                return null;
            }
        }
        else {
            return null;
        }
    }

    public Userdata getUser(String username) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM user WHERE username = ?");
        preparedStatement.setString(1, username);
        preparedStatement.executeQuery();

        ResultSet resultSet = preparedStatement.getResultSet();
        if ( resultSet.next() ) {
//            String name = resultSet.getString("username");//从数据库中获取的username
//            String pwd = resultSet.getString("password");//从数据库中获取的password
//            如果能够查询出结果，将该用户实例封装返回
            Userdata userdata = new Userdata(resultSet.getString(2), resultSet.getString(3), resultSet.getString(4), resultSet.getString(5), resultSet.getString(6), resultSet.getString(7), resultSet.getString(8), resultSet.getString(9), resultSet.getInt(10));
            userdata.setId(resultSet.getInt(1));
            return userdata;
        }
        else {
            return null;
        }
    }
}
