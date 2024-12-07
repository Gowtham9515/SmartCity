package com.user;

import java.io.IOException;
import java.sql.ResultSet;

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
 * Servlet implementation class UserForgetPassword
 */
@WebServlet("/UserForgetPassword")
public class UserForgetPassword extends HttpServlet {
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String uname = null;
		String upass = null;
		String userPassword = "";
		String databaseEmailId = "";
		String resultMessage = "";
		String message = "Smart City";
		HttpSession session = request.getSession();

		try {
			ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tbluser where email='" + email + "'");
			if (resultset.next()) {
				databaseEmailId = resultset.getString("email");	
			}

			if (databaseEmailId.equals(email)) {
				ResultSet resultPassword = DatabaseConnection.getResultFromSqlQuery("select * from tbluser where email='" + email + "'");
				if (resultPassword.next()) {
					uname = resultPassword.getString("uname");
					upass = resultset.getString("upass");
					
					
					userPassword = "Hi " + uname + "," + System.lineSeparator() + System.lineSeparator()+ "Smart City" + System.lineSeparator() + System.lineSeparator() + "User Name: " + databaseEmailId+ System.lineSeparator() + "Password: " + upass + System.lineSeparator()+ System.lineSeparator() + "Thank you." + System.lineSeparator()+ "Smart City Team.";
					EmailUtility.sendEmail(host, port, "jfsdproject3@gmail.com", "dxmgoggvlklodipu", email, message,userPassword);
					resultMessage = "Your login user name & password send successfully in your email.";
					session.setAttribute("mail-success", resultMessage);
					response.sendRedirect("user-forgot-password.jsp");
				}
			} else {
				String fail = "Your email id is wrong, unable to get password.";
				session.setAttribute("forgot-password", fail);
				response.sendRedirect("user-forgot-password.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
