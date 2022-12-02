<%@page import="com.hms.entity.Doctor"%>
<%@page import="com.hms.dao.DoctorDAO"%>
<%@page import="com.hms.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.dao.SpecialistDAO"%>
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
<title>Doctor page</title>
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


	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-5 offset-4">
				<div class="card my-card">
					<div class="card-body">
						<p class="fs-3 text-center text-danger">Add Doctor</p>

						<!-- message print -->
						<!-- for success msg -->
						<c:if test="${not empty successMsg }">
							<p class="text-center text-success fs-3">${successMsg}</p>
							<c:remove var="successMsg" scope="session" />
						</c:if>

						<!-- for error msg -->
						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-3">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<!-- End of message print -->

						<!-- boostrap form -->
						<form action="../addDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input
									name="fullName" type="text" placeholder="Enter full name"
									class="form-control">

							</div>
							<div class="mb-3">
								<label class="form-label">Date of Birth</label> <input
									name="dateOfBirth" type="date" placeholder="Enter DOB"
									class="form-control">

							</div>
							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
									name="qualification" type="text"
									placeholder="Enter qualification" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Specialist</label> <select
									class="form-control" name="specialist">
									<option disabled="disabled" selected="selected">---Select---</option>

									<%
									SpecialistDAO spDAO = new SpecialistDAO(DBConnection.getConn());
									List<Specialist> spList = spDAO.getAllSpecialist();
									for (Specialist sp : spList) {
									%>
									<option>
										<%=sp.getSpecialistName()%>
									</option>
									<%
									}
									%>

								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email address</label> <input
									name="email" type="email" placeholder="Enter Email"
									class="form-control">

							</div>
							<div class="mb-3">
								<label class="form-label">Phone</label> <input name="phone"
									type="text" placeholder="Enter mobile number"
									class="form-control">

							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input
									name="password" type="password" placeholder="Enter password"
									class="form-control">
							</div>

							<button type="submit" class="btn btn-danger text-white col-md-12">Register</button>
						</form>
						<!-- <br>Don't have an account? <a href="#!"
							class="text-decoration-none">create one</a> -->
						<!-- end of boostrap form -->

					</div>

				</div>
			</div>
			
		</div>
	</div>









</body>
</html>