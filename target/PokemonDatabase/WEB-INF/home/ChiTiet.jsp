<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
<script type="text/javascript">
$(document).ready(function(){
	var pkmType1 = $('.sv-tabs-panel').first().attr('data-type1');
	var pkmType2 = $('.sv-tabs-panel').first().attr('data-type2');
	console.log("he 1 la " + pkmType1 + " he 2 la "+ pkmType2);
	showTypeChart(pkmType1,pkmType2);

	var idForm = $('.sv-tabs-panel').attr('data-val');

	$.ajax({
		type: "GET",
		url: "http://localhost:8080/PokemonDatabase/dexSearchAbi/"+ idForm,
		dataType : "json",
		contentType : "application/json; charset=utf-8",
		async : true,
		traditional : true,
		success: function(result) {
			var ability = "";
				
			$.each(result, function(index,abi){
				if(abi.abiType != 'hidden'){
					ability += "<span class='text-muted'><a href='../ability/"+abi.abiName+"'title='"+abi.moTa+"'>"+abi.abiName+"</a></span><br>"     
				}else{
					ability += "<small class='text-muted'><a href='../ability/"+abi.abiName+"'title='"+abi.moTa+"'>"+abi.abiName+"</a> (hidden ability)</small><br>"
				}

			});
			$('.showAbi').append(ability);
		}
	});
	
	$('.sv-tabs-tab').click(function(e){
		e.preventDefault();
		
		var show = $(this).attr("href");
		$('.sv-tabs-panel').removeClass('active');
		$('.sv-tabs-tab').removeClass('active');
		$('a[href$="'+show+'"]').addClass('active');
		$(show).addClass('active');

		//Hiển thị bảng khắc hệ

		var typePkm2 = $(this).attr('data-type2');
		var typePkm1 = $(this).attr('data-type1');

		$('.type-table-1').empty();
		$('.type-table-2').empty();
		showTypeChart(typePkm1,typePkm2);
		//Lấy id của pkm để hiển thị ability
		$('.showAbi').empty();
		var idForm = $(this).attr('data-val');

		$.ajax({
			type: "GET",
			url: "http://localhost:8080/PokemonDatabase/dexSearchAbi/"+ idForm,
			dataType : "json",
			contentType : "application/json; charset=utf-8",
			async : true,
			traditional : true,
			success: function(result) {
				var ability = "";
					
				$.each(result, function(index,abi){
					if(abi.abiType != 'hidden'){
						ability += "<span class='text-muted'><a href='../ability/"+abi.abiName+"'title='Powers up Fire-type moves in a pinch.'>"+abi.abiName+"</a></span><br>"     
					}else{
						ability += "<small class='text-muted'><a href='../ability/"+abi.abiName+"'title='In sunshine, Sp. Atk is boosted but HP decreases.'>"+abi.abiName+"</a> (hidden ability)</small><br>"
					}

				});
				$('.showAbi').append(ability);
			}
		});
	});
	
	$('.sv-tabs-tab-list').each(function(){
	    $(this).find('.sv-tabs-tab').first().addClass('active');
	});
	$('.sv-tabs-panel-list').each(function(){
	    $(this).find('.sv-tabs-panel').first().addClass('active');
	});
	hienThiBieuDo();

});
function hienThiBieuDo(){
	$('.barchart-bar').each(function(){
		var style = $(this).attr('data-val');
		if(0 <= style && style < 16.67){
			 $(this).addClass('barchart-rank-1');
		}
		if(16.67 <= style && style < 33.34){
			$(this).addClass('barchart-rank-2');
		}
		if(33.34 <= style && style < 50){
			$(this).addClass('barchart-rank-3');
		}
		if(50 <= style && style < 66.67){
			$(this).addClass('barchart-rank-4');
		}
		if(66.67 <= style && style < 83.35){
			$(this).addClass('barchart-rank-5');
		}
		if(83.35 <= style){
			$(this).addClass('barchart-rank-6');
		}
		if(style > 100){
			$(this).css("width","100%");
		}
	});
}

