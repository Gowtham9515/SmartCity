package com.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import com.connection.DatabaseConnection;

/**
 * Servlet implementation class UserVerifyOTP
 */
@WebServlet("/UserVerifyOTP")
public class UserVerifyOTP extends HttpServlet {
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int databaseOTP = 0;
		HttpSession hs = request.getSession();
		int OTP = Integer.parseInt(request.getParameter("OTP"));
		String userRole = (String) hs.getAttribute("userRole");
		String email = (String) hs.getAttribute("email");

		try {
			ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblotp where email='" + email + "' and userRole='" + userRole + "'");
			if (resultset.next()) {
				databaseOTP = resultset.getInt("OTP");
			}
			
			//Validate user Role & OTP
			if (userRole.equals("Tourist")) {
				if (databaseOTP == OTP) {
					response.sendRedirect("user-dashboard.jsp");
				} else {
					String error="Invalid OTP, please enter correct OTP.";
					hs.setAttribute("invalidOTP", error);
					response.sendRedirect("otp-validation.jsp");
				}
			} else if (userRole.equals("Student")) {
				if (databaseOTP == OTP) {
					response.sendRedirect("student-dashboard.jsp");
				} else {
					String error="Invalid OTP, please enter correct OTP.";
					hs.setAttribute("invalidOTP", error);
					response.sendRedirect("otp-validation.jsp");
				}
			} else {
				if (databaseOTP == OTP) {
					response.sendRedirect("jobseeker-dashboard.jsp");
				} else {
					String error="Invalid OTP, please enter correct OTP.";
					hs.setAttribute("invalidOTP", error);
					response.sendRedirect("otp-validation.jsp");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
