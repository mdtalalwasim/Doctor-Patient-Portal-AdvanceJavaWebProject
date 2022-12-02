package com.hms.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.dao.AppointmentDAO;
import com.hms.db.DBConnection;

@WebServlet("/updateStatus")
public class UpdateStatus extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
		 int 	id = Integer.parseInt(req.getParameter("id"));
		 int 	doctorId = Integer.parseInt(req.getParameter("doctorId"));
		 String comment = req.getParameter("comment");
		 
		 AppointmentDAO appDAO = new AppointmentDAO(DBConnection.getConn());
		 boolean f = appDAO.updateDrAppointmentCommentStatus(id, doctorId, comment);
		 
		 HttpSession session = req.getSession();
		 
		 
		 if(f == true) {
			 session.setAttribute("successMsg", "Comment updated");
			 resp.sendRedirect("doctor/patient.jsp");
			 
		 }else {
			 
			 session.setAttribute("errorMsg", "Something went wrong on server!");
			 resp.sendRedirect("doctor/patient.jsp");
			 
		 }
		 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	
}