function showTypeChart(pkmType1,pkmType2){
		$.ajax({
			type: "get",
			url: "http://localhost:8080/PokemonDatabase/typechartshow/"+pkmType1 +"&"+pkmType2,
			dataType : "json",
			contentType : "application/json; charset=utf-8",
			async : true,
			traditional : true,
			success: function(typechart){
				var show1 = "";
				var show2 = "";
				for(i = 0;i<(typechart.length)/2;i++){
					var x = "";
					if(typechart[i].result == 0){
						x = '0';
					}
					if(typechart[i].result == 0.5){
						x = '½';
					}
					if(typechart[i].result == 1){
						x = '';
					}
					if(typechart[i].result == 2){
						x = '2';
					}
					if(typechart[i].result == 4){
						x = '4';
					}
					if(typechart[i].result == 0.25){
						x = '¼';
					}
					show1 += "<td class='type-fx-cell type-fx-"+100*(typechart[i].result)+"' data-fx='"+typechart[i].result+"'>"+x+"</td>";
				};
				
				for(i = 9;i<typechart.length;i++){
					var x = "";
					if(typechart[i].result == 0){
						x = '0';
					}
					if(typechart[i].result == 0.5){
						x = '½';
					}
					if(typechart[i].result == 1){
						x = '';
					}
					if(typechart[i].result == 2){
						x = '2';
					}
					if(typechart[i].result == 4){
						x = '4';
					}
					if(typechart[i].result == 0.25){
						x = '¼';
					}
					show2 += "<td class='type-fx-cell type-fx-"+100*(typechart[i].result)+"' data-fx='"+typechart[i].result+"'>"+x+"</td>";
				};
				$('.type-table-1').append(show1);
				$('.type-table-2').append(show2);
			}
		});
}
</script>
    <main id="main" class="main-content grid-container">
    <s:form method="post" modelAttribute="pokemon" acceptCharset="utf-8">
        <h1 data-val="${pokemon.id }">${pokemon.pkmName }</h1>
        <nav class="entity-nav component">
            <a rel="prev" class="entity-nav-prev" href="/PokemonDatabase/pokedex/${pokemon.id - 1 }">#00${pokemon.id - 1 }</a>
            <a rel="next" class="entity-nav-next" href="/PokemonDatabase/pokedex/${pokemon.id + 1 }">#00${pokemon.id + 1 }</a>
        </nav>
        <ul class="list-nav panel panel-nav">
            <li class="list-nav-title">Contents</li>
            <li><a href="#dex-basics">Info</a></li>
            <li><a href="#dex-stats">Base stats</a></li>
            <li><a href="#dex-evolution">Evolution chart</a></li>
            <li><a href="#dex-flavor">Pokédex entries</a></li>
            <li><a href="#dex-moves">Moves learned</a></li>
            <li><a href="#dex-sprites">Sprites</a></li>
            <li><a href="#dex-locations">Locations</a></li>
            <li><a href="#dex-lang">Language</a></li>
        </ul>
        <div class="grid-row">
            <div class="grid-col span-md-6 span-lg-8">
                <p><em>${pokemon.pkmName }</em> is a <a href="/type/fire" class="itype fire">Fire</a>/<a href="/type/flying"
                        class="itype flying">Flying</a> type Pokémon introduced in <abbr
                        title="Pokémon Red, Blue &amp; Yellow">Generation 1</abbr>. It is known as the <q>${pokemon.chungLoai }</q>.</p>
                <p><em>${pokemon.pkmName }</em> has two Mega Evolutions, available from X &amp; Y onwards.</p>
            </div>
            <div class="grid-col span-md-6 span-lg-4">
                <div class="ad-responsive">
                    <style>
                        .adresp-pokedex {
                            width: 100%;
                            min-height: 120px;
                            margin: auto;
                        }
                    </style>
                    
                </div>
            </div>
        </div>
        <div id="dex-basics"></div>
			<div class="tabset-basics sv-tabs-wrapper ">
				<c:if test="${lstForm.size()>1 }">
					<div class="sv-tabs-tab-list">
						<c:if test="${not empty lstForm }">
							<c:forEach var="f" items="${lstForm }">
								<a class="sv-tabs-tab" href="#tab-basic-${f.id }" data-val="${f.id }" data-type1="${f.typeName1 }" data-type2="${f.typeName2 }">${f.form }</a>
							</c:forEach>
						</c:if>
					</div>
				</c:if>
				<div class="sv-tabs-panel-list">
					<c:if test="${not empty lstForm }">
						<c:forEach var="f" items="${lstForm }">
							<div class="sv-tabs-panel" id="tab-basic-${f.id }" data-val="${f.id }" data-type1="${f.typeName1 }" data-type2="${f.typeName2 }">
								<div class="grid-row">
									<div class="grid-col span-md-6 span-lg-4 text-center">
										<p>
											<a rel="lightbox"
												href="https://img.pokemondb.net/artwork/large/charizard.jpg"
												data-title="Charizard official artwork"><img
												src="/PokemonDatabase/images/${f.image }" width="360"
												height="283" alt="Charizard artwork by Ken Sugimori"></a>
										</p>
										<p class="text-small">
											<a href="#">Additional artwork</a>
										</p>
									</div>
									<div class="grid-col span-md-6 span-lg-4">
										<h2>Pokédex data</h2>
										<table class="vitals-table">
											<tbody>
												<tr>
													<th>National &#8470;</th>
													<td><strong>${pokemon.id }</strong></td>
												</tr>
												<tr>
													<th>Hệ</th>
													<td>												
														<a class="type-icon type-${f.typeName1 } type1" href="../type/${f.typeName1 }">${f.typeName1 }</a>
														<c:if test="${f.type2 > 0 }">
														<a class="type-icon type-${f.typeName2 } type2" href="../type/${f.typeName2 }">${f.typeName2 }</a>
														</c:if>
													</td>
												</tr>
												<tr>
													<th>Chủng loại</th>
													<td>${pokemon.chungLoai }</td>
												</tr>
												<tr>
													<th>Chiều cao</th>
													<td>${pokemon.height }&nbsp;m</td>
												</tr>
												<tr>
													<th>Cân nặng</th>
													<td>${pokemon.weight }&nbsp;kg</td>
												</tr>
												<tr>
													<th>Thiên phú</th>
													<td class="showAbi">
													</td>
												</tr>

											</tbody>
										</table>
									</div>
									<div class="grid-col span-md-12 span-lg-4">
										<div class="grid-row">
											<div class="grid-col span-md-6 span-lg-12">
												<h2>Training</h2>
												<table class="vitals-table">
													<tbody>
														<tr>
															<th>EV bonus</th>
															<td class="text">${pokemon.eV }</td>
														</tr>
														<tr>
															<th>Tỉ lệ bắt</th>
															<td>${pokemon.catchRate }<small class="text-muted">(5.9%
																	with PokéBall, full HP)</small>
															</td>
														</tr>
														<tr>
															<th>Mức độ <a href="/glossary#def-friendship">thân thiện</a></th>
															<td>${pokemon.friendShip }<small class="text-muted">(normal)</small>
															</td>
														</tr>
														<tr>
															<th>Kinh nghiệm</th>
															<td>${pokemon.exp }</td>
														</tr>
														<tr>
															<th>Tốc độ trưởng thành</th>
															<td>${pokemon.growthRate }</td>
														</tr>
													</tbody>
												</table>
											</div>
											<div class="grid-col span-md-6 span-lg-12">
												<h2>Breeding</h2>
												<table class="vitals-table">
													<tbody>
														<tr>
															<th>Egg Groups</th>
															<td><a href="/egg-group/dragon">Dragon</a>, <a
																href="/egg-group/monster">Monster</a></td>
														</tr>
														<tr>
															<th>Gender</th>
															<td><span class="text-blue">${pokemon.maleRate }
																	male</span>, <span class="text-pink">${pokemon.femaleRate }
																	female</span></td>
														</tr>
														<tr>
															<th><a href="/glossary#def-eggcycle">Egg cycles</a></th>
															<td>20 <small class="text-muted">(4,884&ndash;5,140
																	steps)</small>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="grid-row">
									<div class="grid-col span-md-12 span-lg-8">
										<div id="dex-stats"></div>
										<h2>Base stats</h2>
										<div class="resp-scroll">
											<table class="vitals-table">
												<tbody>
													<tr>
														<th>HP</th>
														<td class="cell-num">${f.hp }</td>
														<td class="cell-barchart">
															<div data-val="${f.hp/1.8 }" style="width: ${f.hp/1.8 }%;"
																class="barchart-bar" id="hp"></div>
														</td>
														<td class="cell-num">266</td>
														<td class="cell-num">360</td>
													</tr>
													<tr>
														<th>Attack</th>
														<td class="cell-num">${f.atk }</td>
														<td class="cell-barchart">
															<div data-val="${f.atk/1.8 }" style="width:${f.atk/1.8 }%;"
																class="barchart-bar"></div>
														</td>
														<td class="cell-num">155</td>
														<td class="cell-num">293</td>
													</tr>
													<tr>
														<th>Defense</th>
														<td class="cell-num">${f.def }</td>
														<td class="cell-barchart">
															<div data-val="${f.def/1.8 }" style="width:${f.def/1.8 }%;"
																class="barchart-bar"></div>
														</td>
														<td class="cell-num">144</td>
														<td class="cell-num">280</td>
													</tr>
													<tr>
														<th>Sp. Atk</th>
														<td class="cell-num">${f.spAtk }</td>
														<td class="cell-barchart">
															<div data-val="${f.spAtk/1.8 }" style="width:${f.spAtk/1.8 }%;"
																class="barchart-bar"></div>
														</td>
														<td class="cell-num">200</td>
														<td class="cell-num">348</td>
													</tr>
													<tr>
														<th>Sp. Def</th>
														<td class="cell-num">${f.spDef }</td>
														<td class="cell-barchart">
															<div data-val="${f.spDef/1.8 }" style="width:${f.spDef/1.8 }%;"
																class="barchart-bar"></div>
														</td>
														<td class="cell-num">157</td>
														<td class="cell-num">295</td>
													</tr>
													<tr>
														<th>Speed</th>
														<td class="cell-num">${f.speed }</td>
														<td class="cell-barchart">
															<div data-val="${f.speed/1.8 }" style="width:${f.speed/1.8 }%;"
																class="barchart-bar"></div>
														</td>
														<td class="cell-num">184</td>
														<td class="cell-num">328</td>
													</tr>
												</tbody>
												<tfoot>
													<tr>
														<th>Total</th>
														<td class="cell-total"><b>${f.atk+f.def+f.spAtk+f.spDef+f.speed+f.hp }</b></td>
														<th class="cell-barchart"></th>
														<th>Min</th>
														<th>Max</th>
													</tr>
												</tfoot>
											</table>
										</div>
										<p class="text-small text-muted">Chỉ số ở cột bên phải
											tính trên Pokemon lvl100. Giá trị tối đa ở điều kiện đặc tính
											lí tưởng, 252 EVs, 31 IVs; giá trị tối thiểu ở đặc tính bình
											thường, 0 EVs, 0IVs.</p>
									</div>
									<div class="grid-col span-md-12 span-lg-4">
										<h2>Type defenses</h2>
										<p>
											The effectiveness of each type on <em>${f.form }</em>.
										</p>
										<div class="resp-scroll text-center">
											<table class="type-table type-table-pokedex">
												<tr>
													<th><a
														class="type-icon type-normal type-cell type-abbr"
														href="../type/normal" title="Normal">Nor</a></th>
													<th><a class="type-icon type-fire type-cell type-abbr"
														href="../type/fire" title="Fire">Fir</a></th>
													<th><a
														class="type-icon type-water type-cell type-abbr"
														href="../type/water" title="Water">Wat</a></th>
													<th><a
														class="type-icon type-electric type-cell type-abbr"
														href="../type/electric" title="Electric">Ele</a></th>
													<th><a
														class="type-icon type-grass type-cell type-abbr"
														href="../type/grass" title="Grass">Gra</a></th>
													<th><a class="type-icon type-ice type-cell type-abbr"
														href="../type/ice" title="Ice">Ice</a></th>
													<th><a
														class="type-icon type-fighting type-cell type-abbr"
														href="../type/fighting" title="Fighting">Fig</a></th>
													<th><a
														class="type-icon type-poison type-cell type-abbr"
														href="../type/poison" title="Poison">Poi</a></th>
													<th><a
														class="type-icon type-ground type-cell type-abbr"
														href="../type/ground" title="Ground">Gro</a></th>
												</tr>
												<tr class="type-table-1">
													
												</tr>
											</table>
											<table class="type-table type-table-pokedex">
												<tr>
													<th><a
														class="type-icon type-flying type-cell type-abbr"
														href="../type/flying" title="Flying">Fly</a></th>
													<th><a
														class="type-icon type-psychic type-cell type-abbr"
														href="../type/psychic" title="Psychic">Psy</a></th>
													<th><a class="type-icon type-bug type-cell type-abbr"
														href="../type/bug" title="Bug">Bug</a></th>
													<th><a class="type-icon type-rock type-cell type-abbr"
														href="../type/rock" title="Rock">Roc</a></th>
													<th><a
														class="type-icon type-ghost type-cell type-abbr"
														href="../type/ghost" title="Ghost">Gho</a></th>
													<th><a
														class="type-icon type-dragon type-cell type-abbr"
														href="../type/dragon" title="Dragon">Dra</a></th>
													<th><a class="type-icon type-dark type-cell type-abbr"
														href="../type/dark" title="Dark">Dar</a></th>
													<th><a
														class="type-icon type-steel type-cell type-abbr"
														href="../type/steel" title="Steel">Ste</a></th>
													<th><a
														class="type-icon type-fairy type-cell type-abbr"
														href="../type/fairy" title="Fairy">Fai</a></th>
												</tr>
												<tr class="type-table-2">
													
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>

			<div id="dex-evolution"></div>
        <h2>Evolution chart</h2>
        <c:forEach var="evo" items="${lstEvo }">
				<div class="infocard-list-evo">
					<div class="infocard ">
						<span class="infocard-lg-img"><a
							href="PokemonDatabase/pokedex/${evo.pkm1 }"><img
								class="img-fixed img-sprite "
								src="/PokemonDatabase/images/normal-size/charmander.png"
								alt="Charmander sprite"></a></span><span
							class="infocard-lg-data text-muted"><small>#00${evo.pkm1 }</small><br>
							<a class="ent-name" href="/pokedex/${evo.pkm1 }">Charmander</a><br>
							<small><a href="/type/fire" class="itype fire">Fire</a></small></span>
					</div>
					<span class="infocard infocard-arrow"><i
						class="icon-arrow icon-arrow-e"></i><small>${evo.yeuCau1 }</small></span>
					<div class="infocard ">
						<span class="infocard-lg-img"><a href="/pokedex/charmeleon"><img
								class="img-fixed img-sprite "
								src="https://img.pokemondb.net/sprites/bank/normal/charmeleon.png"
								alt="Charmeleon sprite"></a></span><span
							class="infocard-lg-data text-muted"><small>#005</small><br>
							<a class="ent-name" href="/pokedex/charmeleon">Charmeleon</a><br>
							<small><a href="/type/fire" class="itype fire">Fire</a></small></span>
					</div>
					<span class="infocard infocard-arrow"><i
						class="icon-arrow icon-arrow-e"></i><small>${evo.yeuCau2 }</small></span>
					<div class="infocard ">
						<span class="infocard-lg-img"><a href="/pokedex/charizard"><img
								class="img-fixed img-sprite "
								src="https://img.pokemondb.net/sprites/bank/normal/charizard.png"
								alt="Charizard sprite"></a></span><span
							class="infocard-lg-data text-muted"><small>#006</small><br>
							<a class="ent-name" href="/pokedex/charizard">Charizard</a><br>
							<small><a href="/type/fire" class="itype fire">Fire</a>
								&middot; <a href="/type/flying" class="itype flying">Flying</a></small></span>
					</div>
				</div>
			</c:forEach>
        <nav class="entity-nav component">
            <a rel="prev" class="entity-nav-prev" href="/pokedex/charmeleon">#005 Charmeleon</a>
            <a rel="next" class="entity-nav-next" href="/pokedex/squirtle">#007 Squirtle</a>
        </nav>
        </s:form>
    </main>
