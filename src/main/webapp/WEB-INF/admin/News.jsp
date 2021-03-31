<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:url value="/admin/news/search" var="newsSearch" />
	<c:url value="/admin/news/update" var="newsUpd" />
	<c:url value="/admin/news/del" var="newsDel" />
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1 class="pageModule" data-module="dsPkmNews">Pokedex</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active">Pokedex</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<s:form action="${newsSearch }" method="post"
					modelAttribute="news" acceptCharset="utf-8">
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
								<table id="pkmNews" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>Avatar</th>
											<th>Tiêu đề</th>

											<th>Tác giả</th>
											<th>Người tạo</th>
											<th>Người duyệt</th>
											<th>Ngày tạo</th>
											<th>Ngày duyệt</th>
											<th>Trạng thái</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${not empty lstNews }">
											<c:forEach var="n" items="${lstNews }">
												<tr>
													<td>${n.avatar }</td>
													<td>${n.tieuDe }</td>
													<td>${n.tacGia }</td>
													<td>${n.nguoiTaoID }</td>
													<td>${n.nguoiDuyetID }</td>
													<td><fmt:formatDate value="${n.ngayTao}"
															var="dateString" pattern="dd/MM/yyyy" /> ${n.ngayTao}</td>
													<td><fmt:formatDate value="${n.ngayDuyet}"
															var="dateString" pattern="dd/MM/yyyy" />
														${n.ngayDuyet}</td>
													<td>${n.trangThai }</td>
													<td><a class="btnSua" style="display:none;" href="${newsUpd }/${n.id}">Sửa</a> <a
														onclick="return confirm('Bạn có chắn chắn muốn xoá pokemon này không ?');"
														href="${newsDel}/${n.id}" class="btnXoa" style="display:none;">Xoá</a></td>
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
	<script src="<c:url value="/resources/home/js/jquery-3.4.1.min.js"/>"></script>
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

	<script>
        $(function () {
            $('#pkmNews').DataTable({
                "paging": true,
                "lengthChange": false,
                "searching": false,
                "ordering": true,
                "info": true,
                "autoWidth": false,
                "responsive": true,
            });
        });
    </script>
</body>
</html>