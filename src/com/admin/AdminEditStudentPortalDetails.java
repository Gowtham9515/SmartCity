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
 * Servlet implementation class AdminEditStudentPortalDetails
 */
@WebServlet("/AdminEditStudentPortalDetails")
public class AdminEditStudentPortalDetails extends HttpServlet {
	private final String UPLOAD_DIRECTORY = "F:/workspace/SmartCity/WebContent/uploads/";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				String imageName = null;
				String pid = null;
				String category = null;
				String place = null;
				String state = null;
				String city = null;
				String address = null;
				String description = null;

				for (FileItem item : multiparts) {
					if (!item.isFormField()) {

						imageName = new File(item.getName()).getName();
						System.out.println("Image Name==>>" + imageName);
						if (imageName != null && !imageName.isEmpty()) {
							item.write(new File(UPLOAD_DIRECTORY + File.separator + imageName));
						} else {
							FileItem image = (FileItem) multiparts.get(7);
							imageName = image.getString();
						}

						FileItem placeId = (FileItem) multiparts.get(0);
						pid = placeId.getString();

						FileItem pCategory = (FileItem) multiparts.get(1);
						category = pCategory.getString();

						FileItem placeName = (FileItem) multiparts.get(2);
						place = placeName.getString();

						FileItem pState = (FileItem) multiparts.get(3);
						state = pState.getString();

						FileItem pCity = (FileItem) multiparts.get(4);
						city = pCity.getString();

						FileItem pAddress = (FileItem) multiparts.get(5);
						address = pAddress.getString();

						FileItem pDescription = (FileItem) multiparts.get(6);
						description = pDescription.getString();

					}
				}
				try {

					String imagePath = UPLOAD_DIRECTORY + imageName;

					if (imageName == null || imageName.isEmpty()) {

						int i = DatabaseConnection.insertUpdateFromSqlQuery("update tblstudentinfo set category='" + category + "',place='" + place + "',address='"+ address + "',description='" + description + "' where pid='" + pid + "'");
						if (i > 0) {
							String success = "Info edit successfully.";
							session.setAttribute("addedMessage", success);
							response.sendRedirect("admin-view-student-portal-details.jsp");
						}
					} else {
						
						int i = DatabaseConnection.insertUpdateFromSqlQuery("update tblstudentinfo set category='" + category+ "',place='" + place + "',address='" + address + "',description='" + description+ "',image='" + imageName + "',image_path='" + imagePath + "' where pid='" + pid + "'");
						if (i > 0) {
							String success = "Info edit successfully.";
							session.setAttribute("addedMessage", success);
							response.sendRedirect("admin-view-student-portal-details.jsp");
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
