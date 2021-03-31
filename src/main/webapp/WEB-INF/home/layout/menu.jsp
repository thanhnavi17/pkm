<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value="/resources/home/js/jquery-3.4.1.min.js"/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#sitesearch').keyup(function(){
			$('.sitesearch-results').empty();
			var keyword = $('#sitesearch').val();

			$.ajax({
				type : "GET",
				url : "http://localhost:8086/PokemonDatabase/searchData1/"+keyword,
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				async : true,
				traditional : true,
				success: function(result){
					var lst1 = "";
					if(result != null){
						$.each(result,function(index, x){
							lst1 += "<a class='sitesearch-results-item' href='/PokemonDatabase/pokedex/"+ x.pkmID +"'><span class='ent-name'>"+x.form+"</span><small class='sitesearch-results-type'>Pokedex</small></a>"
						})
						$('.sitesearch-results').addClass('sitesearch-active');
						$('.sitesearch-results').append(lst1);
					}
					
				}
			});
			
			$.ajax({
				type : "GET",
				url : "http://localhost:8086/PokemonDatabase/searchData2/"+keyword,
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				async : true,
				traditional : true,
				success: function(result){
					var lst2 = "";
					if(result != null){
						$.each(result,function(index, y){
							lst2 += "<a class='sitesearch-results-item' href='/PokemonDatabase/ability/"+ y.ability +"'><span class='ent-name'>"+y.ability+"</span><small class='sitesearch-results-type'>Ability</small></a>"
						})
						$('.sitesearch-results').addClass('sitesearch-active');
						$('.sitesearch-results').append(lst2);
					}
					
				}
			});
			
			$.ajax({
				type : "GET",
				url : "http://localhost:8086/PokemonDatabase/searchData3/"+keyword,
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				async : true,
				traditional : true,
				success: function(result){
					var lst3 = "";
					if(result != null){
						$.each(result,function(index, z){
							lst3 += "<a class='sitesearch-results-item' href='/PokemonDatabase/move/"+ z.moveName +"'><span class='ent-name'>"+z.moveName+"</span><small class='sitesearch-results-type'>Move</small></a>"
						})
						$('.sitesearch-results').addClass('sitesearch-active');
						$('.sitesearch-results').append(lst3);
					}
					
				}
			});
		});
	});
