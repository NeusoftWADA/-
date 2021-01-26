package handler;

import database.Database;
import entity.Userdata;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegisterHandle {
    Database database = new Database();
    Connection connection = null;

    public RegisterHandle() throws SQLException, ClassNotFoundException {
        this.connection = database.getConnection();
    }

    public void closeConnection() throws SQLException {
        connection.close();
    }

    public void addUser(Userdata userdata) throws SQLException {

        PreparedStatement preparedStatement = connection.prepareStatement("insert into user(name, userName, password, avatar, email, reg_ip, log_ip, role, state) values(?,?,?,?,?,?,?,?,?)");
        preparedStatement.setString(1, userdata.getName());
        preparedStatement.setString(2, userdata.getUserName());
        preparedStatement.setString(3, userdata.getPassword());
        preparedStatement.setString(4, userdata.getAvatar());
        preparedStatement.setString(5, userdata.getEmail());
        preparedStatement.setString(6, userdata.getReg_ip());
        preparedStatement.setString(7, userdata.getLog_ip());
        preparedStatement.setString(8, userdata.getRole());
        preparedStatement.setInt(9, userdata.getState());
        preparedStatement.executeUpdate();

    }


}
