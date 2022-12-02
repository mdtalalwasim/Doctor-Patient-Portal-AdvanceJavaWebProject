


<!-- for jstl tag -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- end of jstl tag -->

<%@page isELIgnored="false"%>


<nav class="navbar navbar-expand-lg navbar-dark bg-success">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa-sharp fa-solid fa-hospital"></i> Doctor Patient Portal</a>
		<!-- 		<a class="navbar-brand" href="index.jsp"><i
			class="fa-solid fa-house-chimney-medical"></i> E-HOSPITAL</a> -->
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<!-- original ul <ul class="navbar-nav me-auto mb-2 mb-lg-0"> -->
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp"><i class="fa fa-home"></i>
						HOME</a></li>

				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="patient.jsp"><i
						class="fa fa-wheelchair"></i> PATIENT</a></li>
			</ul>

			<div class="dropdown">
				<button class="btn btn-outline-light dropdown-toggle" type="button"
					id="dropdownMenuButton1" data-bs-toggle="dropdown"
					aria-expanded="false">
					<i class="fa-solid fa-user-doctor"></i> ${ doctorObj.fullName}
				</button>
				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
					<li><a class="dropdown-item" href="edit_profile.jsp">Edit
							Profile</a></li>
					<li><a class="dropdown-item" href="../doctorLogout">Logout</a></li>

				</ul>
			</div>


		</div>
	</div>
</nav>