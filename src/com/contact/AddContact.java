package com.contact;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class AddContact
 */
@WebServlet("/AddContact")
public class AddContact extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = 0;
		String status="Pending";
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");
		HttpSession hs=request.getSession();

		try {
			int addContact = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblcontact(contact_id,name,email,subject,message,status) values ('"+ id + "','" + name + "','" + email + "','" + subject + "','" + message + "','"+status+"')");
			if (addContact > 0) {
				String success="Thanks for contacting with us, we will get in touch with you.";
				hs.setAttribute("success", success);
				response.sendRedirect("contact.jsp");
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
