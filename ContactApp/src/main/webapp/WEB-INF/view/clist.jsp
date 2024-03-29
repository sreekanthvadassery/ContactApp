<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<title>Contact App | Contact List</title>
<link href="/static/css/bootstrap.min.css" rel="stylesheet">
<link href="/static/css/style.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

	<jsp:include page="include/menu.jsp" />

	<!-- Show All Contacts form Start -->
	<div class="container text-center" id="tasksDiv">
		<h3>All Contacts</h3>
		<hr>

		<!-- Successful Contact Added Start -->
		<c:if test="${param.action eq 'sv' }">
			<div class="alert alert-success">
				<c:out value="New contact added successfully!"></c:out>
			</div>
		</c:if>
		<!-- Successful Contact Added End -->

		<!-- Successful Contact deletion Start -->
		<c:if test="${param.action eq 'del' }">
			<div class="alert alert-success">
				<c:out value="Selected contact(s) deleted successfully!"></c:out>
			</div>
		</c:if>
		<!-- Successful Contact deletion End -->

		<!-- Successful Contact Edit Start -->
		<c:if test="${param.action eq 'ed' }">
			<div class="alert alert-success">
				<c:out value="Selected contact edited successfully!"></c:out>
			</div>
		</c:if>
		<!-- Successful Contact Edit End -->

		<!-- Contact Search start -->
		<form class="form-horizontal" method="POST"
			action="/user/search-contact">
			<input type="text" class="form-control" value="${param.freeText}"
				name="freeText" placeholder="Enter search text" /> <br> <input
				type="submit" class="btn btn-primary" value="Search" />
		</form>
		<!-- Contact Search end -->

		<br>

		<!-- Clear Search button start -->
		<form class="form-horizontal" method="POST" action="/user/clist">
			<input type="submit" class="btn btn-primary"
				value="Clear Search Filters" />
		</form>
		<!-- Clear Search button end -->

		<br>
		<!-- Form for bulk delete starts -->
		<form action="/user/bulk-cdelete">
			<input type="submit" class="btn btn-primary"
				value="Delete Selected Records" />
			
			<div class="table-responsive">
			<br>
				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<!-- <th>Sl#</th> -->
							<th>Select</th>
							<th>ContactID</th>
							<th>Name</th>
							<th>Phone</th>
							<th>Email</th>
							<th>Address</th>
							<th>Remark</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						<!-- No Records present message start -->
						<c:if test="${empty contactList}">
							<tr>
								<td align="center" colspan="9" class="error">No Records	Present</td>
							</tr>
						</c:if>
						<!-- No Records present message end -->
						<!-- Row Iteration start -->
						<c:forEach var="contact" items="${contactList}" varStatus="st">
							<tr>
								<!-- <td>${st.count}</td> -->
								<td><input type="checkbox" name="cid" value="${contact.contactId}" /></td>
								<td>${contact.contactId}</td>
								<td>${contact.name}</td>
								<td>${contact.phone}</td>
								<td>${contact.email}</td>
								<td>${contact.address}</td>
								<td>${contact.remark}</td>
								<!-- Showing 2 ways of passing the contactID in below 2 actions (edit&delete)-->
								<!-- First Way of passing contactId -->
								<td>
									<a href="/user/edit-contact?cid=${contact.contactId}">
										<span class="glyphicon glyphicon-pencil"></span>
									</a>
								</td>
								<!-- Second Way of passing contactId -->
								<!-- Create URL for delete -->
								<s:url var="url_del" value="/user/del-contact">
									<s:param name="cid" value="${contact.contactId}"></s:param>
								</s:url>
								<td>
									<a href="${url_del}">
										<span class="glyphicon glyphicon-trash"></span>
									</a>
								</td>
							</tr>
						</c:forEach>
						<!-- Row Iteration end -->
					</tbody>
				</table>
			</div>
		</form>
		<!-- Form for bulk delete ends -->
	</div>
	<!-- Show All Contacts form End -->

	<p align="center" class="mt-5 mb-3 text-muted">&copy; 2017-2019</p>

	<!-- END SECTION -->
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="/static/js/jquery-1.11.1.min.js"></script>
	<script src="/static/js/bootstrap.min.js"></script>
</body>

</html>