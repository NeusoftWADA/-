package handler;

import database.Database;
import entity.Knowledgedata;
import entity.Userdata;

import javax.jws.soap.SOAPBinding;
import java.sql.*;
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

    public void addKnowledge(Userdata userdata, Knowledgedata knowledgedata) throws SQLException{
        PreparedStatement preparedStatement = connection.prepareStatement("insert into knowledge(user_id,title,abstract,content) values(?, ?, ?, ?)");
        preparedStatement.setInt(1,userdata.getId());
        preparedStatement.setString(2,knowledgedata.getTitle());
        preparedStatement.setString(3,knowledgedata.getAbstract());
        preparedStatement.setString(4,knowledgedata.getContent());
        preparedStatement.executeUpdate();
    }
}
