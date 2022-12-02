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
			
			<div class="col-md-12">
				<div class="card my-card">
					<div class="card-body">
						<p class="fs-3 text-center text-danger">List of Doctors</p>

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

						<!-- table for doctor list -->

						<table class="table table-striped">
							<thead>
								<tr class="table-info">
									<!-- <th scope="col">ID</th> -->
									<th scope="col">Full Name</th>
									<th scope="col">DOB</th>
									<th scope="col">Qualification</th>
									<th scope="col">Specialist</th>
									<th scope="col">Email</th>
									<th scope="col">Phone</th>
									<th colspan="2" class="text-center" scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								DoctorDAO docDAO2 = new DoctorDAO(DBConnection.getConn());
								List<Doctor> listOfDoc = docDAO2.getAllDoctor();
								for (Doctor doctorLst : listOfDoc) {
								%>
								<tr>
									<%-- <th scope="row"><%= doctorLst.getId()%></th> --%>
									<th><%=doctorLst.getFullName()%></th>
									<td><%=doctorLst.getDateOfBirth()%></td>
									<td><%=doctorLst.getQualification()%></td>
									<td><%=doctorLst.getSpecialist()%></td>
									<td><%=doctorLst.getEmail()%></td>
									<td><%=doctorLst.getPhone()%></td>


									<td><a class="btn btn-sm btn-primary"
										href="edit_doctor.jsp?id=<%=doctorLst.getId()%>">Edit</a></td>
									<td><a class="btn btn-sm btn-danger" href="../deleteDoctor?id=<%= doctorLst.getId() %>">Delete</a></td>



								</tr>
								<%
								}
								%>


							</tbody>
						</table>

						<!-- end table for doctor list -->


					</div>

				</div>
			</div>
		</div>
	</div>









</body>
</html>