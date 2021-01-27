package servlet;

import entity.Userdata;
import handler.LoginHandler;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //固定操作，设置字符格式
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setHeader("content-type", "text/html;charset=utf-8");

        //从前端获取username和password
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        System.out.println(username);
        System.out.println(password);

        //声明输出流
        PrintWriter printWriter = response.getWriter();

        try {

            LoginHandler loginHandler = new LoginHandler();
            Userdata userdata = loginHandler.check(username, password);

            if ( userdata == null ) {
                printWriter.write("用户不存在或密码错误");
            }
            else {
                printWriter.write("欢迎你, " + userdata.getUserName() + "!");

                //通过用户id更新当前登录ip
                String log_ip = request.getRemoteAddr();
                int id = userdata.getId();
                loginHandler.updateLoginIP(log_ip, id);

            }
            loginHandler.closeConnection();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            printWriter.write("登陆失败");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //固定操作，不论method是post还是get，都能互相调用
        doPost(request, response);
    }
}
