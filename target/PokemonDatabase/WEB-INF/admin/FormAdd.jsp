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
	<c:url value="/admin/form/add-new-form" var="urlFormAdd" />
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>Pokedex</h1>
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
		<section class="content">
			<div class="container-fluid">

				<div class="row">
					<div class="card card-primary" style="width: 100%;">
						<div class="card-header">
							<h3 class="card-title">Add a new Pokemon form</h3>
						</div>
						<!-- /.card-header -->
						<!-- form start -->
						<s:form action="${urlFormAdd}" method="post"
							modelAttribute="pkmForm" acceptCharset="utf-8"
							enctype="multipart/form-data">
							<div class="card-body">
								<div class="form-group">
									<div class="row">
										<div class="col-md-4">
											<label>Pokemon Name:</label>
											<s:input type="text" class="form-control" path="form"
												placeholder="Enter name" />
										</div>
										<div class="col-md-4">
											<label>PokemonID:</label>
											<s:input type="text" class="form-control" path="pkmID" />
										</div>
										<div class="col-md-2">
											<label>Type 1:</label>
											<s:select path="type1" class="form-control">
												<s:option value="0" label="--- Chọn hệ ---" />
												<s:options items="${lstType }" />
											</s:select>
										</div>
										<div class="col-md-2">
											<label>Type 2:</label>
											<s:select path="type2" class="form-control">
												<s:option value="0" label="--- Chọn hệ ---" />
												<s:options items="${lstType }" />
											</s:select>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-md-2">
											<label>HP:</label>
											<s:input type="text" class="form-control" path="hp"
												placeholder="Enter name" />
										</div>
										<div class="col-md-2">
											<label>Attack:</label>
											<s:input type="text" class="form-control" path="atk" />
										</div>
										<div class="col-md-2">
											<label>Defense:</label>
											<s:input type="text" class="form-control" path="def" />
										</div>
										<div class="col-md-2">
											<label>SpAtk:</label>
											<s:input type="text" class="form-control" path="spAtk" />
										</div>
										<div class="col-md-2">
											<label>SpDef:</label>
											<s:input type="text" class="form-control" path="spDef" />
										</div>
										<div class="col-md-2">
											<label>Speed:</label>
											<s:input type="text" class="form-control" path="speed" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-md-3">
											<label>Image:</label>
											<input type="file" class="form-control"
												name="imgUpload" />
										</div>
										<div class="col-md-3">
											<label>Icon:</label>
											<input type="file" class="form-control"
												name="iconUpload" />
										</div>
										<div class="col-md-3">
											<label>Form Type:</label>
											<s:select path="formType" class="form-control">
												<s:option value="0" label="--- Chọn dạng ---" />
												<s:options items="${lstFormType }" />
											</s:select>
										</div>
										<div class="col-md-3">
											<label>FormID:</label>
											<s:input type="text" class="form-control" path="id" />
										</div>
									</div>
								</div>

							</div>
							<!-- /.card-body -->

							<div class="card-footer">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
						</s:form>
					</div>
					<!-- /.card -->
				</div>

			</div>
		</section>
	</div>


</body>
</html>