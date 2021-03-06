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
<c:url value="/admin/news/add-new-news" var="newsAdd" />
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>News</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">News</li>
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
                        <h3 class="card-title">Add a new News</h3>
                    </div>
                    <!-- /.card-header -->
                    <!-- form start -->
                    <s:form action="${newsAdd}" method="POST"
                            modelAttribute="news" acceptCharset="utf-8"
                            enctype="multipart/form-data">
                        <div class="card-body">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-2">
                                        <label>ID:</label>
                                        <s:input type="text" class="form-control" path="id"
                                                 placeholder="Enter name" readonly="true"/>
                                    </div>
                                    <div class="col-md-7">
                                        <label>Ti??u ????? :</label>
                                        <s:input type="text" class="form-control" path="tieuDe" />
                                    </div>
                                    <div class="col-md-3">
                                        <label>T??c gi??? :</label>
                                        <s:input type="text" class="form-control" path="tacGia" />
                                    </div>
                                    
                                </div>
                            </div>
								<div class="form-group">
									<div class="row">
										<div class="col-md-12">
										<label>M?? t???:</label>
										<s:textarea id="moTa" type="text" class="form-control"
											path="moTa" placeholder="Enter name" />
											</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
									<div class="col-md-12">
										<label>N???i dung:</label>
										<s:textarea id="noiDung" type="text" class="form-control"
											path="noiDung" placeholder="Enter name" />
									</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-md-3">
											<label>Ng?????i t???o:</label>
											<s:input type="text" class="form-control"
												path="nguoiTaoID" readonly="true"/>
										</div>
										<div class="col-md-3">
											<label>Ng?????i duy???t:</label>
											<s:input type="text" class="form-control"
												path="nguoiDuyetID" readonly="true"/>
										</div>
										<div class="col-md-3">
											<label>Ng??y t???o:</label>
											<s:input type="text" class="form-control"
												path="" readonly="true" value="${news.ngayTao }"/>
										</div>
										<div class="col-md-3">
											<label>Ng??y duy???t:</label>
											<s:input type="text" class="form-control"
												path="" readonly="true" value="${news.ngayDuyet }"/>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-md-5">
											<label>???nh:</label> 
											<input type="file" class="form-control"
												name="imgNewsUpload" />
										</div>
										<div class="col-md-3">
											<label>Tr???ng th??i:</label>
											<s:input type="text" path="" class="form-control" readonly="true"/>
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
	CKEDITOR.replace( 'moTa' );
	CKEDITOR.replace( 'noiDung' );
</script>
</body>
</html>