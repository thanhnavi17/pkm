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
<c:url value="/admin/ability/add-new-ability" var="abiAdd" />
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Move</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Move</li>
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
                        <h3 class="card-title">Add a new Move</h3>
                    </div>
                    <!-- /.card-header -->
                    <!-- form start -->
                    <s:form action="${abiAdd}" method="post"
                            modelAttribute="ability" acceptCharset="utf-8"
                            enctype="multipart/form-data">
                        <div class="card-body">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-2">
                                        <label>Ability ID:</label>
                                        <s:input type="text" class="form-control" path="moveID"
                                                 placeholder="Enter name" />
                                    </div>
                                    <div class="col-md-4">
                                        <label>Ability :</label>
                                        <s:input type="text" class="form-control" path="moveName" />
                                    </div>
                                    <div class="col-md-3">
                                        <label>Type :</label>
                                        <s:select path="typeID" class="form-control">
                                            <s:option value="0" label="--- Chọn hệ ---" />
                                            <s:options items="${lstType }" />
                                        </s:select>
                                    </div>
                                    <div class="col-md-3">
                                        <label>Category :</label>
                                        <s:select path="moveTypeID" class="form-control">
                                            <s:option value="0" label="--- None ---" />
                                            <s:options items="${lstCategory }" />
                                        </s:select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-3">
                                        <label>Power:</label>
                                        <s:input type="text" class="form-control" path="power"
                                                 placeholder="Enter name" />
                                    </div>
                                    <div class="col-md-3">
                                        <label>Accuracy:</label>
                                        <s:input type="text" class="form-control" path="accuracy" />
                                    </div>
                                    <div class="col-md-3">
                                        <label>PP:</label>
                                        <s:input type="text" class="form-control" path="pp" />
                                    </div>
                                    <div class="col-md-3">
                                        <label>Proc. Chance:</label>
                                        <s:input type="text" class="form-control" path="proc" />
                                    </div>

                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-8">
                                        <label>Description:</label>
                                        <s:input type="text" class="form-control" path="effect" />
                                    </div>
                                    <div class="col-md-4">
                                        <label>Generation:</label>
                                        <s:select path="genID" class="form-control">
                                            <s:option value="0" label="--- Chọn thế hệ ---" />
                                            <s:options items="${lstGeneration }" />
                                        </s:select>
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