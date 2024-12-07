package com.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class AdminEditJobInfo
 */
@WebServlet("/AdminEditJobInfo")
public class AdminEditJobInfo extends HttpServlet {
	private final String UPLOAD_DIRECTORY = "F:/workspace/SmartCity/WebContent/uploads/";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				String imageName = null;
				String jobid = null;
				String category = null;
				String companyName = null;
				String description = null;
				String vacancies = null;
				String contact = null;
				String state = null;
				String city = null;
				String address = null;
				String emailId = null;

				for (FileItem item : multiparts) {
					if (!item.isFormField()) {

						imageName = new File(item.getName()).getName();
						System.out.println("Image Name==>>" + imageName);
						
						if (imageName != null && !imageName.isEmpty()) {
							item.write(new File(UPLOAD_DIRECTORY + File.separator + imageName));
						} else {
							FileItem image = (FileItem) multiparts.get(10);
							imageName = image.getString();
						}

						FileItem jobId = (FileItem) multiparts.get(0);
						jobid = jobId.getString();

						FileItem jCategory = (FileItem) multiparts.get(1);
						category = jCategory.getString();

						FileItem cname = (FileItem) multiparts.get(2);
						companyName = cname.getString();
						
						FileItem jobDescription = (FileItem) multiparts.get(3);
						description = jobDescription.getString();
						
						FileItem jobVacancies = (FileItem) multiparts.get(4);
						vacancies = jobVacancies.getString();
						
						FileItem jobContact = (FileItem) multiparts.get(5);
						contact = jobContact.getString();

						FileItem jobState = (FileItem) multiparts.get(6);
						state = jobState.getString();

						FileItem jobCity = (FileItem) multiparts.get(7);
						city = jobCity.getString();

						FileItem jobAddress = (FileItem) multiparts.get(8);
						address = jobAddress.getString();

						FileItem jobEmail = (FileItem) multiparts.get(9);
						emailId = jobEmail.getString();

					}
				}
				try {

					String imagePath = UPLOAD_DIRECTORY + imageName;

					if (imageName == null || imageName.isEmpty()) {

						int i = DatabaseConnection.insertUpdateFromSqlQuery(
								"update tbljobsinfo set category='" + category + "',company_name='" + companyName + "',description='"
										+ description + "',vacancies='" + vacancies + "',contact_number='"+contact+"',state='"+state+"',city='"+city+"',address='"+address+"',officeMailId='"+emailId+"' where jobid='" + jobid + "'");
						if (i > 0) {
							String success = "Job info edit successfully.";
							session.setAttribute("addedMessage", success);
							response.sendRedirect("admin-view-job-details.jsp");
						}
					} else {

						int i = DatabaseConnection.insertUpdateFromSqlQuery(
								"update tbljobsinfo set category='" + category + "',company_name='" + companyName + "',description='"
										+ description + "',vacancies='" + vacancies + "',contact_number='"+contact+"',state='"+state+"',city='"+city+"',address='"+address+"',officeMailId='"+emailId+"',image='"+imageName+"',image_path='"+imagePath+"' where jobid='" + jobid + "'");
						if (i > 0) {
							String success = "Job info edit successfully.";
							session.setAttribute("addedMessage", success);
							response.sendRedirect("admin-view-job-details.jsp");
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			} catch (Exception ex) {
				request.setAttribute("message", "File Upload Failed due to " + ex);
			}

		} else {
			request.setAttribute("message", "Sorry this Servlet only handles file upload request");
		}
	}
}
