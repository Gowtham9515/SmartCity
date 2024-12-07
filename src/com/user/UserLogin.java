package com.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;
import com.email.EmailUtility;

/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {

	private String host;
	private String port;
	private String user;
	private String pass;

	public void init() {
		// reads SMTP server setting from web.xml file
		ServletContext context = getServletContext();
		host = context.getInitParameter("host");
		port = context.getInitParameter("port");
		user = context.getInitParameter("user");
		pass = context.getInitParameter("pass");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int update = 0;
		int updateOTP = 0;
		String resultMessage = "";
		String emailTopicName = "Smart City";
		String emailId = null;
		String userOTP = "";
		String uname = request.getParameter("uname");
		String upass = request.getParameter("upass");
		String role = request.getParameter("role");
		String vercode = request.getParameter("vercode");
		String captchaDB = null;
		try {

			Random random = new Random();
			int newRandomCaptcha = random.nextInt(9000) + 10000;
			HttpSession hs = request.getSession();

			int OTP = random.nextInt(9000) + 10000;

			ResultSet captchResultSet = DatabaseConnection.getResultFromSqlQuery("select * from tblcaptcha");
			if (captchResultSet.next()) {
				captchaDB = captchResultSet.getString(1);
			}
			if (role.equals("Tourist")) {
				if (captchaDB.equals(vercode)) {
					ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tbluser where uname='"+ uname + "' and upass='" + upass + "' and role='" + role + "'");
					if (resultset.next()) {
						hs.setAttribute("userId", resultset.getInt("userId"));
						hs.setAttribute("userRole", resultset.getString("role"));
						hs.setAttribute("fullName", resultset.getString("fullName"));
						hs.setAttribute("uname", resultset.getString("uname"));
						hs.setAttribute("email", resultset.getString("email"));
						hs.setAttribute("mobile", resultset.getString("mobile"));
						emailId = resultset.getString("email");
						update = DatabaseConnection.insertUpdateFromSqlQuery("update tblcaptcha set captcha='" + newRandomCaptcha + "'");
						userOTP = "Hi" + System.lineSeparator() + System.lineSeparator() + "Your OTP is: " + OTP+ System.lineSeparator() + System.lineSeparator() + "Thank you."+ System.lineSeparator() + "Smart City Team.";
						EmailUtility.sendEmail(host, port, "jfsdproject3@gmail.com", "dxmgoggvlklodipu", emailId,emailTopicName, userOTP);
						resultMessage = "Your OTP send successfully in your email, please check.";
						hs.setAttribute("mail-success", resultMessage);
						updateOTP = DatabaseConnection.insertUpdateFromSqlQuery("update tblotp set OTP='"+OTP+"' where email='"+emailId+"' and userRole='"+role+"'");
						response.sendRedirect("otp-validation.jsp");

					} else {
						String message = "You have enter wrong credentials";
						hs.setAttribute("credential", message);
						update = DatabaseConnection.insertUpdateFromSqlQuery("update tblcaptcha set captcha='" + newRandomCaptcha + "'");
						response.sendRedirect("user-login.jsp");
					}
				} else {
					String message = "You have enter invalid verification code";
					hs.setAttribute("verificationCode", message);
					update = DatabaseConnection.insertUpdateFromSqlQuery("update tblcaptcha set captcha='" + newRandomCaptcha + "'");
					response.sendRedirect("user-login.jsp");
				}
			} else if (role.equals("Student")) {
				if (captchaDB.equals(vercode)) {
					ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tbluser where uname='"
							+ uname + "' and upass='" + upass + "' and role='" + role + "'");
					if (resultset.next()) {
						hs.setAttribute("userId", resultset.getInt("userId"));
						hs.setAttribute("userRole", resultset.getString("role"));
						hs.setAttribute("fullName", resultset.getString("fullName"));
						hs.setAttribute("uname", resultset.getString("uname"));
						hs.setAttribute("email", resultset.getString("email"));
						hs.setAttribute("mobile", resultset.getString("mobile"));
						emailId = resultset.getString("email");
						update = DatabaseConnection.insertUpdateFromSqlQuery("update tblcaptcha set captcha='" + newRandomCaptcha + "'");
						userOTP = "Hi" + System.lineSeparator() + System.lineSeparator() + "Your OTP is: " + OTP+ System.lineSeparator() + System.lineSeparator() + "Thank you."+ System.lineSeparator() + "Smart City Team.";
						EmailUtility.sendEmail(host, port, "jfsdproject3@gmail.com", "dxmgoggvlklodipu", emailId,emailTopicName, userOTP);
						resultMessage = "Your OTP send successfully in your email, please check.";
						hs.setAttribute("mail-success", resultMessage);
						updateOTP = DatabaseConnection.insertUpdateFromSqlQuery("update tblotp set OTP='"+OTP+"' where email='"+emailId+"' and userRole='"+role+"'");
						response.sendRedirect("otp-validation.jsp");

					} else {
						String message = "You have enter wrong credentials";
						hs.setAttribute("credential", message);
						update = DatabaseConnection.insertUpdateFromSqlQuery("update tblcaptcha set captcha='" + newRandomCaptcha + "'");
						response.sendRedirect("user-login.jsp");
					}
				} else {
					String message = "You have enter invalid verification code";
					hs.setAttribute("verificationCode", message);
					update = DatabaseConnection.insertUpdateFromSqlQuery("update tblcaptcha set captcha='" + newRandomCaptcha + "'");
					response.sendRedirect("user-login.jsp");
				}
			} else {
				if (captchaDB.equals(vercode)) {
					ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tbluser where uname='"+ uname + "' and upass='" + upass + "' and role='" + role + "'");
					if (resultset.next()) {
						hs.setAttribute("userId", resultset.getInt("userId"));
						hs.setAttribute("userRole", resultset.getString("role"));
						hs.setAttribute("fullName", resultset.getString("fullName"));
						hs.setAttribute("uname", resultset.getString("uname"));
						hs.setAttribute("email", resultset.getString("email"));
						hs.setAttribute("mobile", resultset.getString("mobile"));
						emailId = resultset.getString("email");
						update = DatabaseConnection.insertUpdateFromSqlQuery("update tblcaptcha set captcha='" + newRandomCaptcha + "'");
						userOTP = "Hi" + System.lineSeparator() + System.lineSeparator() + "Your OTP is: " + OTP+ System.lineSeparator() + System.lineSeparator() + "Thank you."+ System.lineSeparator() + "Smart City Team.";
						EmailUtility.sendEmail(host, port, "jfsdproject3@gmail.com", "dxmgoggvlklodipu", emailId,emailTopicName, userOTP);
						resultMessage = "Your OTP send successfully in your email, please check.";
						hs.setAttribute("mail-success", resultMessage);
						updateOTP = DatabaseConnection.insertUpdateFromSqlQuery("update tblotp set OTP='"+OTP+"' where email='"+emailId+"' and userRole='"+role+"'");
						response.sendRedirect("otp-validation.jsp");

					} else {
						String message = "You have enter wrong credentials";
						hs.setAttribute("credential", message);
						update = DatabaseConnection.insertUpdateFromSqlQuery("update tblcaptcha set captcha='" + newRandomCaptcha + "'");
						response.sendRedirect("user-login.jsp");
					}
				} else {
					String message = "You have enter invalid verification code";
					hs.setAttribute("verificationCode", message);
					update = DatabaseConnection.insertUpdateFromSqlQuery("update tblcaptcha set captcha='" + newRandomCaptcha + "'");
					response.sendRedirect("user-login.jsp");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
