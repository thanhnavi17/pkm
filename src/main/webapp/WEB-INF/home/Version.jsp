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
	<main id="main" class="main-content grid-container">
		<h1>Pokémon ${objVer.version }</h1>
		<nav class="entity-nav component">
			<a rel="prev" class="entity-nav-prev" href="/lets-go-pikachu-eevee">Let's
				Go Pikachu &amp; Let's Go Eevee</a> <a rel="next"
				class="entity-nav-next" href="/brilliant-diamond-shining-pearl">Brilliant
				Diamond &amp; Shining Pearl</a>
		</nav>
		<div class="panel panel-intro">
			<p>${objVer.intro }</p>
		</div>
		<div class="grid-row">
			<div class="grid-col span-md-12 span-lg-4">
				<h3>Details</h3>
				<table class="vitals-table">
					<tbody>
						<tr>
							<th>Ngày phát hành</th>
							<td>${objVer.releaseDate }<small class="text-muted">(Worldwide)</small></td>
						</tr>
						<tr>
							<th>Nền tảng</th>
							<td>${objVer.platForm }</td>
						</tr>
						<tr>
							<th>Đạo diễn</th>
							<td>${objVer.director }</td>
						</tr>

					</tbody>
				</table>
			</div>
			<div class="grid-col span-md-12 span-lg-8">
				<div class="figure">
					<c:forEach var="logo" items="${lstLogo }">
						<a href="https://img.pokemondb.net/logos/lg/sword-logo-large.jpg"
							rel="lightbox" data-title="Pokémon logo"><img loading="lazy"
							src="../images/logo/${logo.logo }" width="360" height="360"
							alt="Pokemon logo"></a>
					</c:forEach>
					<br> Pokémon ${objVer.version } logos
				</div>
			</div>
		</div>
		<div class="component text-center" style="min-height: 90px">
			<div id="bsa-zone_1612827473385-3_123456"></div>
		</div>
		<div class="grid-row">
			<div class="grid-col span-md-4">
				<nav class="panel panel-nav">
					<h2>${objVer.version } pages</h2>
					<h3 class="text-kilo">Pokémon</h3>
					<ul>
						<li><a href="/pokedex/game/sword-shield">Ra mắt Pokemon mới</a>
					</ul>
					<h3 class="text-kilo">Mechanics</h3>
					<ul>
						<li><a href="/move/generation/8">Ra mắt Moves mới</a>
						<li><a href="/ability#gen=8">Ra mắt Ability mới</a>
						<li><a href="/sword-shield/dynamax">Dynamax &amp;
								Gigantamax</a>
						<li><a href="/sword-shield/videos">Videos &amp; trailers</a>
					</ul>
				</nav>
				<div class="component text-center" style="min-height: 250px">
					<div id="bsa-zone_1612996493918-9_123456"></div>
				</div>
			</div>
			<div class="grid-col span-md-8">
				${objVer.gamePlay }
			</div>

		</div>
		<hr>
		<h2>Image gallery</h2>
		<div class="figure">
			<span class="lazyload-resp-wrapper " style="width: 500px;"><span
				class="lazyload-resp-inner" style="padding-bottom: 70.8%"><img
					class="lazyload-resp" src="../images/gallery/${objVer.map }"
					alt="Galar region map artwork"></span></span><br> The region map
			(click to enlarge).
		</div>
		<div class="grid-row">
			<c:if test="${not empty lstGal }">
				<c:forEach var="gal" items="${lstGal }">
					<div class="grid-col span-md-6 figure">
						<img src="../images/gallery/${gal.image }">
					</div>
				</c:forEach>
			</c:if>
		</div>
	</main>
</body>
</html>