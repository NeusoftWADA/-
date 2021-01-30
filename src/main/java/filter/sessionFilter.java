package filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class sessionFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        //System.out.println("过滤器1初始化了");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        String uri = request.getRequestURI();
        //主页名或默认欢迎文件设置为index
        if("log".indexOf(uri)!=-1||"Log".indexOf(uri)!=-1||"index".indexOf(uri)!=-1){
            filterChain.doFilter(servletRequest,servletResponse);
            return;
        }
        HttpSession session = request.getSession(false);
        if (session != null){
            filterChain.doFilter(servletRequest,servletResponse);
            return;
        }
        //此处先设置为登陆页面，等主页页面做好之后换为主页页面；
        servletRequest.getRequestDispatcher("/log.html");
    }

    @Override
    public void destroy() {
        //System.out.println("过滤器1被销毁了");
    }
}
