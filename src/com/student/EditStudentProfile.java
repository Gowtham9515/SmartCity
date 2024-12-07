package com.student;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class EditStudentProfile
 */
@WebServlet("/EditStudentProfile")
public class EditStudentProfile extends HttpServlet {
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId=Integer.parseInt(request.getParameter("userId"));
		String fullName=request.getParameter("fullName");
		String mobile=request.getParameter("mobile");
		String gender=request.getParameter("gender");
		String address=request.getParameter("address");
		
		HttpSession session=request.getSession();
		try {
			int editProfile=DatabaseConnection.insertUpdateFromSqlQuery("update tbluser set fullName='"+fullName+"',mobile='"+mobile+"',gender='"+gender+"',address='"+address+"' where uname='"+session.getAttribute("uname")+"' and userId='"+userId+"'");
			if(editProfile>0) {
				String message="Profile updated successfully.";
				session.setAttribute("profile-update", message);
				response.sendRedirect("student-view-profile.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
