<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="<c:url value="/resources/admin/bootstrap-duallist/jquery.bootstrap-duallistbox.min.js"/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/admin/bootstrap-duallist/bootstrap-duallistbox.css"/>">
	<!-- AdminLTE App -->
    <script src="<c:url value="/resources/admin/dist/js/adminlte.min.js"/>"></script>
<!-- SweetAlert2 -->
<link rel="stylesheet" href="<c:url value="/resources/admin/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css"/>">
<script src="<c:url value="/resources/admin/plugins/sweetalert2/sweetalert2.min.js"/>"></script>
<!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="<c:url value="/resources/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css"/>">
<script type="text/javascript">
	$(document).ready(function(){
		$('#role').click(function(){
			$('.permission').empty();
			//Lấy giá trị của user vừa chọn
			var roleID = $(this).children("option:selected").val();

			//Hiển thị danh sách vai trò đã được cấp
			$.ajax({
				type: "get",
				url: "http://localhost:8086/PokemonDatabase/roleSearch1/" + roleID,
				dataType: "json",
				contentType : "application/json; charset=utf-8",
				async : true,
				traditional : true,
				success: function(result){
					var permission1 = "";
					$.each(result, function(index, x){		
						permission1 += "<option value='"+ x.permissionID+"' selected='selected' class='permiss' data-permission='"+x.permissionID+"'>"+ x.objPermission.permission +"</option>";
					});
					$('.permission').append(permission1);
					$('.permission').bootstrapDualListbox('refresh',true);
				}
			});
			
			//Hiển thị vai trò chưa cấp
			$.ajax({
				type: "get",
				url: "http://localhost:8086/PokemonDatabase/roleSearch2/" + roleID,
				dataType: "json",
				contentType : "application/json; charset=utf-8",
				async : true,
				traditional : true,
				success: function(result){
					var permission2 = "";
					$.each(result, function(index, y){		
						permission2 += "<option value='"+ y.id +"' data-permission='"+y.id+"'>"+ y.permission +"</option>";
					});
					$('.permission').append(permission2);
					$('.permission').bootstrapDualListbox('refresh',true);
				}
			});
		});
	});
