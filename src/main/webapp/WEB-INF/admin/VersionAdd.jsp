<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- AdminLTE App -->
    <script src="<c:url value="/resources/admin/dist/js/adminlte.min.js"/>"></script>
</head>
<body>
<c:url value="/admin/version/add-new-version" var="verAdd" />
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Version</h1>
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
    <section class="content">
        <div class="container-fluid">

            <div class="row">
                <div class="card card-primary" style="width: 100%;">
                    <div class="card-header">
                        <h3 class="card-title">Add a new Version</h3>
                    </div>
                    <!-- /.card-header -->
                    <!-- form start -->
                    <s:form action="${verAdd}" method="POST"
                            modelAttribute="version" acceptCharset="utf-8"
                            enctype="multipart/form-data">
                        <div class="card-body">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-2">
                                        <label>ID:</label>
                                        <s:input type="text" class="form-control" path="id"
                                                 placeholder="Enter name" readonly="true"/>
                                    </div>
                                    <div class="col-md-4">
                                        <label>Version :</label>
                                        <s:input type="text" class="form-control" path="version" />
                                    </div>
                                    <div class="col-md-3">
                                        <label>Ngày phát hành :</label>
                                        <s:input type="text" class="form-control" path="releaseDate" />
                                    </div>
                                    <div class="col-md-3">
                                        <label>Tác giả :</label>
                                        <s:input type="text" class="form-control" path="director" />
                                    </div>
                                </div>
                            </div>
								<div class="form-group">
									<div class="row">
										<div class="col-md-12">
										<label>Gameplay:</label>
										<s:textarea id="gameplay" type="text" class="form-control"
											path="gamePlay" placeholder="Enter name" />
											</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-md-12">
										<label>Intro:</label>
										<s:input type="text" class="form-control"
											path="intro" placeholder="Enter name" />
											</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-md-4">
											<label>Platform:</label>
											<s:input type="text" class="form-control"
												path="platForm"/>
										</div>
										<div class="col-md-4">
											<label>Keyword:</label>
											<s:input type="text" class="form-control"
												path="keyword"/>
										</div>
										<div class="col-md-4">
											<label>Map:</label>
											<input type="file" class="form-control"
												name="mapImgUpload" />
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
<script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
<script>
	CKEDITOR.replace( 'gamePlay' );
</script>
</body>
</html>