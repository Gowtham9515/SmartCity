package com.contact;

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
 * Servlet implementation class GiveInquiryReply
 */
@WebServlet("/GiveInquiryReply")
public class GiveInquiryReply extends HttpServlet {
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
		String inquiryReply = request.getParameter("inquiryReply");
		String name = null;
		String messageBody = null;
		String resultMessage = "";
		String message = "Smart City";
		HttpSession session = request.getSession();

		try {

			ResultSet resultPassword = DatabaseConnection.getResultFromSqlQuery("select * from tblcontact where email='" + email + "'");
			if (resultPassword.next()) {
				name = resultPassword.getString("name");

				messageBody = "Hi " + name + "," + System.lineSeparator() + System.lineSeparator()
						+ System.lineSeparator() + System.lineSeparator() + inquiryReply + System.lineSeparator()
						+ System.lineSeparator() + System.lineSeparator() + System.lineSeparator()
						+ "Smart City Team.";
				
				EmailUtility.sendEmail(host, port,"jfsdproject3@gmail.com","dxmgoggvlklodipu", email, message,messageBody);
				resultMessage = "Reply send successfully in mail.";
				session.setAttribute("mail-success", resultMessage);
				int changeStatus=DatabaseConnection.insertUpdateFromSqlQuery("update tblcontact set status='Replied' where email='"+email+"'");
				response.sendRedirect("admin-view-inquiry.jsp");
			} else {
				response.sendRedirect("admin-view-inquiry.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
