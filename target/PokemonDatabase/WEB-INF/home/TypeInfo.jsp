<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<main id="main" class="main-content grid-container">
    <h1 style="text-transform: capitalize;">${objType.type } <span class="text-muted">(type)</span></h1>
    <div class="panel panel-intro">
        <p><em style="text-transform: capitalize;">${objType.type }</em> is one of the three basic elemental types along with Water and Grass, which constitute the
            three starter Pokémon. This creates a simple triangle to explain the type concept easily to new players.
            <em>Fire</em> types are notoriously rare in the early stages of the games so choosing the <em>Fire</em>
            variation starter is often a plus.</p>
    </div>
    <div class="stat-summary">
        <div class="stat-summary-item">
            <span class="stat-summary-count">${lstPkmForm.size() }</span><br>
            ${objType.type } type Pokémon
        </div>
        <div class="stat-summary-item">
            <span class="stat-summary-count">${singleType }</span><br>
            Single type Pokémon
        </div>
        <div class="stat-summary-item">
            <span class="stat-summary-count">${lstPkmForm.size() - singleType }</span><br>
            Dual type Pokémon
        </div>
        <div class="stat-summary-item">
            <span class="stat-summary-count">42</span><br>
            ${objType.type }-type moves
        </div>
    </div>
    <div class="component text-center" style="min-height:90px">
        <div id="bsa-zone_1612827473385-3_123456"></div>
    </div>
    <div class="grid-row">
        <div class="grid-col span-md-12 span-lg-12">
            <div class="grid-row">
                <div class="grid-col span-md-6 span-lg-6">
                    <h2>Attack <i>pros &amp; cons</i></h2>
						<c:if test="${not empty lstDefSuperE }">
							<p>
								<img class="img-fixed icon-16"
									src="https://img.pokemondb.net/images/icons/tick-16.png"
									alt="Tick"> <span class="icon-string"><em style="text-transform: capitalize;">${objType.type }</em>
									moves are super-effective against:</span>
							</p>
							<p class="type-fx-list">
								<c:forEach var="defsp" items="${lstDefSuperE }">
									<a class="type-icon type-${defsp.objDef.type }"
										href="../type/${defsp.objDef.type }">${defsp.objDef.type }</a>
								</c:forEach>
							</p>
						</c:if>
						<p>
							<img class="img-fixed icon-16"
								src="https://img.pokemondb.net/images/icons/cross-16.png"
								alt="Cross"><span class="icon-string"><em style="text-transform: capitalize;">${objType.type }</em>
								moves are not very effective against:</span>
						</p>
						<p class="type-fx-list">
							<c:forEach var="defNotE" items="${lstDefNotE }">
								<a class="type-icon type-${defNotE.objDef.type }"
									href="../type/${defNotE.objDef.type }">${defNotE.objDef.type }</a>
							</c:forEach>
						</p>
						<c:if test="${not empty lstDefNoE }">
							<p>
								<span class="img-fixed icon-16"
									data-src="https://img.pokemondb.net/images/icons/cross-16.png"
									data-alt="Cross"></span> <span class="icon-string"><em style="text-transform: capitalize;">${objType.type }</em>
									moves have no effect on:</span>
							</p>
							<p class="type-fx-list">
								<c:forEach var="defNoE" items="${lstDefNoE }">
									<a class="type-icon type-${defNoE.objDef.type }"
										href="../type/${defNoE.objDef.type }">${defNoE.objDef.type }</a>
								</c:forEach>
							</p>
						</c:if>
					</div>
                <div class="grid-col span-md-6 span-lg-6">
                    <h2>Defense <i>pros &amp; cons</i></h2>
						<c:if test="${not empty lstAtkNoE }">
							<p>
								<span class="img-fixed icon-16"
									data-src="https://img.pokemondb.net/images/icons/tick-16.png"
									data-alt="Tick"></span> <span class="icon-string">These
									types have no effect on <em style="text-transform: capitalize;">${objType.type }</em>
									Pokémon:
								</span>
							</p>
							<p class="type-fx-list">
								<c:forEach var="atkNoE" items="${lstAtkNoE }">
									<a class="type-icon type-${atkNoE.objAtk.type }"
										href="../type/${atkNoE.objAtk.type }">${atkNoE.objAtk.type }</a>
								</c:forEach>
							</p>
						</c:if>
						<c:if test="${not empty lstAtkNotE }">
							<p>
								<span class="img-fixed icon-16"
									data-src="https://img.pokemondb.net/images/icons/tick-16.png"
									data-alt="Tick"></span> <span class="icon-string">These
									types are not very effective against <em
									style="text-transform: capitalize;">${objType.type }</em>
									Pokémon:
								</span>
							</p>
						</c:if>
						<p class="type-fx-list">
							<c:forEach var="atkNotE" items="${lstAtkNotE }">
								<a class="type-icon type-${atkNotE.objAtk.type }"
									href="../type/${atkNotE.objAtk.type }">${atkNotE.objAtk.type }</a>
							</c:forEach>
						</p>
						<p>
							<span class="img-fixed icon-16"
								data-src="https://img.pokemondb.net/images/icons/cross-16.png"
								data-alt="Cross"></span> <span class="icon-string">These
								types are super-effective against <em
								style="text-transform: capitalize;">${objType.type }</em>
								Pokémon:
							</span>
						</p>
						<p class="type-fx-list">
							<c:forEach var="atkspE" items="${lstAtkSuperE }">
								<a class="type-icon type-${atkspE.objAtk.type }"
									href="../type/${atkspE.objAtk.type }">${atkspE.objAtk.type }</a>
							</c:forEach>
						</p>
					</div>
            </div>
        </div>
    </div>
    <h2 style="text-transform: capitalize;">${objType.type } Pokémon stat averages</h2>
    <div class="stat-summary">
        <div class="stat-summary-item">
            <span class="stat-summary-count">${hp }</span><br>
            HP<br>
        </div>
        <div class="stat-summary-item">
            <span class="stat-summary-count">${atk }</span><br>
            Attack<br>
        </div>
        <div class="stat-summary-item">
            <span class="stat-summary-count">${def }</span><br>
            Defense<br>
        </div>
        <div class="stat-summary-item">
            <span class="stat-summary-count">${spA }</span><br>
            Sp. Attack<br>
        </div>
        <div class="stat-summary-item">
            <span class="stat-summary-count">${spD }</span><br>
            Sp. Defense<br>
        </div>
        <div class="stat-summary-item">
            <span class="stat-summary-count">${speed }</span><br>
            Speed<br>
        </div>
    </div>
    <div class="component text-center" style="min-height:90px">
        <div id="bsa-zone_1612827473385-3_123456"></div>
    </div>
    <h2 style="text-transform: capitalize;">${objType.type } Pokémon</h2>
    <p>There are <strong>${lstPkmForm.size() }</strong> ${objType.type }-type Pokémon.<br>
        See also:</p>
    <ul>
        <li><a href="../pokedex/all#type=${objType.id }" style="text-transform: capitalize;">${objType.type } Pokémon with stats</a></li>
        <li><a href="../move/all#type=${objType.id }" style="text-transform: capitalize;">${objType.type } attacks</a></li>
    </ul>
		<div class="infocard-list infocard-list-pkmn-md">
			<c:if test="${not empty lstPkmForm }">
				<c:forEach var="form" items="${lstPkmForm }">
					<div class="infocard">
						<span class="infocard-md-img"><img
							class="img-fixed icon-pkmn" src="../images/icon/${form.icon }"
							alt="${form.form } icon"></span><span class="infocard-md-data"><a
							href="../pokedex/${form.pkmID }" class="ent-name">${form.form }</a><br>
							<small class="text-muted">#00${form.pkmID } / <a href="../type/${form.typeName1 }"
								class="itype ${form.typeName1 }" style="text-transform: capitalize;">${form.typeName1 }</a>
								<c:if test="${form.type2 > 0 }">
								·
								<a href="../type/${form.typeName2 }"
								class="itype ${form.typeName2 }" style="text-transform: capitalize;">${form.typeName2 }</a>
								</c:if>
							</small>
						</span>
					</div>
				</c:forEach>
			</c:if>
		</div>
		<div class="component text-center" style="min-height:90px">
        <div id="bsa-zone_1612827518798-2_123456"></div>
    </div>
</main>
</body>
</html>