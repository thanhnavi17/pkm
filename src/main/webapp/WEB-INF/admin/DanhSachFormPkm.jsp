<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Select2 -->
<script src="<c:url value="/resources/admin/plugins/select2/js/select2.full.min.js"/>"></script>
</head>
<body>
	<c:url value="/admin/form/search" var="urlFormSearch" />
	<c:url value="/admin/form/update" var="urlFormUpd" />
	<c:url value="/admin/form/del" var="urlFormDel" />
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1 class="pageModule" data-module="dsPkmForm">Pokedex Form</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active">Pokedex Form</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<s:form action="${urlFormSearch }" method="post"
					modelAttribute="pkmForm" acceptCharset="utf-8">
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
							<div class="form-group">
								<div class="row">
								<div class="col-md-6">
									<label>Type:</label>
									<s:select path="type1" class="select2">
										<s:option value="0" label="--- Chọn hệ ---" />
										<s:options items="${lstType }" />
									</s:select>
								</div>
								<div class="col-md-6">
									<label>FormType:</label>
									<s:select path="formType">
										<s:option value="0" label="--- Chọn dạng ---" />
										<s:options items="${lstFormType }" />
									</s:select>
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
											<th>Icon</th>
											<th>Pokemon</th>
											<th>HP</th>
											<th>Attack</th>
											<th>Def</th>
											<th>SpAtk</th>
											<th>SpDef</th>
											<th>Speed</th>
											<th>Type1</th>
											<th>Type2</th>
											<th>FormType</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${not empty lstPokemon }">
											<c:forEach var="pkm" items="${lstPokemon }">
												<tr>
													<td>
														<img src="<c:url value="/images/icon/${pkm.icon }"/>">
													</td>
													<td>${pkm.form }</td>
													<td>${pkm.hp }</td>
													<td>${pkm.atk }</td>
													<td>${pkm.def }</td>
													<td>${pkm.spAtk }</td>
													<td>${pkm.spDef }</td>
													<td>${pkm.speed }</td>
													<td>${pkm.objType1.type }</td>
													<td class="type2">${pkm.objType2.type }</td>
													<td>${pkm.objFormType.formType }</td>
													<td><a class="btnSua" style="display:none;" href="${urlFormUpd }/${pkm.id}">Sửa</a> <a
														onclick="return confirm('Bạn có chắn chắn muốn xoá pokemon này không ?');"
														href="${urlFormDel}/${pkm.id}" class="btnXoa" style="display:none;">Xoá</a></td>
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
    <script src="<c:url value="/resources/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
    <!-- DataTables  & Plugins -->
    <script src="<c:url value="/resources/admin/plugins/datatables/jquery.dataTables.min.js"/>"></script>
    <script src="<c:url value="/resources/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"/>"></script>
    <script src="<c:url value="/resources/admin/plugins/datatables-responsive/js/dataTables.responsive.min.js"/>"></script>
    <script src="<c:url value="/resources/admin/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"/>"></script>
    <script src="<c:url value="/resources/admin/plugins/datatables-buttons/js/dataTables.buttons.min.js"/>"></script>
    <script src="<c:url value="/resources/admin/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"/>"></script>
    <script src="<c:url value="/resources/admin/plugins/jszip/jszip.min.js"/>"></script>
    <script src="<c:url value="/resources/admin/plugins/pdfmake/pdfmake.min.js"/>"></script>
    <script src="<c:url value="/resources/admin/plugins/pdfmake/vfs_fonts.js"/>"></script>

    <!-- AdminLTE App -->
    <script src="<c:url value="/resources/admin/dist/js/adminlte.min.js"/>"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="<c:url value="/resources/admin/dist/js/demo.js"/>"></script>
    <!-- Page specific script -->
	<!-- Page specific script -->

	<script type="text/javascript">
		$(document).ready(function(){
			$('.select2').select2();
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