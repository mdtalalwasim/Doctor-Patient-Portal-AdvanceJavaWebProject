<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.dao.DoctorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- for jstl tag -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- end of jstl tag -->

<%@page isELIgnored="false"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin page</title>
<%@include file="../component/allcss.jsp"%>



<!-- customs css for this page -->
<style type="text/css">
.my-card {
	box-shadow: 0px 0px 10px 1px maroon;
	/*box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.3);*/
}
</style>
<!-- end of customs css for this page -->


</head>
<body>
	<%@include file="navbar.jsp"%>

	<!-- adminObj session maintain if "adminObj" empty than go and login first...-->
	<!-- no one can access admin dashboard without login as admin-->
	<c:if test="${empty adminObj }">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>



	<div class="container p-5">
		<p class="text-center text-danger fs-3">Admin Dashboard</p>

		<!-- message print -->
		<!-- for success msg -->
		<c:if test="${not empty successMsg }">
			<p class="text-center text-success fs-5">${successMsg}</p>
			<c:remove var="successMsg" scope="session" />
		</c:if>

		<!-- for error msg -->
		<c:if test="${not empty errorMsg }">
			<p class="text-center text-danger fs-5">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session" />
		</c:if>
		<!-- End of message print -->

		<!-- create connection with db and others -->
		<% 
		DoctorDAO docDAO = new DoctorDAO(DBConnection.getConn());
		int totalNumberOfDoctor = docDAO.countTotalDoctor();
		int totalNumberOfUser = docDAO.countTotalUser();
		int totalNumberOfAppointment = docDAO.countTotalAppointment();
		int totalNumberOfSpecialist = docDAO.countTotalSpecialist();
		%>

		<!-- row-1 -->
		<div class="row">
			<div class="col-md-4">
				<div class="card my-card">
					<div class="card-body text-center text-danger">
						<i class="fa-solid fa-user-doctor fa-3x"></i><br>
						<p class="fs-4 text-center">
							Doctor <br><%= totalNumberOfDoctor %>

						</p>
					</div>
				</div>

			</div>
			<div class="col-md-4">
				<div class="card my-card">
					<div class="card-body text-center text-danger">
						<i class="fas fa-user-circle fa-3x"></i><br>
						<p class="fs-4 text-center">
							User <br><%= totalNumberOfUser %>
						</p>
					</div>
				</div>

			</div>
			<div class="col-md-4">
				<div class="card my-card">
					<div class="card-body text-center text-danger">
						<i class="fa-solid fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointment <br><%= totalNumberOfAppointment %>
						</p>
					</div>
				</div>

			</div>
			<div class="col-md-4 mt-2">
				<div class="card my-card" data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<div class="card-body text-center text-danger">
						<i class="fa-solid fa-user-doctor fa-3x"></i><br>
						<p class="fs-4 text-center">
							Specialist <br><%= totalNumberOfSpecialist %>
						</p>
					</div>
				</div>

			</div>
		</div>


	</div>



	<!-- specialis modal -->



	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title text-danger" id="exampleModalLabel">Add Specialist</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<form action="../addSpecialist" method="post">

						<div class="form-group">
							<label class="form-label">Enter Specialist Name</label> <input type="text"
								name="specialistName" placeholder="Enter Specialist Name" class="form-control" />
						</div>
						<div class="text-center mt-2">
							<button type="submit" class="btn btn-outline-danger ">Add</button>
						</div>

					</form>



				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>

	<!-- end of specialis modal -->





</body>
</html>