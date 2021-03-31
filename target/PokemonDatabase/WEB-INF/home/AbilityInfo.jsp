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
    <h1>${objAbi.ability } <span class="text-muted">(ability)</span></h1>
    <div class="grid-row">
        <div class="grid-col span-md-12 span-lg-6">
            <h2>Mô tả</h2>
            <p>${objAbi.chiTiet }</p>
            <div class="component text-center" style="min-height:250px">
                <div id="bsa-zone_1612996493918-9_123456"></div>
            </div>
        </div>
        <div class="grid-col span-md-12 span-lg-6">
            <h2>Pokémon sở hữu ${objAbi.ability }</h2>
            <div class="resp-scroll">
                <table class="data-table">
                    <thead>
                        <tr>
                            <th class="sorting" data-sort="int">
                                <div class="sortwrap">#</div>
                            </th>
                            <th class="sorting" data-sort="string">
                                <div class="sortwrap">Name</div>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:if test="${not empty lstForm }">
							<c:forEach var="f" items="${lstForm }">
                        <tr>
                            <td class="cell-num cell-fixed" data-sort-value="${f.id }"><span
                                    class="infocard-cell-img"><img class="img-fixed icon-pkmn"
                                        src="../images/icon/${f.icon }"
                                        alt="${f.form } icon"></span><span
                                    class="infocard-cell-data">${f.pkmID }</span></td>
                            <td class="cell-name"><a class="ent-name" href="../pokedex/${f.pkmID }"
                                    title="View Pokedex for ${f.pkmID } ${f.form}">${f.form}</a></td>
                        </tr>
                    </c:forEach>
                    </c:if>    
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="component text-center" style="min-height:90px">
        <div id="bsa-zone_1612827518798-2_123456"></div>
    </div>
</main>
</body>
</html>