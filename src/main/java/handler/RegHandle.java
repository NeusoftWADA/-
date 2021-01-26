package handler;

import database.Database;
import entity.Userdata;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegHandle {
    Userdata userdata = null;
    Database database = new Database();
    Connection connection = null;
    public RegHandle(Userdata userdata) throws SQLException, ClassNotFoundException {
        connection = database.getConnection();
        this.userdata = userdata;
    }
    public void closeConnection() throws SQLException {
        connection.close();
    }
    public void add() throws SQLException {
        String name = this.userdata.getName();
        String userName = this.userdata.getUserName();
        String password = this.userdata.getPassword();
        String avatar = this.userdata.getAvatar();
        String email = this.userdata.getEmail();
        String reg_ip = this.userdata.getReg_ip();
        String log_ip = this.userdata.getLog_ip();
        String role = this.userdata.getRole();
        int state = this.userdata.getState();
        PreparedStatement preparedStatement = connection.prepareStatement("insert into user(name, userName, password, avatar, email, reg_ip, log_ip, role, state) values(?,?,?,?,?,?,?,?,?)");
        preparedStatement.setString(1, name);
        preparedStatement.setString(2, userName);
        preparedStatement.setString(3, password);
        preparedStatement.setString(4, avatar);
        preparedStatement.setString(5, email);
        preparedStatement.setString(6, reg_ip);
        preparedStatement.setString(7, log_ip);
        preparedStatement.setString(8, role);
        preparedStatement.setInt(9, state);
        preparedStatement.executeUpdate();
        this.closeConnection();
    }
}
