package com.admin;

import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
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
 * Servlet implementation class AddJobsInfo
 */
@WebServlet("/AddJobsInfo")
public class AddJobsInfo extends HttpServlet {
	private final String UPLOAD_DIRECTORY = "F:/workspace/SmartCity/WebContent/uploads/";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				String imageName = null;
				String category = null;
				String cname=null;
				String description = null;
				String vaccancies = null;
				String contactInfo=null;
				String state = null;
				String city = null;
				String address = null;
				String email=null;
				

				for (FileItem item : multiparts) {
					if (!item.isFormField()) {
						imageName = new File(item.getName()).getName();
						item.write(new File(UPLOAD_DIRECTORY + File.separator + imageName));

						FileItem pCategory = (FileItem) multiparts.get(0);
						category = pCategory.getString();

						FileItem companyName = (FileItem) multiparts.get(1);
						cname = companyName.getString();
						
						FileItem pDescription = (FileItem) multiparts.get(2);
						description = pDescription.getString();
						
						FileItem jobVaccancies = (FileItem) multiparts.get(3);
						vaccancies = jobVaccancies.getString();
						
						FileItem contact = (FileItem) multiparts.get(4);
						contactInfo = contact.getString();

						FileItem pState = (FileItem) multiparts.get(5);
						state = pState.getString();

						FileItem pCity = (FileItem) multiparts.get(6);
						city = pCity.getString();

						FileItem pAddress = (FileItem) multiparts.get(7);
						address = pAddress.getString();

						FileItem officialEmail = (FileItem) multiparts.get(8);
						email = officialEmail.getString();

					}
				}
				try {
					int jobId = DatabaseConnection.generateJobId();
					String imagePath = UPLOAD_DIRECTORY + imageName;

					ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tbljobsinfo where company_name='" + cname + "'");
					if (resultset.next()) {
						String message = "Job info already exist";
						session.setAttribute("already-exist", message);
						response.sendRedirect("admin-add-job.jsp");
					} else {
						int i = DatabaseConnection.insertUpdateFromSqlQuery(
								"insert into tbljobsinfo(jobid,category,company_name,description,vacancies,contact_number,state,city,address,officeMailId,image,image_path) values('"
										+ jobId + "','"+category+"','" + cname + "','" + description + "','"+vaccancies+"','"+contactInfo+"','" + state + "','" + city + "','"
										+ address + "','" + email + "','" + imageName + "','" + imagePath + "')");
						if (i > 0) {
							String success = "Jobs info added successfully.";
							session.setAttribute("addedMessage", success);
							response.sendRedirect("admin-add-job.jsp");
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
