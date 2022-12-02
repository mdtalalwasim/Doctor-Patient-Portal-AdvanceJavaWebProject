package com.hms.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.dao.DoctorDAO;
import com.hms.db.DBConnection;
import com.hms.entity.Doctor;

@WebServlet("/doctorEditProfile")
public class DoctorEditProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			// get all data which is coming from doctor.jsp doctor details
			String fullName = req.getParameter("fullName");
			String dateOfBirth = req.getParameter("dateOfBirth");
			String qualification = req.getParameter("qualification");
			String specialist = req.getParameter("specialist");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			//String password = req.getParameter("password");

			
			int id = Integer.parseInt(req.getParameter("doctorId"));

			Doctor doctor = new Doctor(id, fullName, dateOfBirth, qualification, specialist, email, phone, "");

			DoctorDAO docDAO = new DoctorDAO(DBConnection.getConn());

			boolean f = docDAO.editDoctorProfile(doctor);

			HttpSession session = req.getSession();

			if (f == true) {
				Doctor updateDoctorObj = docDAO.getDoctorById(id);
				session.setAttribute("successMsgForD", "Doctor update Successfully");
				session.setAttribute("doctorObj", updateDoctorObj); // over ride or update old session value to new updated doctor value.
				resp.sendRedirect("doctor/edit_profile.jsp");

			} else {
				session.setAttribute("errorMsgForD", "Something went wrong on server!");
				resp.sendRedirect("doctor/edit_profile.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
