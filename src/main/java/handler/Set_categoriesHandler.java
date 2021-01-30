package handler;

import database.Database;
import entity.Set_categories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Set_categoriesHandler {
    Database database = new Database();
    Connection connection = null;

    public Set_categoriesHandler() throws SQLException, ClassNotFoundException {
        this.connection = database.getConnection();
    }

    public void setCate(Set_categories set_categories) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement("insert into set_categories(k_id, categories_id) values(?, ?)");
        preparedStatement.setInt(1, set_categories.getK_id());
        preparedStatement.setInt(2, set_categories.getCategories_id());

    }
}
