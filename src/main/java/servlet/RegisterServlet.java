package servlet;

import entity.Userdata;
import handler.RegisterHandle;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setHeader("content-type", "text/html;charset=utf-8");

        String uName = request.getParameter("uName");
        String uPwd = request.getParameter("uPwd");
        String uNickName = request.getParameter("uNickName");
        String uEmail = request.getParameter("uEmail");
        String uFace = request.getParameter("uFace");
        String ip = request.getRemoteAddr();
        String role = "用户";
        int state = 0;

//        System.out.println("1");
        Userdata userdata = new Userdata(uNickName,uName,uPwd,uFace,uEmail,ip,ip,role,state);
//        System.out.println("2");
        PrintWriter printWriter = response.getWriter();

        try {
            RegisterHandle registerHandle = new RegisterHandle();
            registerHandle.addUser(userdata);
            registerHandle.closeConnection();

//            System.out.println("3");
            printWriter.write("注册成功，请使用用户名: " + userdata.getUserName() + " 登录");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            printWriter.write("注册失败");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        doPost(request, response);
    }
}
