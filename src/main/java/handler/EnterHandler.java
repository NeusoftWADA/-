package handler;

import database.Database;
import entity.Knowledgedata;

import java.sql.Connection;
import java.sql.Date;
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
        PreparedStatement preparedStatement = connection.prepareStatement("insert into knowledge(k_id,user_id,title,abstract,content,createTime) values(?,?,?,?,?,?)");
        preparedStatement.setInt(1,knowledgedata.getK_id());
        preparedStatement.setInt(2,knowledgedata.getUser_id());
        preparedStatement.setString(3,knowledgedata.getTitle());
        preparedStatement.setString(4,knowledgedata.getAbstract());
        preparedStatement.setString(5,knowledgedata.getContent());
        preparedStatement.setDate(6, (Date) knowledgedata.getCreateTime());
        preparedStatement.executeUpdate();


    }
}
