package servlet;

import database.Database;
import entity.Knowledgedata;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setHeader("content-type", "text/html;charset=utf-8");
        String search = request.getParameter("search");
        Database database=new Database();
        String sql = "SELECT * FROM knowledge where content like '%"+search+"%'";
        List<Knowledgedata> knowledgedataList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Knowledgedata knowledgedata = null;
        int count = 0;
        try {
            preparedStatement = database.getConnection().prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                knowledgedata = new Knowledgedata(resultSet.getInt(1), resultSet.getInt(2), resultSet.getString(3), resultSet.getString(4), resultSet.getString(5), resultSet.getString(6));
                knowledgedataList.add(knowledgedata);
            }
            count = knowledgedataList.size();
            System.out.println(knowledgedataList);
            System.out.println(count);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        List<Object> list = new ArrayList<>();
        list.add(knowledgedataList);
        list.add(count);
        if(count!=0){
            request.getSession().setAttribute("list_Session",list);
            request.getRequestDispatcher("search.jsp").forward(request,response);
        }
        else{

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
