package handler;

import database.Database;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collection;

public class EnterHandler {
    Database database=new Database();
    Connection connection=null;

    public EnterHandler() throws SQLException, ClassNotFoundException {
        this.connection = database.getConnection();
    }

    public void closeConnection() throws SQLException {
        connection.close();
    }

    public void addKnowledge() throws SQLException{

    }
}
