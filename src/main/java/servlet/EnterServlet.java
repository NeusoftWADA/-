package servlet;

import entity.Knowledgedata;
import entity.Userdata;
import handler.EnterHandler;
import handler.LoginHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/EnterServlet")
public class EnterServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //固定操作，设置字符格式
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setHeader("content-type", "text/html;charset=utf-8");

        //从前端获取username和password
        String title = request.getParameter("title");
        String category = request.getParameter("category");

        System.out.println(title);
        System.out.println(category);

        //声明输出流
        PrintWriter printWriter = response.getWriter();


        try {

            EnterHandler enterHandler = new EnterHandler();

            if ( Knowledgedata == null ) {

            }
            else {

            }

        } catch (ClassNotFoundException | SQLException | ServletException e) {

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //固定操作，不论method是post还是get，都能互相调用
        doPost(request, response);
    }
}
