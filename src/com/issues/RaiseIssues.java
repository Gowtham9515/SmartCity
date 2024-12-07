package com.issues;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class RaiseIssues
 */
@WebServlet("/RaiseIssues")
public class RaiseIssues extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int issue_id = 0;
		int raiseIssue = 0;
		String role = null;
		String issue_reply=" ";
		String status = "Pending";
		String uname = request.getParameter("uname");
		String issueSubject = request.getParameter("issueSubject");
		String description = request.getParameter("description");
		HttpSession hs = request.getSession();

		try {
			ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select role from tbluser where uname='" + hs.getAttribute("uname") + "'");
			if (rs.next()) {
				role = rs.getString("role");
			}
			if (role.equals("Tourist")) {
				 raiseIssue = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblissues(issue_id,user_name,issue_subject,description,status,issue_reply)values('" + issue_id+ "','" + uname + "','" + issueSubject + "','" + description + "','" + status + "','"+issue_reply+"')");
				 if(raiseIssue>0) {
					 String message="Issue submitted successfully.";
					 hs.setAttribute("issue", message);
					 response.sendRedirect("user-raise-issues.jsp");
				 }
			} else if (role.equals("Student")) {
				raiseIssue = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblissues(issue_id,user_name,issue_subject,description,status,issue_reply)values('" + issue_id+ "','" + uname + "','" + issueSubject + "','" + description + "','" + status + "','"+issue_reply+"')");
				if(raiseIssue>0) {
					 String message="Issue submitted successfully.";
					 hs.setAttribute("issue", message);
					 response.sendRedirect("student-raise-issues.jsp");
				 }
			} else {
				raiseIssue = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblissues(issue_id,user_name,issue_subject,description,status,issue_reply)values('" + issue_id+ "','" + uname + "','" + issueSubject + "','" + description + "','" + status + "','"+issue_reply+"')");
				if(raiseIssue>0) {
					 String message="Issue submitted successfully.";
					 hs.setAttribute("issue", message);
					 response.sendRedirect("jobseeker-raise-issues.jsp");
				 }
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
