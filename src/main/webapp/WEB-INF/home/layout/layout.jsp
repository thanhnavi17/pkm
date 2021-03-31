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
<link rel="stylesheet" href="<c:url value="/resources/home/css/pokemondb-9e7c459c38.css"/>">
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

</head>
<body>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="menu" />
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />

	<script>
		var localDbVersions = 35;
	</script>
	
	<script src="<c:url value="/resources/home/js/global-1359ac0129.js" />"></script>
	
</body>
</html>