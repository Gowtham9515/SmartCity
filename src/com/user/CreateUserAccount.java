package com.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.Random;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class CreateUserAccount
 */
@WebServlet("/CreateUserAccount")
public class CreateUserAccount extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int addUser = 0;
		int addUserOTP=0;
		int userId = Integer.parseInt(request.getParameter("userId"));
		String fullName = request.getParameter("fullName");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String gender = request.getParameter("gender");
		String role = request.getParameter("role");
		String address = request.getParameter("address");
		String uname = request.getParameter("uname");
		String upass = request.getParameter("upass");
		HttpSession hs = request.getSession();
		
		Random random = new Random();
		int OTP = random.nextInt(9000) + 10000;

		try {
			ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tbluser where fullName='"+ fullName + "' OR email='" + email + "' OR mobile='" + mobile + "' OR uname='" + uname + "'");
			if (resultset.next()) {
				String error="Name OR Email OR Mobile No OR User Name already exist, Please try again.";
				hs.setAttribute("error", error);
				response.sendRedirect("user-account.jsp");
			} else {
				addUser = DatabaseConnection.insertUpdateFromSqlQuery("insert into tbluser(userId,fullName,gender,email,mobile,address,role,uname,upass) values('"
								+ userId + "','" + fullName + "','" + gender + "','" + email + "','" + mobile + "','"
								+ address + "','" + role + "','" + uname + "','" + upass + "')");
				addUserOTP=DatabaseConnection.insertUpdateFromSqlQuery("insert into tblotp(email,userRole,OTP)values('" + email+ "','" + role + "','" + OTP + "')");

				if (addUser > 0) {
					String message = "User account create successfully.";
					hs.setAttribute("success", message);
					response.sendRedirect("user-account.jsp");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