</script>
</head>
<body>
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>Authorites</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="http://localhost:8086/PokemonDatabase/logout">Home</a></li>
							<li class="breadcrumb-item active">Authorities</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<form id="phanQuyen" action="#" method="post">
					<div class="row">
						<div class="col-md-3">
							<span>Vai trò:</span>
						</div>
						<div class="col-md-8">
							<div class="row">
								<div class="col-md-6">
									<span>Chức năng chưa cấp</span>
								</div>
								<div class="col-md-6">
									<span>Chức năng đã cấp</span>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3">
							<div class="box">
								<span class="info-container"><span class="info">List user</span></span>
								<div style="height:3px"></div>
								<input class="form-control filter" type="text" placeholder="Role ..." style="height:31px">
								<div style="height:5px"></div>
								<div style="height:38px;width:331px">Username</div>
									<select multiple="multiple" size="10" style="width: 100%" id="role">
										<c:forEach var="vt" items="${lstRoles }">
											<option value="${vt.id }">${vt.role }</option>
										</c:forEach>
									</select>
							</div>
						</div>
						<div class="col-md-8">
							<select multiple="multiple" size="10" name="duallistbox_demo2"
								class="permission" title="duallistbox_demo2">
							
							</select> <br>
							<button type="submit" class="btn btn-default btn-block swalDefaultSuccess">Save</button>
						</div>
						<div class="col-md-1">
							<div style="height: 100px"></div>
							<div class="box">
								<div class="form-check">
									<input class="form-check-input" type="checkbox" value="" id="view">
									<label class="form-check-label" for="flexCheckDefault">View</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" value="" id="update">
									<label class="form-check-label" for="flexCheckDefault">
										Update</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" value="" id="delete">
									<label class="form-check-label" for="flexCheckDefault">
										Delete</label>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- /.content -->
	</div>
	<script type="text/javascript">
	$(document).ready(function(){
		$('#test').click(function(e){
			e.preventDefault();
			var test = $('#bootstrap-duallistbox-nonselected-list_duallistbox_demo2').val();
			alert(test);
		});
		$('#bootstrap-duallistbox-selected-list_duallistbox_demo2').click(function(){
			var curRoleID = $('#role').val();
			var curPermissionID = $(this).val();

			$.ajax({
				type: "get",
				url: "http://localhost:8086/PokemonDatabase/showCheckbox/" + curRoleID + "&" + curPermissionID,
				dataType: "json",
				contentType : "application/json; charset=utf-8",
				async : true,
				traditional : true,
				success: function(result){
					if(result != null){
						if(result.view == 1){
							$('#view').attr('checked','checked');
						}else{
							$('#view').removeAttr('checked');
						}
						if(result.update ==1){
							$('#update').attr('checked','checked');
						}else{
							$('#update').removeAttr('checked');
						}
						if(result.del ==1){
							$('#delete').attr('checked','checked');
						}else{
							$('#delete').removeAttr('checked');
						}
					}
				},
				error: function(result){
					$('#view').removeAttr('checked');
					$('#update').removeAttr('checked');
					$('#delete').removeAttr('checked');
				}
			});
		});

		$('.move').click(function(){
			
			var roleID = $('#role').children("option:selected").val();
			var permissionID = $('#bootstrap-duallistbox-selected-list_duallistbox_demo2').children('option:selected').attr('data-permission');
			console.log("permission la: "+permissionID);
			$.ajax({
				type: "get",
				url: "http://localhost:8086/PokemonDatabase/admin/role/updatePermission/" + roleID + "&" + permissionID,
				dataType: "json",
				contentType : "application/json; charset=utf-8",
				async : true,
				traditional : true,
				error: function(result){
					console.log("gia tri la " +permissionID);
					$('.permission').bootstrapDualListbox('refresh',true);
				}
			});
		});
		
		$('.remove').click(function(){
			$('.permission').bootstrapDualListbox('removeSelectedLabel','refresh');
			var roleID = $('#role').children("option:selected").val();
			var permissionID = $('#bootstrap-duallistbox-nonselected-list_duallistbox_demo2').children("option:selected").val();
			$.ajax({
				type: "get",
				url: "http://localhost:8086/PokemonDatabase/admin/role/deletePermission/" + roleID + "&" + permissionID,
				dataType: "json",
				contentType : "application/json; charset=utf-8",
				async : true,
				traditional : true,
				error: function(result){
					$('.permission').bootstrapDualListbox('refresh',true);
				}
			});
		});
		
		$('.form-check-input').click(function(){
			var id = $(this).attr('id');
			var value = $(this).prop('checked');

			var roleID = $('#role').children("option:selected").val();
			var permissionID = $('#bootstrap-duallistbox-selected-list_duallistbox_demo2').children("option:selected").val();

			$.ajax({
				type: "get",
				url: "http://localhost:8086/PokemonDatabase/admin/role/updateAction/" + roleID + "&" + permissionID +"&" + id + "&" + value,
				dataType: "json",
				contentType : "application/json; charset=utf-8",
				async : true,
				traditional : true,
				success: function(){
					
				}
			});
		});
	});
		
	</script>

	<script>
		var demo2 = $('.permission').bootstrapDualListbox({
        	preserveSelectionOnMove: 'moved',
        	moveOnSelect: false,
		});
		
		//Alert
		var Toast = Swal.mixin({
		      toast: true,
		      position: 'margin-auto',
		      showConfirmButton: false,
		      timer: 3000
		    });
		
		$('.swalDefaultSuccess').click(function() {
			Toast.fire({
		        icon: 'success',
		        title: 'Cập nhật thành công'
		      })
			});	
	</script>
	<div id="toastsContainerTopRight" class="toasts-top-right fixed"></div>
</body>
</html>