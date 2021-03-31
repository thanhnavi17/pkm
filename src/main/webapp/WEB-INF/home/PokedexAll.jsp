<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	var currentURL = window.location.href;
	if(currentURL.search("=") == -1){
		layDanhSachPokemon();
	}else{
		var typePKM = currentURL.substring((currentURL.search("=")+1),currentURL.length);
	
		var pkmName = $('#txtTuKhoa').val();
		timKiem(pkmName,typePKM);
	}

	$('#txtTuKhoa').keyup(function(){
		var pkmname = $(this).val();
		var type = $('#filter-pkmn-type').val();
		if(pkmname == "" && type == 0){
			$('#dsPkm').empty();
			layDanhSachPokemon();
		}else{
			timKiem(pkmname,type);
		}
	});
	
	$('#filter-pkmn-type').change(function(){
		var type = $(this).val();
		var pkmname = $('#txtTuKhoa').val();
		if(type == 0 && pkmname == ""){
			$('#dsPkm').empty();
			layDanhSachPokemon();
		}else{
			timKiem(pkmname,type);
		}
	});
});
function layDanhSachPokemon() 
	{
		//Lấy danh sách chủ đề
		$
				.ajax({
					type : "GET",
					url : "http://localhost:8086/PokemonDatabase/dexAlls",
					dataType : "json",
					contentType : "application/json; charset=utf-8",
					async : true,
					traditional : true,
					success : function(result) {
						var thongtin = "";
						
						$
								.each(
										result,
										function(index, pkm) {
											if(pkm.type2>0) {
												thongtin += "<tr>";

												thongtin += "<td class='cell-num cell-fixed' data-sort-value='1'><span class='infocard-cell-img'><img class='img-fixed icon-pkmn' src='http://localhost:8086/PokemonDatabase/images/icon/"
					                            		 + pkm.icon +"' alt='"+pkm.form+" icon'></span><span class='infocard-cell-data'>00"
														+ pkm.pkmID + "</span>"
														+ "</td>";
												thongtin += "<td class='cell-name'><a class='ent-name' href='/PokemonDatabase/pokedex/"+pkm.pkmID +"'title='View Pokedex for #0"+pkm.pkmID+" "+ pkm.form+"'>"+pkm.form+"</a></td>";
										        thongtin += "<td class='cell-icon'><a class='type-icon type-"+pkm.typeName1+"' href='../type/"+pkm.typeName1+"'>"+pkm.typeName1
										        +"</a><br><a class='type-icon type-"+pkm.typeName2 +"' href='../type/"+pkm.typeName2 +"'>"+pkm.typeName2 +"</a></td>";
													thongtin += "<td class='cell-total'>"+(parseInt(pkm.hp)+parseInt(pkm.atk)+parseInt(pkm.def)+parseInt(pkm.spAtk)+parseInt(pkm.spDef)+parseInt(pkm.speed)) +"</td>";
													thongtin += "<td class='cell-num'>"+pkm.hp+"</td>";
													thongtin += "<td class='cell-num'>"+pkm.atk+"</td>";
													thongtin += "<td class='cell-num'>"+pkm.def+"</td>";
													thongtin += "<td class='cell-num'>"+pkm.spAtk+"</td>";
													thongtin += "<td class='cell-num'>"+pkm.spDef+"</td>";
													thongtin += "<td class='cell-num'>"+pkm.speed+"</td>";
												thongtin += "</tr>";
											} else {
												thongtin += "<tr>";

												thongtin += "<td class='cell-num cell-fixed' data-sort-value='1'><span class='infocard-cell-img'><img class='img-fixed icon-pkmn' src='http://localhost:8086/PokemonDatabase/images/icon/"
					                                		 + pkm.icon +"' alt='"+pkm.form+" icon'></span><span class='infocard-cell-data'>00"
															+ pkm.pkmID + "</span>"
															+ "</td>";
												thongtin += "<td class='cell-name'><a class='ent-name' href='/PokemonDatabase/pokedex/"+pkm.pkmID +"'title='View Pokedex for #0"+pkm.pkmID+" "+ pkm.form+"'>"+pkm.form+"</a></td>";
											    thongtin += "<td class='cell-icon'><a class='type-icon type-"+pkm.typeName1+"' href='../type/"+pkm.typeName1+"'>"+pkm.typeName1
											        +"</a></td>";
											    thongtin += "<td class='cell-total'>"+(parseInt(pkm.hp)+parseInt(pkm.atk)+parseInt(pkm.def)+parseInt(pkm.spAtk)+parseInt(pkm.spDef)+parseInt(pkm.speed)) +"</td>";
											    thongtin += "<td class='cell-num'>"+pkm.hp+"</td>";
													thongtin += "<td class='cell-num'>"+pkm.atk+"</td>";
													thongtin += "<td class='cell-num'>"+pkm.def+"</td>";
													thongtin += "<td class='cell-num'>"+pkm.spAtk+"</td>";
													thongtin += "<td class='cell-num'>"+pkm.spDef+"</td>";
													thongtin += "<td class='cell-num'>"+pkm.speed+"</td>";
											    thongtin += "</tr>";
											}
										});
						$('#dsPkm').append(thongtin);
					}
				});
	}
