package com.admin;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class AddCityInfo
 */
@WebServlet("/AddCityInfo")
public class AddCityInfo extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int cityId = 0;
		String cname = request.getParameter("cname");
		String population = request.getParameter("population");
		double area = Double.parseDouble(request.getParameter("area"));
		String description = request.getParameter("description");
		HttpSession hs = request.getSession();

		try {
			ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblcityinfo where city_name='" + cname + "'");
			if (resultset.next()) {
				String error = "This city already exist, please add another one";
				hs.setAttribute("error", error);
				response.sendRedirect("admin-add-city-details.jsp");
			} else {
				int addCity = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblcityinfo(city_id,city_name,population,area,description)values('" + cityId
								+ "','" + cname + "','" + population + "','" + area + "','" + description + "')");
				if (addCity > 0) {
					String message = "City info added successfully.";
					hs.setAttribute("cityInfo", message);
					response.sendRedirect("admin-add-city-details.jsp");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
