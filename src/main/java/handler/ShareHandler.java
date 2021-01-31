package handler;

import database.Database;
import entity.Sharedata;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ShareHandler {
    Database database = new Database();
    Connection connection = null;
    public ShareHandler() throws SQLException, ClassNotFoundException {
        this.connection = database.getConnection();
    }
    public void setShare(Sharedata sharedata) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement("insert into share(user_id, k_id) values(?, ?)");
        preparedStatement.setInt(1,sharedata.getUser_id());
        preparedStatement.setInt(2,sharedata.getK_id());
        preparedStatement.executeUpdate();
    }
}
