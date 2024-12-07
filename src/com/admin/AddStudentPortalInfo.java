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
 * Servlet implementation class AddStudentPortalInfo
 */
@WebServlet("/AddStudentPortalInfo")
public class AddStudentPortalInfo extends HttpServlet {
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
				String place = null;
				String state = null;
				String city = null;
				String address = null;
				String description = null;

				for (FileItem item : multiparts) {
					if (!item.isFormField()) {
						imageName = new File(item.getName()).getName();
						item.write(new File(UPLOAD_DIRECTORY + File.separator + imageName));

						FileItem pCategory = (FileItem) multiparts.get(0);
						category = pCategory.getString();

						FileItem placeName = (FileItem) multiparts.get(1);
						place = placeName.getString();

						FileItem pState = (FileItem) multiparts.get(2);
						state = pState.getString();

						FileItem pCity = (FileItem) multiparts.get(3);
						city = pCity.getString();

						FileItem pAddress = (FileItem) multiparts.get(4);
						address = pAddress.getString();

						FileItem pDescription = (FileItem) multiparts.get(5);
						description = pDescription.getString();

					}
				}
				try {
					int pid = DatabaseConnection.generatePlaceId();
					String imagePath = UPLOAD_DIRECTORY + imageName;

					ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblstudentinfo where place='" + place + "'");
					if (resultset.next()) {
						String message = "Place info already exist";
						session.setAttribute("already-exist", message);
						response.sendRedirect("admin-add-student-portal.jsp");
					} else {
						int i = DatabaseConnection.insertUpdateFromSqlQuery(
								"insert into tblstudentinfo(pid,category,place,state,city,address,description,image,image_path) values('"
										+ pid + "','" + category + "','" + place + "','" + state + "','" + city + "','"
										+ address + "','" + description + "','" + imageName + "','" + imagePath + "')");
						if (i > 0) {
							String success = "Student portal info added successfully.";
							session.setAttribute("addedMessage", success);
							response.sendRedirect("admin-add-student-portal.jsp");
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
