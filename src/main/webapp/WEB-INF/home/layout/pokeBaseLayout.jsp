<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Pokémon Database -- the fastest way to get your Pokémon
	information</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="preconnect" href="https://img.pokemondb.net">
<link rel="stylesheet"
	href="<c:url value="/resources/home/css/pokemondb-50e199edcb.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/home/css/pokebase-30f0a62573.css"/>">
<script src="<c:url value="/resources/home/js/jquery-3.4.1.min.js"/>"></script>
<style>
        @font-face {
            font-family: 'Fira Sans';
            font-style: normal;
            font-weight: 400;
            font-display: swap;
            src: url("http://localhost:8086/PokemonDatabase/resources/home/fonts/fira-sans-v10-latin-400.woff2") format("woff2");
            unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD
        }

        @font-face {
            font-family: 'Fira Sans';
            font-style: italic;
            font-weight: 400;
            font-display: swap;
            src: url("http://localhost:8086/PokemonDatabase/resources/home/fonts/fira-sans-v10-latin-400i.woff2") format("woff2");
            unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD
        }

        @font-face {
            font-family: 'Fira Sans';
            font-style: normal;
            font-weight: 700;
            font-display: swap;
            src: url("http://localhost:8086/PokemonDatabase/resources/home/fonts/fira-sans-v10-latin-600.woff2") format("woff2");
            unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD
        }

        @font-face {
            font-family: 'Fira Sans';
            font-style: italic;
            font-weight: 700;
            font-display: swap;
            src: url("http://localhost:8086/PokemonDatabase/resources/home/fonts/fira-sans-v10-latin-600i.woff2") format("woff2");
            unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD
        }
        small {
    		font-size: .750rem !important;
		}
    </style>
<style>
.pagination {
	margin-bottom: 1rem;
	text-align: center
}

.pagination-link {
	display: inline-block;
	margin: 0 .25rem;
	padding: .5rem .75rem;
	background: #fff;
	border: 1px solid #dbdbdb;
	line-height: 1
}

.pagination-link:hover, .pagination-link:active, .pagination-link:focus
	{
	background: #fffacd;
	text-decoration: none
}

.pagination-static {
	margin: 0 2px;
	padding: 3px 8px
}

.pagination-prev::before {
	content: "\2039  "
}

.pagination-next::after {
	content: "  \203a"
}

.list-articles {
	line-height: 1.2
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta property="og:description" name="description"
	content="The Pokémon Database is your source for information and multimedia for the Pokémon games.">
<link rel="canonical" href="https://pokemondb.net/">
<meta property="og:url" content="https://pokemondb.net/">
<meta name="twitter:card" content="summary">
<meta property="og:title" content="Pokémon Database">
<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico">
<link rel="apple-touch-icon-precomposed"
	href="/apple-touch-icon-precomposed.png">
<link rel="alternate" type="application/rss+xml"
	href="https://pokemondb.net/news/feed"
	title="The Pokémon Database newsfeed">
<script>
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script',
			'https://www.google-analytics.com/analytics.js', 'ga');
	ga('create', 'UA-1974891-7', 'auto');
	ga('send', 'pageview');
</script>

	<style>
.main-menu-item:hover>.main-menu-sub {
	visibility: visible;
	opacity: 1;
}
</style>
<!-- SweetAlert2 -->
<link rel="stylesheet" href="<c:url value="/resources/admin/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css"/>">
<script src="<c:url value="/resources/admin/plugins/sweetalert2/sweetalert2.min.js"/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('.qa-form-light-button, .qa-nav-main-ask').click(function(){
			var username = $('.qa-logged-in-data').text();
			
		})
		
	});
</script>
</head>
<body>
<c:url value="/home/logout" var="urlLogout" />
<c:url value="/home/login" var="urlLogin" />
<c:url value="/home/register" var="urlRegister" />
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="menu" />
	<main class="main-content grid-container">
		<div class="qa-banner qa-pokebase">
			<div class="qa-banner-title">PokéBase - Pokémon Q&amp;A</div>
			<div class="qa-banner-buttons">
				<a class="qa-banner-button qa-meta" href="/pokebase/meta/">Meta</a>
				<a class="qa-banner-button qa-rmt" href="/pokebase/rmt/">Rate My
					Team</a>
			</div>
		</div>
		<div class="qa-nav-top">
			<div class="qa-nav-user">
				<%if(session.getAttribute("userOnline") != null){ %>
				<div class="qa-logged-in">
					<span class="qa-logged-in-pad">Xin chào, </span><span
						class="qa-logged-in-data"><a href="<c:url value="/pokebase/user/${sessionScope.userOnline.username }"/>"
						class="qa-user-link">${sessionScope.userOnline.username }</a></span>
				</div>
				<ul class="qa-nav-user-list">
					<li class="qa-nav-user-item qa-nav-user-logout"><a
						href="${urlLogout }" class="qa-nav-user-link">Đăng xuất</a></li>
				</ul>
				<%} else { %>
				<ul class="qa-nav-user-list">
					<li class="qa-nav-user-item qa-nav-user-login"><a
						href="${urlLogin }" class="qa-nav-user-link">Đăng nhập</a></li>
					<li class="qa-nav-user-item qa-nav-user-register"><a
						href="${urlRegister }"
						class="qa-nav-user-link qa-nav-user-selected">Đăng ký</a></li>
				</ul>
				<%} %>
				<div class="qa-nav-user-clear"></div>
			</div>
			<div class="qa-search">
				<form method="get" action="./search">
					<input type="text" name="q" value=""
						class="qa-search-field input-text"> <input type="submit"
						value="Search" class="qa-search-button btn">
				</form>
			</div>
		</div>
		<div class="qa-nav-main">
			<ul class="qa-nav-main-list">
				<li class="qa-nav-main-item qa-nav-main-activity"><a
					href="<c:url value="/pokebase"/>" class="qa-nav-main-link">Tất cả</a></li>
				<li class="qa-nav-main-item qa-nav-main-questions"><a
					href="./questions" class="qa-nav-main-link">Post</a></li>
				<li class="qa-nav-main-item qa-nav-main-unanswered"><a
					href="./unanswered" class="qa-nav-main-link">Post chưa trả lời</a></li>
				<li class="qa-nav-main-item qa-nav-main-tag"><a href="<c:url value="/pokebase/tags"/>"
					class="qa-nav-main-link">Tags</a></li>
				<li class="qa-nav-main-item qa-nav-main-user"><a href="<c:url value="/pokebase/account"/>"
					class="qa-nav-main-link">Người dùng</a></li>
				<li class="qa-nav-main-item qa-nav-main-ask"><a href="<c:url value="/pokebase/ask"/>"
					class="qa-nav-main-link">Đăng câu hỏi tại đây</a></li>
				<li class="qa-nav-main-item-opp qa-nav-main-rules"><a
					href="<c:url value="/pokebase/rules"/>" class="qa-nav-main-link">Luật</a></li>
				<li class="qa-nav-main-item-opp qa-nav-main-custom-4"><a
					href="./chat" class="qa-nav-main-link">Chat</a></li>
			</ul>
			<div class="qa-nav-main-clear"></div>
		</div>
		<div class="qa-header-clear"></div>
		<tiles:insertAttribute name="body" />
		</main>
	<tiles:insertAttribute name="footer" />

	<script>
		var localDbVersions = 35;
	</script>
	
	<script src="<c:url value="/resources/home/js/global-1359ac0129.js" />"></script>
	
</body>
</html>