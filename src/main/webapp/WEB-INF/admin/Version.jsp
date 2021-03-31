<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:url value="/admin/version/search" var="verSearch" />
	<c:url value="/admin/version/update" var="verUpd" />
	<c:url value="/admin/version/del" var="verDel" />
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1 class="pageModule" data-module="dsPkmVersion">Version</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active">Version</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<s:form action="${verSearch }" method="post"
					modelAttribute="version" acceptCharset="utf-8">
					<div class="row">
						<div class="col-md-10 offset-md-1">
							<div class="form-group">
								<div class="input-group input-group-lg">
									<input type="search" class="form-control form-control-lg"
										name="keyword" placeholder="Type your keywords here">
									<div class="input-group-append">
										<button type="submit" class="btn btn-lg btn-default">
											<i class="fa fa-search"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</s:form>
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header"></div>
							<!-- /.card-header -->
							<div class="card-body">
								<table id="pokedex" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>Version</th>
											<th>Release Date</th>
											<th>Platform</th>
											<th>Director</th>
											<th>Gameplay</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${not empty lstVer }">
											<c:forEach var="ver" items="${lstVer }">
												<tr>
													<td>${ver.version }</td>
													<td>${ver.releaseDate }</td>
													<td>${ver.platForm }</td>
													<td>${ver.director }</td>
													<td>${ver.gamePlay }</td>
													
													<td><a class="btnSua" style="display:none;" href="${verUpd }/${ver.id}">Sửa</a> <a
														onclick="return confirm('Bạn có chắn chắn muốn xoá pokemon này không ?');"
														href="${verDel}/${ver.id}" class="btnXoa" style="display:none;">Xoá</a></td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							</div>
							<!-- /.card-body -->
						</div>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- /.content -->
	</div>

	<!-- jQuery -->

	<!-- Bootstrap 4 -->
	<script
		src="<c:url value="/resources/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
	<!-- DataTables  & Plugins -->
	<script
		src="<c:url value="/resources/admin/plugins/datatables/jquery.dataTables.min.js"/>"></script>
	<script
		src="<c:url value="/resources/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"/>"></script>
	<script
		src="<c:url value="/resources/admin/plugins/datatables-responsive/js/dataTables.responsive.min.js"/>"></script>
	<script
		src="<c:url value="/resources/admin/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"/>"></script>
	<script
		src="<c:url value="/resources/admin/plugins/datatables-buttons/js/dataTables.buttons.min.js"/>"></script>
	<script
		src="<c:url value="/resources/admin/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"/>"></script>
	<script
		src="<c:url value="/resources/admin/plugins/jszip/jszip.min.js"/>"></script>
	<script
		src="<c:url value="/resources/admin/plugins/pdfmake/pdfmake.min.js"/>"></script>
	<script
		src="<c:url value="/resources/admin/plugins/pdfmake/vfs_fonts.js"/>"></script>

	<!-- AdminLTE App -->
	<script src="<c:url value="/resources/admin/dist/js/adminlte.min.js"/>"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="<c:url value="/resources/admin/dist/js/demo.js"/>"></script>
	<!-- Page specific script -->
	<!-- Page specific script -->

	<script type="text/javascript">
		$(document).ready(function(){
			$('#pokedex').DataTable({
                "paging": true,
                "lengthChange": false,
                "searching": false,
                "ordering": true,
                "info": true,
                "autoWidth": false,
                "responsive": true,
            });
			$('.type2').each(function(){
				var type2 = $(this).html();

				if(type2 == 'none'){
					$(this).html("");
				}
			});
			
		});
	</script>
</body>
</html>