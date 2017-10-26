package com.zedlab.interceptor;

import javax.servlet.Filter;

import java.io.IOException;

import javax.servlet.*;

public class SimpleServletFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {
    }

    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain filterChain)
    throws IOException, ServletException {

    }

    public void destroy() {
    }
}
