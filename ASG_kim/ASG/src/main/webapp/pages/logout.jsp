<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 로그아웃 처리 페이지 --%>
<%
    // 현재 세션 무효화
    session.invalidate();

    // 로그아웃 후 로그인 페이지로 리다이렉트
    response.sendRedirect("../pages/main.jsp");
%>
