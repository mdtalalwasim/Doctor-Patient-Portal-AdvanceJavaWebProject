<!-- for jstl tag -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- end of jstl tag -->

<%@page isELIgnored="false"%>

<!-- <i class="fa-sharp fa-solid fa-hospital"></i> -->

<!-- <nav class="navbar navbar-expand-lg navbar-dark bg-danger"> -->
<nav class="navbar navbar-expand-lg navbar-dark"style="background-color: #4568dc;">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><i class="fa-sharp fa-solid fa-hospital"></i> Doctor Patient Portal</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<!-- original ul <ul class="navbar-nav me-auto mb-2 mb-lg-0"> -->
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">

				<!-- if user not logged in then user can see below items -->
				<!-- to create dynamic navbar -->

				<c:if test="${empty userObj}">

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="admin_login.jsp"><i
							class="fa-solid fa-right-to-bracket"></i> ADMIN</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="doctor_login.jsp">
						<i class="fas fa-sign-in-alt"></i> DOCTOR</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="user_appointment.jsp"><i class="fa fa-book fa-1x"></i> APPOINTMENT</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="user_login.jsp"><i class="fas fa-sign-in-alt"></i> USER</a></li>

				</c:if>

				<!-- end if user not logged in then user can see below items -->



				<!-- if user is logged in then user can see below items -->
				<!-- to create dynamic navbar -->

				<c:if test="${not empty userObj }">
					<!-- means user is log in -->
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="user_appointment.jsp"><i class="fa fa-book fa-1x"></i> APPOINTMENT</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="view_appointment.jsp"><i class="fa fa-calendar-check-o"></i> VIEW APPOINTMENT</a></li>




					<div class="dropdown">
						<button class="btn btn-outline-light dropdown-toggle" type="button"
							id="dropdownMenuButton1" data-bs-toggle="dropdown"
							aria-expanded="false">
							<i class="fa-solid fa-circle-user"></i> ${userObj.fullName}
						</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							<li><a class="dropdown-item" href="change_password.jsp">Change Password</a></li>
							<li><a class="dropdown-item" href="userLogout">Logout</a></li>

						</ul>
					</div>


					<%-- <li class="nav-item dropdown active"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="fa-solid fa-circle-user"></i> ${userObj.fullName}
					</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Change Password</a></li>
							<li><a class="dropdown-item" href="#">Logout</a></li>

						</ul></li> --%>

				</c:if>
				<!-- end of if user is logged in then user can see below items -->








			</ul>

		</div>
	</div>
</nav>