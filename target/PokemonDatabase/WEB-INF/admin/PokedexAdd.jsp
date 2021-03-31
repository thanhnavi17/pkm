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
<c:url value="/add-new-pokemon" var="urlPkmAdd"/>
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
							<h3 class="card-title">Add a new Pokemon</h3>
						</div>
						<!-- /.card-header -->
						<!-- form start -->
						<s:form action="${urlPkmAdd}" method="post"
							modelAttribute="pokemon" acceptCharset="utf-8">
							<div class="card-body">
								<div class="form-group">
									<div class="row">
										<div class="col-md-4">
											<label>Pokemon Name:</label>
											<s:input type="text" class="form-control" path="pkmName"
												placeholder="Enter name" />
										</div>
										<div class="col-md-4">
											<label>Species:</label>
											<s:input type="text" class="form-control" path="chungLoai" />
										</div>
										<div class="col-md-2">
											<label>Height:</label>
											<s:input type="text" class="form-control" path="height" />
										</div>
										<div class="col-md-2">
											<label>Weight:</label>
											<s:input type="text" class="form-control" path="weight" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-md-2">
											<label>Catch rate:</label>
											<s:input type="text" class="form-control" path="catchRate"
												placeholder="Enter name" />
										</div>
										<div class="col-md-2">
											<label>EV:</label>
											<s:input type="text" class="form-control" path="eV" />
										</div>
										<div class="col-md-2">
											<label>FriendShip:</label>
											<s:input type="text" class="form-control" path="friendShip" />
										</div>
										<div class="col-md-2">
											<label>BaseEXP:</label>
											<s:input type="text" class="form-control" path="exp" />
										</div>
										<div class="col-md-4">
											<label>Growth Rate:</label>
											<s:input type="text" class="form-control" path="growthRate" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-md-2">
											<label>Male rate:</label>
											<s:input type="text" class="form-control" path="maleRate"
												placeholder="Enter name" />
										</div>
										<div class="col-md-2">
											<label>Female rate:</label>
											<s:input type="text" class="form-control" path="femaleRate"
												placeholder="Enter name" />
										</div>
										<div class="col-md-2">
											<label>Pokemon ID:</label>
											<s:input type="text" class="form-control" path="id"
												placeholder="Enter name" />
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