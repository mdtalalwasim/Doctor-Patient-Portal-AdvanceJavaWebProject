package com.hms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

//import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;

import com.hms.entity.Doctor;

public class DoctorDAO {

	private Connection conn;

	public DoctorDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean registerDoctor(Doctor doctor) {

		boolean f = false;

		try {

			String sql = "insert into doctor(fullName,dateOfBirth,qualification,specialist,email,phone,password) values(?,?,?,?,?,?,?)";

			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, doctor.getFullName());
			pstmt.setString(2, doctor.getDateOfBirth());
			pstmt.setString(3, doctor.getQualification());
			pstmt.setString(4, doctor.getSpecialist());
			pstmt.setString(5, doctor.getEmail());
			pstmt.setString(6, doctor.getPhone());
			pstmt.setString(7, doctor.getPassword());

			pstmt.executeUpdate();
			// if query inserted or all ok than
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	// getAllDoctors list
	public List<Doctor> getAllDoctor() {

		Doctor doctor = null;
		List<Doctor> docList = new ArrayList<Doctor>();

		try {

			String sql = "select * from doctor order by id desc";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);

			ResultSet resultSet = pstmt.executeQuery();

			while (resultSet.next()) {
				doctor = new Doctor();

				doctor.setId(resultSet.getInt("id"));
				doctor.setFullName(resultSet.getString("fullName"));
				doctor.setDateOfBirth(resultSet.getString("dateOfBirth"));
				doctor.setQualification(resultSet.getString("qualification"));
				doctor.setSpecialist(resultSet.getString("specialist"));
				doctor.setEmail(resultSet.getString("email"));
				doctor.setPhone(resultSet.getString("phone"));
				doctor.setPassword(resultSet.getString("password"));
				docList.add(doctor);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return docList;
	}

	// get doctor by id
	public Doctor getDoctorById(int id) {

		Doctor doctor = null;

		try {

			String sql = "select * from doctor where id=?";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, id);

			ResultSet resultSet = pstmt.executeQuery();

			while (resultSet.next()) {
				doctor = new Doctor();

				doctor.setId(resultSet.getInt("id"));
				doctor.setFullName(resultSet.getString("fullName"));
				doctor.setDateOfBirth(resultSet.getString("dateOfBirth"));
				doctor.setQualification(resultSet.getString("qualification"));
				doctor.setSpecialist(resultSet.getString("specialist"));
				doctor.setEmail(resultSet.getString("email"));
				doctor.setPhone(resultSet.getString("phone"));
				doctor.setPassword(resultSet.getString("password"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return doctor;
	}

	// update doctors by id
	public boolean updateDoctor(Doctor doctor) {

		boolean f = false;

		try {

			String sql = "update doctor set fullName=?,dateOfBirth=?,qualification=?,specialist=?,email=?,phone=?,password=? where id=?";

			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, doctor.getFullName());
			pstmt.setString(2, doctor.getDateOfBirth());
			pstmt.setString(3, doctor.getQualification());
			pstmt.setString(4, doctor.getSpecialist());
			pstmt.setString(5, doctor.getEmail());
			pstmt.setString(6, doctor.getPhone());
			pstmt.setString(7, doctor.getPassword());
			// need to set id also for update
			pstmt.setInt(8, doctor.getId());

			pstmt.executeUpdate();
			// if query updated or all ok than
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	// delete doctors by id
	public boolean deleteDoctorById(int id) {

		boolean f = false;

		try {

			String sql = "delete from doctor where id=?";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, id);

			pstmt.executeUpdate();

			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	// doctor login
	public Doctor loginDoctor(String email, String password) {

		Doctor doctor = null;

		try {

			String sql = "select * from doctor where email=? and password=?";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);

			pstmt.setString(1, email);
			pstmt.setString(2, password);

			ResultSet resultSet = pstmt.executeQuery();

			while (resultSet.next()) {
				doctor = new Doctor();

				/*
				 * doctor.setId(resultSet.getInt("id"));
				 * doctor.setFullName(resultSet.getString("fullName"));
				 * doctor.setDateOfBirth(resultSet.getString("dateOfBirth"));
				 * doctor.setQualification(resultSet.getString("qualification"));
				 * doctor.setSpecialist(resultSet.getString("specialist"));
				 * doctor.setEmail(resultSet.getString("email"));
				 * doctor.setPhone(resultSet.getString("phone"));
				 * doctor.setPassword(resultSet.getString("password"));
				 */
				// we can write above commented code or
				// or
				// the below way [here 1 2 3..serially are the column index number of doctor
				// table]

				doctor.setId(resultSet.getInt(1));
				doctor.setFullName(resultSet.getString(2));
				doctor.setDateOfBirth(resultSet.getString(3));
				doctor.setQualification(resultSet.getString(4));
				doctor.setSpecialist(resultSet.getString(5));
				doctor.setEmail(resultSet.getString(6));
				doctor.setPhone(resultSet.getString(7));
				doctor.setPassword(resultSet.getString(8));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return doctor;

	}

	// show total number of dynamic value in admin panel

	// create all count method here to reduce code line...
	// Count total Doctor Number
	public int countTotalDoctor() {

		int i = 0;

		try {

			String sql = "select * from doctor";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);

			ResultSet resultSet = pstmt.executeQuery();
			while (resultSet.next()) {

				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}

	// Count total Appointment Number
	public int countTotalAppointment() {

		int i = 0;

		try {

			String sql = "select * from appointment";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);

			ResultSet resultSet = pstmt.executeQuery();
			while (resultSet.next()) {

				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}

	// Count total number of Appointment for a specific doctor
	public int countTotalAppointmentByDoctorId(int doctorId) {

		int i = 0;

		try {

			String sql = "select * from appointment where doctorId=?";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, doctorId);

			ResultSet resultSet = pstmt.executeQuery();
			while (resultSet.next()) {

				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}

	// Count total User Number
	public int countTotalUser() {

		int i = 0;

		try {

			String sql = "select * from user_details";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);

			ResultSet resultSet = pstmt.executeQuery();
			while (resultSet.next()) {

				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}

	// Count total Specialist Number
	public int countTotalSpecialist() {

		int i = 0;

		try {

			String sql = "select * from specialist";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);

			ResultSet resultSet = pstmt.executeQuery();
			while (resultSet.next()) {

				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}

	// check old password
	public boolean checkOldPassword(int doctorId, String oldPassword) {

		boolean f = false;

		try {

			String sql = "select * from doctor where id=? and password=?";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, doctorId);
			pstmt.setString(2, oldPassword);

			ResultSet resultSet = pstmt.executeQuery();

			while (resultSet.next()) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	// change password
	public boolean changePassword(int doctorId, String newPassword) {

		boolean f = false;

		try {

			String sql = "update doctor set password=? where id=?";
			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, newPassword);
			pstmt.setInt(2, doctorId);

			pstmt.executeUpdate();

			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	// edit doctor profile in doctor panel edit profile
	public boolean editDoctorProfile(Doctor doctor) {

		boolean f = false;

		try {

			//String sql = "update doctor set fullName=?,dateOfBirth=?,qualification=?,specialist=?,email=?,phone=?,password=? where id=?";
			String sql = "update doctor set fullName=?,dateOfBirth=?,qualification=?,specialist=?,email=?,phone=? where id=?";

			PreparedStatement pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, doctor.getFullName());
			pstmt.setString(2, doctor.getDateOfBirth());
			pstmt.setString(3, doctor.getQualification());
			pstmt.setString(4, doctor.getSpecialist());
			pstmt.setString(5, doctor.getEmail());
			pstmt.setString(6, doctor.getPhone());
			//pstmt.setString(7, doctor.getPassword());
			// need to set id also for update
			pstmt.setInt(7, doctor.getId());

			pstmt.executeUpdate();
			// if query updated or all okay than
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

}