function timKiem(pkmname,type){
	$.ajax({
		type: "GET",
		url: "http://localhost:8086/PokemonDatabase/dexSearch/"+ pkmname +"&" + type,
		dataType : "json",
		contentType : "application/json; charset=utf-8",
		async : true,
		traditional : true,
		success: function(result){
			$('#dsPkm').empty();
			var thongtin = "";
			
			$
					.each(
							result,
							function(index, pkm) {
								if(pkm.type2>0) {
									thongtin += "<tr>";

									thongtin += "<td class='cell-num cell-fixed' data-sort-value='1'><span class='infocard-cell-img'><img class='img-fixed icon-pkmn' src='http://localhost:8086/PokemonDatabase/images/icon/"
		                            		 + pkm.icon +"' alt='"+pkm.form+" icon'></span><span class='infocard-cell-data'>00"
											+ pkm.pkmID + "</span>"
											+ "</td>";
									thongtin += "<td class='cell-name'><a class='ent-name' href='/PokemonDatabase/pokedex/"+pkm.pkmID +"'title='View Pokedex for #0"+pkm.pkmID+" "+ pkm.form+"'>"+pkm.form+"</a></td>";
							        thongtin += "<td class='cell-icon'><a class='type-icon type-"+pkm.typeName1+"' href='../type/"+pkm.typeName1+"'>"+pkm.typeName1
							        +"</a><br><a class='type-icon type-"+pkm.typeName2 +"' href='../type/"+pkm.typeName2 +"'>"+pkm.typeName2 +"</a></td>";
										thongtin += "<td class='cell-total'>"+(parseInt(pkm.hp)+parseInt(pkm.atk)+parseInt(pkm.def)+parseInt(pkm.spAtk)+parseInt(pkm.spDef)+parseInt(pkm.speed)) +"</td>";
										thongtin += "<td class='cell-num'>"+pkm.hp+"</td>";
										thongtin += "<td class='cell-num'>"+pkm.atk+"</td>";
										thongtin += "<td class='cell-num'>"+pkm.def+"</td>";
										thongtin += "<td class='cell-num'>"+pkm.spAtk+"</td>";
										thongtin += "<td class='cell-num'>"+pkm.spDef+"</td>";
										thongtin += "<td class='cell-num'>"+pkm.speed+"</td>";
									thongtin += "</tr>";
								} else {
									thongtin += "<tr>";

									thongtin += "<td class='cell-num cell-fixed' data-sort-value='1'><span class='infocard-cell-img'><img class='img-fixed icon-pkmn' src='http://localhost:8086/PokemonDatabase/images/icon/"
		                                		 + pkm.icon +"' alt='"+pkm.form+" icon'></span><span class='infocard-cell-data'>00"
												+ pkm.pkmID + "</span>"
												+ "</td>";
									thongtin += "<td class='cell-name'><a class='ent-name' href='/PokemonDatabase/pokedex/"+pkm.pkmID +"'title='View Pokedex for #0"+pkm.pkmID+" "+ pkm.form+"'>"+pkm.form+"</a></td>";
								    thongtin += "<td class='cell-icon'><a class='type-icon type-"+pkm.typeName1+"' href='../type/"+pkm.typeName1+"'>"+pkm.typeName1
								        +"</a></td>";
								    thongtin += "<td class='cell-total'>"+(parseInt(pkm.hp)+parseInt(pkm.atk)+parseInt(pkm.def)+parseInt(pkm.spAtk)+parseInt(pkm.spDef)+parseInt(pkm.speed)) +"</td>";
								    thongtin += "<td class='cell-num'>"+pkm.hp+"</td>";
										thongtin += "<td class='cell-num'>"+pkm.atk+"</td>";
										thongtin += "<td class='cell-num'>"+pkm.def+"</td>";
										thongtin += "<td class='cell-num'>"+pkm.spAtk+"</td>";
										thongtin += "<td class='cell-num'>"+pkm.spDef+"</td>";
										thongtin += "<td class='cell-num'>"+pkm.speed+"</td>";
								    thongtin += "</tr>";
								}
							});
			$('#dsPkm').append(thongtin);
		}
	});
}
</script>
</head>
<body>
<main id="main" class="main-content grid-container">
        <h1>Pokémon Pokédex</h1>
        <div class="panel panel-intro">
            <p>Đây là danh sách đầy đủ của mỗi <em>Pokémon</em> từ tất cả 8 thế hệ Pokémon, bao gồm cả các chỉ số chính của chúng.</p>
            <p>Sắp xếp các bảng bằng cách click vào đầu mỗi cột, và tìm kiếm bằng cách nhập từ khoá hoặc chọn các tính năng cần tìm dưới đây.</p>
        </div>
        
        <div class="grid-row">
            <div class="grid-col span-md-12 span-lg-12">
            <s:form modelAttribute="type" acceptCharset="utf-8" action="">
                <div class="table-filters">
                    <label for="filter-pkmn-name">Name:</label>
                    <input type="text" class="input-text" id="txtTuKhoa" data-filter-col="1">
                    <label for="filter-pkmn-type">Type:</label>
                    
                    <s:select id="filter-pkmn-type" data-filter-hash="type" data-filter-col="2" path="id">
                        <s:option value="0" label="--- All ---"/>
						<s:options items="${lstPkmType }"/>
                    </s:select>       
                </div>
                </s:form>
                <div class="resp-scroll">
                    <table id="pokedex" class="data-table block-wide">
                        <thead>
                            <tr>
                                <th class="sorting" data-sort="int">
                                    <div class="sortwrap">#</div>
                                </th>
                                <th class="sorting" data-sort="string">
                                    <div class="sortwrap">Name</div>
                                </th>
                                <th>
                                    <div class="sortwrap">Type</div>
                                </th>
                                <th class="sorting" data-sort="int">
                                    <div class="sortwrap">Total</div>
                                </th>
                                <th class="sorting" data-sort="int">
                                    <div class="sortwrap">HP</div>
                                </th>
                                <th class="sorting" data-sort="int">
                                    <div class="sortwrap">Attack</div>
                                </th>
                                <th class="sorting" data-sort="int">
                                    <div class="sortwrap">Defense</div>
                                </th>
                                <th class="sorting" data-sort="int">
                                    <div class="sortwrap">Sp. Atk</div>
                                </th>
                                <th class="sorting" data-sort="int">
                                    <div class="sortwrap">Sp. Def</div>
                                </th>
                                <th class="sorting" data-sort="int">
                                    <div class="sortwrap">Speed</div>
                                </th>
                            </tr>
                        </thead>
                        <tbody id="dsPkm">
                        
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
           
    </main>
</body>
</html>