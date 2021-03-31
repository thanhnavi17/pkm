<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
<aside class="main-sidebar sidebar-dark-primary elevation-4">
            <!-- Brand Logo -->
            <a href="../../index3.html" class="brand-link">
                <img src="<c:url value="/resources/admin/dist/img/AdminLTELogo.png"/>"
                    class="brand-image img-circle elevation-3" style="opacity: .8">
                <span class="brand-text font-weight-light">AdminLTE 3</span>
            </a>

            <!-- Sidebar -->
            <div class="sidebar">
                <!-- Sidebar user (optional) -->
                <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                    <div class="image">
                        <img src="https://img.pokemondb.net/sprites/sword-shield/icon/scizor.png" class="img-circle elevation-2" alt="User Image">
                    </div>
                    <div class="info">
                        <a href="#" class="d-block" data-username="${sessionScope.userOnline.username }" id="tenDangNhap">${sessionScope.userOnline.name }</a>
                    </div>
                </div>

                <!-- SidebarSearch Form -->
                <div class="form-inline">
                    <div class="input-group" data-widget="sidebar-search">
                        <input class="form-control form-control-sidebar" type="search" placeholder="Search"
                            aria-label="Search">
                        <div class="input-group-append">
                            <button class="btn btn-sidebar">
                                <i class="fas fa-search fa-fw"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Sidebar Menu -->
                <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-edit"></i>
              <p>
                Forms
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item showModule" id="pokedexAdd" style="display:none;">
                <a href="<c:url value="/admin/pokedex/add"/>" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Pokemon Add</p>
                </a>
              </li>
              <li class="nav-item showModule" id="pkmFormAdd" style="display:none;">
                <a href="<c:url value="/admin/form/add"/>" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Pokemon Stat</p>
                </a>
              </li>
              <li class="nav-item showModule" id="abilityAdd" style="display:none;">
                <a href="<c:url value="/admin/ability/add"/>" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Ability Add</p>
                </a>
              </li>
              <li class="nav-item showModule" id="moveAdd" style="display:none;">
                <a href="<c:url value="/admin/move/add"/>" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Move Add</p>
                </a>
              </li>
              <li class="nav-item showModule" id="newsAdd" style="display:none;">
                <a href="<c:url value="/admin/news/add"/>" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>News Add</p>
                </a>
              </li>
              <li class="nav-item showModule" id="versionAdd" style="display:none;">
                <a href="<c:url value="/admin/version/add"/>" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Version Add</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-table"></i>
              <p>
                Tables
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item showModule" id="dsPokedex" style="display:none;">
                <a href="<c:url value="/admin/pokedex/all"/>" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Pokemon</p>
                </a>
              </li>
              <li class="nav-item showModule" id="dsPkmForm" style="display:none;">
                <a href="<c:url value="/admin/pokedex/all"/>" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Pokemon Stat</p>
                </a>
              </li>
              <li class="nav-item showModule" id="dsAbility" style="display:none;">
                <a href="<c:url value="/admin/ability/all"/>" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Ability</p>
                </a>
              </li>
              <li class="nav-item showModule" id="dsPkmMove" style="display:none;">
                <a href="<c:url value="/admin/move/all"/>" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Move</p>
                </a>
              </li>
              <li class="nav-item showModule" id="dsPkmNews" style="display:none;">
                <a href="<c:url value="/admin/news/all"/>" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>News</p>
                </a>
              </li>
              <li class="nav-item showModule" id="dsPkmVersion" style="display:none;">
                <a href="<c:url value="/admin/version/all"/>" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Version</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item showModule" id="authorities" style="display:none;">
          	<a href="<c:url value="/admin/role"/>" class="nav-link">
          		<i class="fas fa-key"></i>
          		<p> Authorities</p>
          	</a>
          </li>
          <li class="nav-item showModule" id="forumPost" style="display:none;">
          	<a href="<c:url value="/admin/post"/>" class="nav-link">
          		<i class="fas fa-vote-yea"></i>
          		<p> Post</p>
          	</a>
          </li>
        </ul>
      </nav>
                <!-- /.sidebar-menu -->
            </div>
            <!-- /.sidebar -->
        </aside>
</body>
</html>