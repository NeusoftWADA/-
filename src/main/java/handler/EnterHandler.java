package handler;

import database.Database;
import entity.Knowledgedata;

import java.sql.Connection;
import java.sql.PreparedStatement;
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

    public void addKnowledge(Knowledgedata knowledgedata) throws SQLException{
        PreparedStatement preparedStatement = connection.prepareStatement("insert into Knowledge(k_id,user_id,title,abstract,content,createTime) values(?,?,?,?,?,?)");
        preparedStatement.setString(1, Knowledgedata.getK_id);
        preparedStatement.setString(2, userdata.getUserName());
        preparedStatement.setString(3, userdata.getPassword());
        preparedStatement.setString(4, userdata.getAvatar());
        preparedStatement.setString(5, userdata.getEmail());
        preparedStatement.setString(6, userdata.getReg_ip());
        preparedStatement.executeUpdate();

    }
}
