package servlet;

import entity.Userdata;
import handler.RegHandle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/RegServlet")
public class RegServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String uName = request.getParameter("uName");
        String uPwd = request.getParameter("uPwd");
        String uNickName = request.getParameter("uNickName");
        String uEmail = request.getParameter("uEmail");
        String uFace = request.getParameter("uFace");
        String ip = request.getRemoteAddr();
        String role = "用户";
        Userdata userdata = new Userdata(uNickName,uName,uPwd,uFace,uEmail,ip,ip,role,1);
        PrintWriter printWriter = response.getWriter();
        try {
            new RegHandle(userdata);
            printWriter.println("注册成功");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
