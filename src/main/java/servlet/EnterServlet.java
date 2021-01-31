package servlet;

import entity.Knowledgedata;
import entity.Set_categories;
import entity.Sharedata;
import entity.Userdata;
import handler.CategoryHandler;
import handler.EnterHandler;
import handler.Set_categoriesHandler;
import handler.ShareHandler;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/EnterServlet")
public class EnterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //固定操作，设置字符格式
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setHeader("content-type", "text/html;charset=utf-8");

        //从前端获取username和password
        String title = request.getParameter("title"); // 标题
        String Abstract = request.getParameter("Abstract"); // 摘要
        String content = request.getParameter("content"); // 内容
        String category = request.getParameter("category"); // 分类

        //封装知识点
        Knowledgedata knowledgedata = new Knowledgedata();
        knowledgedata.setTitle(title);
        knowledgedata.setAbstract(Abstract);
        knowledgedata.setContent(content);


        int kid = 0;
        int cid = 0;
        int uid = 0;
        /**
         * 更新分类表
         * TODO
         * 更新后需返回一个当前分类的id
         */
        try {
            CategoryHandler categoryHandler = new CategoryHandler();
            cid = categoryHandler.addCategory(category);
            categoryHandler.closeConnection();
            System.out.println("分类添加成功");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.out.println("分类添加失败");
        }


        /**
         * 更新知识点表
         * TODO
         * 更新以后需返回一个当前知识点的id
         */
        PrintWriter printWriter = response.getWriter();
        HttpSession httpSession = request.getSession();
        Userdata user_session = (Userdata) httpSession.getAttribute("user_session");
        uid = user_session.getId();
        try {
            EnterHandler enterHandler = new EnterHandler();
            kid = enterHandler.addKnowledge(user_session, knowledgedata);
            printWriter.write("发布成功");
            enterHandler.closeConnection();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }


        //封装分类表
        Set_categories set_categories = null;
        Sharedata sharedata = null;
        if(kid==0||cid==0||uid==0){
            printWriter.println("----文件缺失！");
        }
        else{
            set_categories = new Set_categories(kid, cid);
            sharedata = new Sharedata(uid, kid);
        }

        /**
         * 更新设置分类表
         */
        try {
            Set_categoriesHandler set_categoriesHandler = new Set_categoriesHandler();
            set_categoriesHandler.setCate(set_categories);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        /**
         * 更新设置分享表
         */
        try {
            ShareHandler shareHandler = new ShareHandler();
            shareHandler.setShare(sharedata);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //固定操作，不论method是post还是get，都能互相调用
        doPost(request, response);
    }
}
