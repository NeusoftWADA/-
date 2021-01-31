package servlet;

import entity.Knowledgedata;
import entity.Set_categories;
import entity.Userdata;
import handler.CategoryHandler;
import handler.EnterHandler;
import handler.Set_categoriesHandler;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Vector;

@WebServlet("/EnterServlet")
public class EnterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //固定操作，设置字符格式
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setHeader("content-type", "text/html;charset=utf-8");

        //从前端获取文本内容
        String title = request.getParameter("title"); // 标题
        String Abstract = request.getParameter("Abstract"); // 摘要
        String content = request.getParameter("content"); // 内容
        String category = request.getParameter("category"); // 分类

        //封装知识点
        Knowledgedata knowledgedata = new Knowledgedata();
        knowledgedata.setTitle(title);
        knowledgedata.setAbstract(Abstract);
        knowledgedata.setContent(content);

        int kid;
        int cid;
        /**
         * 更新分类表 -> 更新知识点表 -> 更新设置分类表
         *      更新分类表同时返回cid，储存在数组变量 Vector<Integer> set_cate 中
         *      更新知识点表返回kid
         *      遍历 Vector<Integer> set_cate，使用cid和kid更新设置分类表
         */
        PrintWriter printWriter = response.getWriter();
        HttpSession httpSession = request.getSession();
        //获取登录用户session
        Userdata user_session = (Userdata) httpSession.getAttribute("user_session");
        //获取所有分类
        String cate[] = category.split(",");
        //封装分类表
        Set_categories set_categories = null;

        try {
            Vector<Integer> set_cate = new Vector<>();
            CategoryHandler categoryHandler = new CategoryHandler();
            for ( String s : cate ) {
                cid = categoryHandler.addCategory(s);
                set_cate.add(cid);
            }

            EnterHandler enterHandler = new EnterHandler();
            kid = enterHandler.addKnowledge(user_session, knowledgedata);

            for ( int n : set_cate) {
                set_categories = new Set_categories(kid, n);
                Set_categoriesHandler set_categoriesHandler = new Set_categoriesHandler();
                set_categoriesHandler.setCate(set_categories);
            }

            enterHandler.closeConnection();
            categoryHandler.closeConnection();

            printWriter.write("发布成功<br>");
            printWriter.write("分类添加成功<br>");
            printWriter.write("设置分类成功<br>");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            printWriter.write("ERROR<br>");
            System.out.println("ERROR");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //固定操作，不论method是post还是get，都能互相调用
        doPost(request, response);
    }
}
