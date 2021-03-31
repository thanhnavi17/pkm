<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Pokemon Database Admin</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<c:url value="/resources/admin/plugins/fontawesome-free/css/all.min.css"/>">
    <!-- DataTables -->
    <link rel="stylesheet" href="<c:url value="/resources/admin/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/admin/plugins/datatables-responsive/css/responsive.bootstrap4.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/admin/plugins/datatables-buttons/css/buttons.bootstrap4.min.css"/>">
    <!-- Theme style -->
    <link rel="stylesheet" href="<c:url value="/resources/admin/dist/css/adminlte.min.css"/>">
</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">
		<tiles:insertAttribute name="navbar" />
		<tiles:insertAttribute name="sidebar" />
		<tiles:insertAttribute name="body" />
		<tiles:insertAttribute name="footer" />
	</div>
	
</body>
</html>