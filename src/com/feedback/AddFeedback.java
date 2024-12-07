package com.feedback;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

import java.sql.*;

/**
 * Servlet implementation class AddFeedback
 */
@WebServlet("/AddFeedback")
public class AddFeedback extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int fid = 0;
		int addFeedback = 0;
		HttpSession hs = request.getSession();
		String uname = request.getParameter("uname");
		String feedback = request.getParameter("feedback");
		String userRole = (String) hs.getAttribute("userRole");
		double rating = Double.parseDouble(request.getParameter("rating"));
		System.out.println("Ratings " + rating);

		try {
			if (userRole.equals("Job Seeker")) {
				addFeedback = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblfeedback(fid,uname,utype,feedback,ratings)values('"+ fid + "','" + uname + "','" + userRole + "','" + feedback + "','" + rating + "')");
				if (addFeedback > 0) {
					String message = "Feedback submitted successfully.";
					hs.setAttribute("feedback", message);
					response.sendRedirect("jobseeker-give-feedback.jsp");
				}
			} else if (userRole.equals("Student")) {
				addFeedback = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblfeedback(fid,uname,utype,feedback,ratings)values('"+ fid + "','" + uname + "','" + userRole + "','" + feedback + "','" + rating + "')");
				if (addFeedback > 0) {
					String message = "Feedback submitted successfully.";
					hs.setAttribute("feedback", message);
					response.sendRedirect("student-give-feedback.jsp");
				}
			} else {
				addFeedback = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblfeedback(fid,uname,utype,feedback,ratings)values('"+ fid + "','" + uname + "','" + userRole + "','" + feedback + "','" + rating + "')");
				if (addFeedback > 0) {
					String message = "Feedback submitted successfully.";
					hs.setAttribute("feedback", message);
					response.sendRedirect("user-give-feedback.jsp");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
