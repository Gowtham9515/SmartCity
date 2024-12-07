package com.issues;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class GiveReplyToUserIssues
 */
@WebServlet("/GiveReplyToUserIssues")
public class GiveReplyToUserIssues extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int issueId=Integer.parseInt(request.getParameter("issueId"));
		String userName=request.getParameter("userName");
		String issueReply=request.getParameter("issueReply");
		HttpSession hs=request.getSession();
		try {
			int issueReplied=DatabaseConnection.insertUpdateFromSqlQuery("update tblissues set status='Replied',issue_reply='"+issueReply+"' where issue_id='"+issueId+"' and user_name='"+userName+"'");
			if(issueReplied>0) {
				String message="Issue replied successfully.";
				hs.setAttribute("issueReplied", message);
				response.sendRedirect("admin-view-users-issue.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
