package handler;

import database.Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

    public int addCategory(String name) throws SQLException {
        //防止标签重复
        PreparedStatement preparedStatement = connection.prepareStatement("insert into categories(name) select ? from dual where not exists(select name from categories where name = ?)");
        preparedStatement.setString(1, name);
        preparedStatement.setString(2, name);
        preparedStatement.executeUpdate();
        preparedStatement = connection.prepareStatement("select categories_id from categories where name = ?");
        preparedStatement.setString(1,name);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()){
            return resultSet.getInt(1);
        }
        return 0;
    }
}
