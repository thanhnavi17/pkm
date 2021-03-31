<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	$('.accept_remove').click(function(e){
		e.preventDefault();
		$(this).parent().parent().remove();
		var questionID = $(this).parent().parent().attr('data-val');
		var value = $(this).attr('data-value');

		$.ajax({
			type: "GET",
			url: "http://localhost:8086/PokemonDatabase/admin/post/update/"+ questionID +"&"+value,

			async : true,
			traditional : true,
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
						<h1>Post</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active">Post</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header"></div>
							<!-- /.card-header -->
							<div class="card-body">
								<table id="pokedex" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>Title</th>
											<th>Post</th>
											<th>Ngày tạo</th>
											<th>Người tạo</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${not empty lstQuestion }">
											<c:forEach var="q" items="${lstQuestion }">
												<tr data-val=${q.id }>
													<td>${q.title }</td>
													<td>${q.content }</td>
													<td>${q.ngayTao }</td>
													<td>${q.objUser.username }</td>
													<td>
														<a class="accept_remove" href="" data-value="1"><i class="fa fa-check" aria-hidden="true"></i></a>
														<a class="accept_remove" href="" data-value="0"><i class="fa fa-trash" aria-hidden="true"></i></a>
													</td>
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
</body>
</html>