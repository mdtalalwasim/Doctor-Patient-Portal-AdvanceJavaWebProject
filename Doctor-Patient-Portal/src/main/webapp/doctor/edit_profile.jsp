<%@page import="java.util.List"%>
<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.entity.Specialist"%>
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
<title>Edit Doctor | Doctor</title>
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

	<!-- if "doctorObj" is empty means no one is login. -->

	<c:if test="${empty doctorObj }">

		<c:redirect url="../doctor_login.jsp"></c:redirect>

	</c:if>

	<!-- check is doctor is login or not -->

	<div class="container p-4">
		<div class="row">
			<div class="col-md-4">
				<div class="card my-card">

					<div class="card-body">
						<p class="fs-3 text-center text-success">Change Password</p>

						<!-- for message -->
						<!-- success message -->
						<c:if test="${not empty successMsg }">
							<p class="text-center text-success fs-5">${successMsg}</p>
							<c:remove var="successMsg" scope="session" />
						</c:if>

						<!-- error message -->
						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<!-- end of message -->

						<!-- doctor change password form -->

						<form action="../doctorChangePassword" method="post">
							<div class="mb-3">
								<label class="form-label">Enter New Password</label> <input
									name="newPassword" type="password"
									placeholder="Enter new password" class="form-control"
									required="required">

							</div>
							<div class="mb-3">
								<label class="form-label">Enter Old Password</label> <input
									name="oldPassword" type="password"
									placeholder="Enter old password" class="form-control" required>
							</div>
							<input type="hidden" value="${doctorObj.id}" name="doctorId">

							<button type="submit" class="btn btn-success col-md-12">Change
								Password</button>
						</form>
						<!-- doctor change password form -->
					</div>
				</div>

			</div>

			<!-- doctor edit -->

			<div class="col-md-6  offset-md-2">
				<div class="card my-card">

					<div class="card-body">
						<p class="fs-3 text-center text-success">Edit Doctor Profile</p>

						<!-- for message -->
						<!-- success message -->
						<c:if test="${not empty successMsgForD }">
							<p class="text-center text-success fs-5">${successMsgForD}</p>
							<c:remove var="successMsgForD" scope="session" />
						</c:if>

						<!-- error message -->
						<c:if test="${not empty errorMsgForD }">
							<p class="text-center text-danger fs-5">${errorMsgForD}</p>
							<c:remove var="errorMsgForD" scope="session" />
						</c:if>
						<!-- end of message -->


						


							<!-- boostrap form -->
							<form action="../doctorEditProfile" method="post">
								<div class="mb-3">
									<label class="form-label">Full Name</label> <input
										name="fullName" type="text" placeholder="Enter full name"
										class="form-control" value="${doctorObj.fullName}">

								</div>
								<div class="mb-3">
									<label class="form-label">Date of Birth</label> <input
										name="dateOfBirth" type="date" placeholder="Enter DOB"
										class="form-control" value="${doctorObj.dateOfBirth}">

								</div>
								<div class="mb-3">
									<label class="form-label">Qualification</label> <input
										name="qualification" type="text"
										placeholder="Enter qualification" class="form-control"
										value="${doctorObj.qualification}">
								</div>

								<div class="mb-3">
									<label class="form-label">Specialist</label> <select
										class="form-control" name="specialist">
										<option>${ doctorObj.specialist }</option>

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
										class="form-control" readonly value="${doctorObj.email}">

								</div>
								<div class="mb-3">
									<label class="form-label">Phone</label> <input name="phone"
										type="text" placeholder="Enter mobile number"
										class="form-control" value="${doctorObj.phone}">

								</div>
								
								<input type="hidden" value="${doctorObj.id}" name="doctorId">


								<button type="submit"
									class="btn btn-success text-white col-md-12">Update</button>
							</form>
						
					</div>
				</div>

			</div>

			<!-- doctor edit -->

		</div>
	</div>

</body>
</html>