</body>
<style>
        .cell-barchart {
            width: 100%;
            min-width: 150px
        }

        .barchart-bar {
            height: .75rem;
            border-radius: 4px;
            background-color: #a3a3a3;
            border: 1px solid #737373;
            border-color: rgba(0, 0, 0, 0.15)
        }

        .barchart-rank-1 {
            background-color: #f34444
        }

        .barchart-rank-2 {
            background-color: #ff7f0f
        }

        .barchart-rank-3 {
            background-color: #ffdd57
        }

        .barchart-rank-4 {
            background-color: #a0e515
        }

        .barchart-rank-5 {
            background-color: #23cd5e
        }

        .barchart-rank-6 {
            background-color: #00c2b8
        }

        .etymology>dd {
            margin-bottom: 0
        }

        .type-table th,
        .type-table td {
            padding: 0;
            border: 1px solid #f0f0f0
        }

        .cell-atkdef {
            font-size: .625rem;
            font-weight: normal;
            line-height: 1
        }

        .type-cell {
            display: block;
            width: 66px;
            height: 28px;
            font-size: .625rem;
            margin-bottom: 0;
            line-height: 26px
        }

        .type-abbr {
            width: 28px
        }

        .type-fx-cell,
        .type-fx-icon {
            color: #ffdd57;
            font-size: .625rem;
            width: 28px;
            height: 28px;
            line-height: 26px;
            text-align: center
        }

        .type-fx-icon {
            display: inline-block;
            border: 1px solid #f0f0f0
        }

        .type-fx-25,
        .type-fx-50 {
            font-size: .75rem
        }

        .type-fx-null {
            background-color: #f0f0f0
        }

        .type-fx-0 {
            background-color: #2e3436
        }

        .type-fx-25 {
            background-color: #7c0000
        }

        .type-fx-50 {
            background-color: #a40000
        }

        .type-fx-100 {
            background-color: #ffffff
        }

        .type-fx-200 {
            background-color: #4e9a06
        }

        .type-fx-400 {
            background-color: #73d216
        }

        @media (min-width: 900px) {

            .type-cell,
            .type-fx-cell,
            .type-fx-icon {
                height: 36px;
                font-size: .75rem;
                line-height: 34px
            }

            .type-abbr,
            .type-fx-cell,
            .type-fx-icon {
                width: 36px
            }

            .cell-atkdef {
                line-height: 1.2
            }

            .type-fx-cell,
            .type-fx-icon {
                font-size: .75rem
            }

            .type-fx-25,
            .type-fx-50 {
                font-size: .875rem
            }
        }

        .type-fx-list {
            margin-left: 1.75rem
        }

        .cell-dual-type {
            display: flex
        }

        .cell-dual-type .type-icon:first-child {
            margin-right: 1px
        }

        .type-table .cell-total {
            padding: 0 10px
        }

        .has-pkmn>.cell-total {
            cursor: pointer
        }

        .has-pkmn>.cell-total:hover {
            background-color: #fffacd;
            text-decoration: underline
        }

        .modal-content>table {
            margin-bottom: 0
        }

        .type-table-dense .type-cell,
        .type-table-dense .type-fx-cell,
        .type-table-dense .type-fx-icon {
            height: 26px;
            font-size: .625rem;
            line-height: 24px
        }

        .type-table-dense .type-abbr,
        .type-table-dense .type-fx-cell,
        .type-table-dense .type-fx-icon {
            width: 26px
        }

        .infocard-list-types>.infocard {
            width: 168px
        }

        @supports (display: grid) {
            .infocard-list-types {
                grid-template-columns: repeat(auto-fit, minmax(160px, 1fr))
            }
        }

        .type-table-pokedex {
            display: inline-block;
            margin: 0 0 0 -1px
        }

        .infocard-list-evo {
            display: flex;
            justify-content: center;
            align-items: center
        }

        .infocard-list-evo>.infocard {
            width: 150px;
            vertical-align: middle
        }

        .infocard-list-evo>.infocard-arrow {
            width: 165px
        }

        .infocard-evo-split {
            display: flex;
            flex-direction: column;
            justify-content: center
        }

        .infocard-evo-split>.infocard-list-evo {
            justify-content: flex-start
        }

        .icon-arrow {
            display: block;
            font: normal 2.5rem/1 "Arial Unicode MS", "Trebuchet MS", "Arial", "Helvetica", sans-serif
        }

        .icon-arrow-n::before {
            content: "\2191\FE0E"
        }

        .icon-arrow-e::before {
            content: "\2192\FE0E"
        }

        .icon-arrow-s::before {
            content: "\2193\FE0E"
        }

        .icon-arrow-w::before {
            content: "\2190\FE0E"
        }

        .icon-arrow-ne::before {
            content: "\2197\FE0E"
        }

        .icon-arrow-se::before {
            content: "\2198\FE0E"
        }

        .icon-arrow-sw::before {
            content: "\2199\FE0E"
        }

        .icon-arrow-nw::before {
            content: "\2196\FE0E"
        }

        @media (max-width: 619px) {
            .infocard-list-evo {
                flex-direction: column
            }

            .infocard-list-evo>.infocard {
                width: auto;
                display: flex;
                justify-content: center;
                align-items: center;
                padding-bottom: 0
            }

            .infocard-list-evo>.infocard-arrow {
                flex-direction: column
            }

            .infocard-list-evo .infocard-lg-img {
                margin-right: .5rem
            }

            .infocard-list-evo .infocard-lg-data {
                text-align: left
            }

            .infocard-evo-split {
                width: 100%;
                flex-direction: row;
                flex-wrap: wrap;
                justify-content: space-around
            }

            .infocard-evo-split .infocard {
                max-width: 140px;
                flex-direction: column
            }

            .infocard-evo-split .infocard-arrow>small {
                order: 1
            }

            .infocard-evo-split .infocard-lg-data {
                text-align: center
            }

            .icon-arrow-e::before {
                content: "\2193"
            }

            .icon-arrow-ne::before {
                content: "\2193"
            }

            .icon-arrow-se::before {
                content: "\2193"
            }
        }

        .sprites-table th,
        .sprites-table td {
            border-width: 1px;
            text-align: center
        }

        .sprites-table tr:hover {
            background-color: transparent
        }

        .sprites-history-table th,
        .sprites-history-table td {
            padding: .75rem 1.25rem
        }

        .cell-sprite-games {
            width: 135px;
            padding-top: 1rem;
            padding-bottom: 1rem;
            vertical-align: top !important
        }

        .cell-sprite-list {
            min-width: 250px
        }

        .sprites-table-card {
            display: inline-block;
            vertical-align: top
        }

        .sprite-share-link {
            display: inline-block;
            border-radius: 4px;
            padding: .5rem;
            transition: background-color .3s ease-in-out
        }

        .sprite-share-link:hover {
            background-color: #e5fbec
        }

        .sprite-share-link.sprite-anim {
            min-width: 96px;
            min-height: 96px;
            line-height: 96px
        }

        .modal-content .input-text {
            width: 100%;
            padding: .25rem;
            font-family: "Consolas", "Ubuntu Mono", "Menlo", "Bitstream Vera Sans Mono", "Courier New", monospace;
            font-size: .75rem
        }
    </style>
</html>