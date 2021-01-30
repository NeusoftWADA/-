package handler;

import database.Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CategoryHandler {
    Database database = new Database();
    Connection connection = null;

    public CategoryHandler() throws SQLException, ClassNotFoundException {
        this.connection = database.getConnection();
    }

    public void closeConnection() throws SQLException {
        connection.close();
    }

    public void addCategory(String name) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement("insert into categories(name) value(?)");
        preparedStatement.setString(1, name);
        preparedStatement.executeUpdate();
    }
}
