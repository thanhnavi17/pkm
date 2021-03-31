<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.cell-num').each(function () {
                var giaTri = $(this).attr('data-val');
                if (giaTri == 0) {
                    $(this).html('-');
                }
            });
        });
    </script>
</head>
<body>
<main id="main" class="main-content grid-container">
    <h1>Pokémon move list</h1>
    <div class="panel panel-intro">
        <p>This is a full list of <em>every Pokémon move</em> from all 8 generations of the game series.
            The power, accuracy and PP are listed along with any additional effects.</p>
        <p>Click a move name to see even more detailed information, including which Pokémon can learn that move. You
            can click a column heading to instantly sort by that column, or filter on move name, type and category
            using the options provided.</p>
    </div>
    <div class="table-filters">
        <s:form modelAttribute="move" acceptCharset="utf-8" action="">
            <label for="filter-move-name">Name:</label>
            <input type="text" tabindex="2" class="input-text" id="filter-move-name" data-filter-col="0,7">
            <label for="filter-move-type">Type:</label>
            <s:select tabindex="3" id="filter-move-type" data-filter-hash="type" data-filter-col="1" path="typeID">
                <s:option value="0" label="--- All ---"/>
                <s:options items="${lstPkmType }"/>
            </s:select>
            <label for="filter-move-cat">Category:</label>
            <s:select tabindex="4" id="filter-move-cat" data-filter-hash="cat" data-filter-col="2" path="moveTypeID">
                <s:option value="0" label="- All -"/>
                <s:options items="${lstCategory }"/>
            </s:select>
        </s:form>
    </div>
    <div class="resp-scroll">
        <table id="moves" class="data-table block-wide">
            <thead>
            <tr>
                <th class="sorting" data-sort="string">
                    <div class="sortwrap">Name</div>
                </th>
                <th class="sorting" data-sort="string">
                    <div class="sortwrap">Type</div>
                </th>
                <th class="sorting" data-sort="string">
                    <div class="sortwrap">Cat.</div>
                </th>
                <th class="sorting" data-sort="int" data-blanks="1">
                    <div class="sortwrap">Power</div>
                </th>
                <th class="sorting" data-sort="int" data-blanks="1">
                    <div class="sortwrap">Acc.</div>
                </th>
                <th class="sorting" data-sort="int" data-blanks="1">
                    <div class="sortwrap">PP</div>
                </th>
                <th class="sorting" data-sort="int" data-blanks="1">
                    <div class="sortwrap">TM</div>
                </th>
                <th>
                    <div class="sortwrap">Effect</div>
                </th>
                <th class="sorting" data-sort="int" data-blanks="1">
                    <div class="sortwrap">Prob. (%)</div>
                </th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${not empty lstMove }">
                <c:forEach var="move" items="${lstMove }">
                    <tr>
                        <td class="cell-name"><a class="ent-name" href="/move/${move.moveName }"
                                                 title="View details for ${move.moveName }">${move.moveName }</a>
                        </td>
                        <td class="cell-icon"><a class="type-icon type-${move.typeName }"
                                                 href="/type/${move.typeName }">${move.typeName }</a></td>
                        <td class="cell-icon" data-sort-value="special" data-filter-value="${move.objCategory.moveType }"><img
                                class="img-fixed icon-move-cat"
                                src="/PokemonDatabase/images/icon/${move.objCategory.moveType }.png"
                                alt="${move.objCategory.moveType }"
                                title="${move.objCategory.moveType }"></td>
                        <td class="cell-num" data-val="${move.power }">${move.power }</td>
                        <td class="cell-num" data-val="${move.accuracy }">${move.accuracy }</td>
                        <td class="cell-num">${move.pp }</td>
                        <td class="cell-num" data-sort-value="0">${move.tM }</td>
                        <td class="cell-long-text">${move.effect }</td>
                        <td class="cell-num" data-val="${move.proc }">${move.proc }</td>
                    </tr>
                </c:forEach>
            </c:if>
            </tbody>
        </table>
    </div>
</main>
</body>
</html>