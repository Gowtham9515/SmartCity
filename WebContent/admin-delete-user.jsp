<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<%
	int uid = Integer.parseInt(request.getParameter("uid"));
	int deleteQuery = DatabaseConnection.insertUpdateFromSqlQuery("delete from tbluser where userId='" + uid + "'");
	String del = "user deleted sucessfully.";
	session.setAttribute("delete", del);
	response.sendRedirect("admin-view-users.jsp");
%>