</script>
</head>
<body>
	<nav class="main-menu grid-container">
		<ul class="main-menu-list">
			<li class="main-menu-item"><a class="main-menu-heading"
				href="/sitemap"> <svg xmlns="http://www.w3.org/2000/svg"
						viewBox="0 0 512 512" class="main-menu-icon img-fixed" width="24"
						height="24" aria-label="Pokeball icon" role="img">
                        <g fill="#a3a3a3">
                            <path
							d="M229.7 36.8A220.9 220.9 0 0 0 37.5 224.9l-.4 4.3h106.5l1.4-4.7a116.3 116.3 0 0 1 73-77.5 114.7 114.7 0 0 1 149 79l.9 3.2H475l-1.7-10.1A220 220 0 0 0 281 36.7c-12-1.4-39.3-1.4-51.2 0z" />
                            <path
							d="M239.7 185a74 74 0 0 0-49.7 40.3 73 73 0 0 0 15.4 82.3 72.1 72.1 0 0 0 101.9-1.2 68.8 68.8 0 0 0 20.6-50.7 69.1 69.1 0 0 0-21-51.2 73.3 73.3 0 0 0-33-19c-7.6-2.1-26.4-2.3-34.2-.5z" />
                            <path
							d="M37.5 286.3a220.5 220.5 0 0 0 436 4.5l1.5-8.9H367.9l-1 3.2a130 130 0 0 1-17.7 37.6 144 144 0 0 1-26.9 26.8 142 142 0 0 1-30.7 15.4 96.3 96.3 0 0 1-35.8 5.3 90 90 0 0 1-22.5-1.7 114 114 0 0 1-58.6-31.7 110.1 110.1 0 0 1-28.3-46l-2.9-8.9H37l.6 4.4h-.1z" />
                        </g>
                    </svg> <span class="main-menu-title">Data</span> <span
					class="main-menu-title-long">Thông tin</span>
			</a>
				<ul class="main-menu-sub">
					<li><a href="<c:url value="/pokedex/all"/>">Pokédex</a></li>
					<li><a href="<c:url value="/move/all"/>">Moves</a></li>
					<li><a href="<c:url value="/type"/>">Type chart</a></li>
					<li><a href="<c:url value="/ability"/>">Abilities</a></li>
					<li><a href="<c:url value="/items/all"/>">Items</a></li>
					<li><a href="/evolution">Evolution chains</a></li>
				</ul></li>
			<li class="main-menu-item"><a class="main-menu-heading"
				href="/sitemap"> <svg xmlns="http://www.w3.org/2000/svg"
						viewBox="0 0 512 512" class="main-menu-icon img-fixed" width="24"
						height="24" aria-label="Mechanics icon" role="img">
                        <path fill="#a3a3a3"
							d="M479.5 297.5v-82l-50.3-8.4a156.5 156.5 0 0 0-16-38.3l30-40.8-57.7-58.8-42 29c-12-6.5-25-12.2-38.2-15.9L297 33h-82l-8.3 50.3a163 163 0 0 0-38.3 16l-41-29.1L68.8 128l29.9 41A184 184 0 0 0 82.8 208l-50.3 7.4v82l50.3 8.3a163 163 0 0 0 16 38.3l-30 41.7 57.6 57.6 42-29.7a184 184 0 0 0 39 15.8l8.4 49.5h82l8.3-50.4c13.1-3.7 26-9.3 38.3-15.8l41.9 29.8 57.6-57.8-29.7-42c6.4-12 12-24 15.8-38.1l49.3-7.4.2.2zM255.8 342c-47.5 0-85.7-38.3-85.7-85.7s39.1-85.7 85.7-85.7 85.8 38.3 85.8 85.7-38.3 85.7-85.8 85.7z" />
                    </svg> <span class="main-menu-title">Mechanics</span> <span
					class="main-menu-title-long">Cơ chế</span>
			</a>
				<ul class="main-menu-sub">
					<li><a href="/mechanics/breeding">Breeding &amp; egg
							groups</a></li>
					<li><a href="/mechanics/move-tutors">Move Tutors</a></li>
					<li><a href="/type/dual">Dual type chart</a></li>
					<li><a href="/ev">Effort Values (EVs)</a></li>
					<li><a href="/mechanics/natures">Natures</a></li>
					<li><a href="/mechanics/hidden">IVs/Personality</a></li>
					<li class="main-menu-hr-title">Useful tools</li>
					<li><a href="/tools/moveset-search">Moveset searcher</a></li>
					<li><a href="/tools/type-coverage">Type coverage checker</a></li>
				</ul></li>
			<li class="main-menu-item"><a class="main-menu-heading"
				href="/sitemap"> <svg xmlns="http://www.w3.org/2000/svg"
						viewBox="0 0 512 512" class="main-menu-icon img-fixed" width="24"
						height="24" aria-label="Game controller icon" role="img">
                        <path fill="#a3a3a3" fill-rule="evenodd"
							d="M117.4 121.9c-104.8 14.6-152 142.6-82.2 222.9 48 55 131.9 62.7 187.2 17l4.6-3.8H285l4.6 3.7c55.3 45.8 139.3 38.2 187.2-17 70.2-80.6 22.4-208.6-83.1-222.9-14.8-2-261.9-2-276.2 0m42.8 52.8c2.2 2.2 2.2 2.7 2.5 29.4l.3 27.2h53.5l2.4 2.5c3.8 3.8 3.8 40.8 0 44.6l-2.4 2.4H163l-.3 27.2c-.4 35 2.2 31.7-25 31.7-27.3 0-24.7 3.3-25-31.7l-.4-27.2H59l-2.4-2.4c-3.9-3.8-3.9-40.8 0-44.6l2.4-2.5h53.4l.3-27c.4-35-1.8-32.4 26.3-32 18.3.1 19 .2 21.3 2.4m259.3 16.5a33.7 33.7 0 0 1 19.5 42.5 33.2 33.2 0 0 1-59 5.8c-16.4-26.6 9.7-58.4 39.5-48.3M352 259a33 33 0 0 1 3.7 60 32.7 32.7 0 0 1-48-27.3A32.9 32.9 0 0 1 352 259" />
                    </svg> <span class="main-menu-title">Games</span> <span
					class="main-menu-title-long">Phiên bản</span>
			</a>
				<ul class="main-menu-sub">
					<li><a href="<c:url value="/version/sword-shield"/>">Sword &amp; Shield</a></li>
					<li class="main-menu-hr"></li>
					<li><a href="<c:url value="/version/lets-go-pikachu-eevee"/>">Let's Go Pikachu
							&amp; Let's Go Eevee</a></li>
					<li><a href="<c:url value="/version/ultra-sun-ultra-moon"/>">Ultra Sun &amp; Ultra
							Moon</a></li>
					<li><a href="<c:url value="/version/sun-moon"/>">Sun &amp; Moon</a></li>
					<li class="main-menu-hr"></li>
					<li><a href="<c:url value="/version/omega-ruby-alpha-sapphire"/>">Omega Ruby &amp;
							Alpha Sapphire</a></li>
					<li><a href="<c:url value="/version/x-y"/>">X &amp; Y</a></li>
					<li class="main-menu-hr"></li>
					<li><a href="<c:url value="/version/black-white-2"/>">Black 2 &amp; White 2</a></li>
					<li><a href="<c:url value="/version/black-white"/>">Black &amp; White</a></li>
					<li class="main-menu-hr"></li>
					<li><a href="<c:url value="/version/heartgold-soulsilver"/>">HeartGold &amp;
							SoulSilver</a></li>
					<li><a href="<c:url value="/version/platinum"/>">Platinum</a></li>
					<li><a href="<c:url value="/version/diamond-pearl"/>">Diamond &amp; Pearl</a></li>
					<li class="main-menu-hr"></li>
					<li><a href="<c:url value="/version/emerald"/>">Emerald</a></li>
					<li><a href="<c:url value="/version/firered-leafgreen"/>">FireRed &amp; LeafGreen</a></li>
					<li><a href="<c:url value="/version/ruby-sapphire"/>">Ruby &amp; Sapphire</a></li>
					<li class="main-menu-hr"></li>
					<li><a href="<c:url value="/version/crystal"/>">Crystal</a></li>
					<li><a href="<c:url value="/version/gold-silver"/>">Gold &amp; Silver</a></li>
					<li class="main-menu-hr"></li>
					<li><a href="<c:url value="/version/yellow"/>">Yellow</a></li>
					<li><a href="<c:url value="/version/red-blue"/>">Red &amp; Blue</a></li>
					<li class="main-menu-hr"></li>
					<li><a href="/spinoff">Other spin-offs</a></li>
				</ul></li>
			<li class="main-menu-item"><a class="main-menu-heading"
				href="/sitemap"> <svg xmlns="http://www.w3.org/2000/svg"
						viewBox="0 0 512 512" class="main-menu-icon img-fixed" width="24"
						height="24" aria-label="Chat icon" role="img">
                        <path fill="#a3a3a3"
							d="M36.5 95v241.5a44.5 44.5 0 0 0 43.9 43.9h58.5v73.1a7.3 7.3 0 0 0 12.8 5l71-78.1h208.9a44.5 44.5 0 0 0 43.9-44V95a44.5 44.5 0 0 0-43.9-43.9H80.4a44.5 44.5 0 0 0-43.9 44zm292.7 117.1a29.3 29.3 0 1 1 58.6 0 29.3 29.3 0 0 1-58.6 0zm-102.5 0a29.3 29.3 0 1 1 58.6 0 29.3 29.3 0 0 1-58.6 0zm-102.4 0a29.3 29.3 0 1 1 58.6 0 29.3 29.3 0 0 1-58.6 0z" />
                    </svg> <span class="main-menu-title">Other</span> <span
					class="main-menu-title-long">Cộng đồng</span>
			</a>
				<ul class="main-menu-sub">
					<li><a href="<c:url value="/pokebase"/>">Pokémon Q&amp;A</a></li>
					<li><a href="/pokebase/rmt/">Pokémon Rate My Team(Coming soon)</a></li>
					<li><a href="/pokebase/chat">Chat Room(Coming soon)</a></li>
					<li><a href="/pokebase/meta/">Meta (Suggestion Box)</a></li>
					<li class="main-menu-hr-title">Other pages</li>
					<li><a href="/">Pokémon News</a></li>
					<li><a href="/maps">Maps/Puzzles</a></li>
					<li><a href="/etymology">Pokémon name origins</a></li>
					<li><a href="/about">About/Contact us</a></li>
				</ul></li>
			<li class="main-menu-item main-menu-item-search">
				<form method="get" action="/search" class="sitesearch-form">
					<label class="sr-only" for="sitesearch">Search</label> <input
						id="sitesearch" class="input-text sitesearch-input" type="text"
						name="q" autocomplete="off" placeholder="Search" tabindex="100">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
						class="main-menu-icon img-fixed" width="20" height="20"
						aria-label="Search" role="img">
                        <path fill="#a3a3a3"
							d="M495.6 466.4L373.8 339.6a206 206 0 0 0 48.5-132.9C422.3 92.7 329.5 0 215.6 0S8.8 92.7 8.8 206.7s92.8 206.7 206.8 206.7c42.8 0 83.5-12.9 118.4-37.4l122.8 127.7a26.8 26.8 0 0 0 38.1.8 27 27 0 0 0 .7-38.1zm-280-412.5c84.2 0 152.8 68.6 152.8 152.8s-68.6 152.8-152.8 152.8S62.8 291 62.8 206.7 131.3 54 215.6 54z" />
                    </svg>
					<div class="sitesearch-results"></div>
				</form>
			</li>
		</ul>
	</nav>
</body>
</html>