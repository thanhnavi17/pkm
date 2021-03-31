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
        <h1>Pokémon abilities</h1>
        <div class="panel panel-intro">
            <p>Mỗi ability của các thế hệ Pokemon nằm trong danh sách phía dưới và số các Pokemon sở hữu ability. Click vào tên của từng ability để xem Pokemon nào có thể học nó.
        </div>
        <div class="grid-row">
            <div class="grid-col span-md-4">
                <h2>Giới thiệu về ability</h2>
				<p>
					Abilities được giới thiệu ở thế hệ thứ 3(phiên bản Ruby/Sapphire)
					như một thuộc tính đặc biệt mang lại cho Pokemon sức mạnh mới trong
					các trận chiến. Khá nhiều ability có tác dụng <q>tăng sức mạnh</q>
					bằng cách tăng cường kỹ năng hoặc chỉ số, một số khác mang lại các
					hiệu ứng như thời tiết. Tất nhiên cũng có 1 vài ability làm cản trở
					Pokemon trong chiến đấu
				
				
				<p>Mỗi Pokemon chỉ có thể sở hữu 1 ability duy nhất, tuy nhiên
					cùng 1 loại Pokemon có thể có 2 hoặc 3 ability khác nhau.Tỉ lệ xuất
					hiện giữa các loại ability là tương đương nhau
				
				<p>
					Trong phiên bản <a href="version/black-white">Pokémon Black &amp;
						White</a>, có thêm 1 loại <q>hidden</q> ability . Ability đặc biệt này
					chỉ xuất hiện khi Pokemon trở về từ <em>Dream World</em>, một tính
					năng trực tuyến mới của Pokémon Global Link.
				
            </div>
            <div class="grid-col span-md-8">
                <h2>Danh sách ability</h2>
                <div class="table-filters">
                    <label for="filter-ability-name">Filter:</label>
                    <input type="text" class="input-text" id="filter-ability-name" data-filter-col="0,2">
                    <label for="filter-ability-gen">Gen:</label>
                    <select id="filter-ability-gen" data-filter-hash="gen" data-filter-col="3">
                        <option value="">- All -</option>
                        <option value="3">Generation 3</option>
                        <option value="4">Generation 4</option>
                        <option value="5">Generation 5</option>
                        <option value="6">Generation 6</option>
                        <option value="7">Generation 7</option>
                        <option value="8">Generation 8</option>
                    </select>
                </div>
                <div class="resp-scroll">
                    <table id="abilities" class="data-table block-wide">
                        <thead>
                            <tr>
                                <th class="sorting" data-sort="string">
                                    <div class="sortwrap">Name</div>
                                </th>
                                <th class="sorting" data-sort="int">
                                    <div class="sortwrap">Pokémon</div>
                                </th>
                                <th>
                                    <div class="sortwrap">Description</div>
                                </th>
                                <th class="sorting" data-sort="int">
                                    <div class="sortwrap">Gen.</div>
                                </th>
                            </tr>
                        </thead>
						<tbody>
							<c:forEach var="abi" items="${lstAbi }">
								<tr>
									<td><a class="ent-name" href="ability/${abi.ability }">${abi.ability }</a></td>
									<td class="cell-total">13</td>
									<td class="cell-med-text">${abi.moTa }</td>
									<td class="cell-num">${abi.generation }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
                </div>
            </div>
        </div>       
    </main>
</body>
</html>