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
        <h1>Pokémon Database - Tin tức &amp; Cập nhật</h1>
        <div class="panel panel-intro">
            <p><b>Chào mừng đến với Pokémon Database!</b> Chúng tôi tin rằng đấy là nơi tìm kiếm thông tin về pokemon một cách dễ dàng</p>
            <p>
				Dưới đây bạn có thể tìm kiếm các thông tin và cập nhật về các
				Pokemon. Hãy sử dụng menu phía trên để tìm kiếm Pokedex, Stat
				Pokemon, các dạng tiến hoá và cộng đồng thân thiện của chúng ta, nơi
				có rất nhiều fan của Pokemon sẵn sàng trả lời các câu hỏi của bạn.
				Và nhiều hơn thế nữa!
				<!--  <a href="/pokedex">Pokédex entries</a>,
                <a href="/move">attack stats</a>,
                <a href="/evolution">evolution chains</a> and our
                <a href="/pokebase/">thriving community</a> of awesome Pokéfans who'll answer your questions.
                And much more besides!-->
            </p>
        </div>
        <div class="grid-row">
            <div class="grid-col span-md-8">
				<c:if test="${not empty lstNews }">
					<c:forEach var="n" items="${lstNews }">
						<h2>
							<a href="news/${n.id }">${n.tieuDe }</a>
						</h2>
						<p class="pull-up text-muted">General News &#8212; 13 January,
							2021</p>
						<span>${n.moTa }</span>
							<a class="nav-forward"
								href="news/${n.id }">Continue
								reading</a>
						<hr>
					</c:forEach>
				</c:if>
				<div class="pagination"><span class="pagination-static">Page:</span> <b class="pagination-static">1</b>
                    <a class="pagination-link" href="/news/page/2">2</a> <a class="pagination-link"
                        href="/news/page/3">3</a> <b class="pagination-static">...</b> <a class="pagination-link"
                        href="/news/page/25">25</a> <a class="pagination-link pagination-next"
                        href="/news/page/2">Next</a> </div>
            </div>
            <div class="grid-col span-md-4">
                <a class="panel panel-link panel-cyan text-shadow-dark" href="https://www.facebook.com/mac.thanh.798/">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="img-fixed" width="32"
                        height="32" aria-label="Twitter" role="img">
                        
                    </svg> <span class="icon-string">Follow @pokemondb on Facebook</span>
                </a>
                <h3>Các tìm kiếm phổ biến</h3>
                <div class="grid-row text-small">
                    <div class="grid-col span-md-6">
                        <a href="/pokedex/national">National Pokédex</a><br>
                        <a href="/pokedex/game/lets-go-pikachu-eevee">Let's Go Pokédex</a><br>
                        <a href="/pokedex/game/ultra-sun-ultra-moon">Ultra Sun/Moon Pokédex</a>
                    </div>
                    <div class="grid-col span-md-6">
                        <a href="/pokedex/all">Pokémon stats</a><br>
                        <a href="/pokedex/shiny">Shiny Pokédex</a><br>
                        <a href="/type">Type chart</a>
                    </div>
                </div>
                <div class="grid-row">
                    <div class="grid-col span-md-6">
                        <ul class="list-blank text-muted text-small">
                            <li>#006 <a href="pokedex/6">Charizard</a>
                            <li>#025 <a href="pokedex/25">Pikachu</a>
                            <li>#034 <a href="pokedex/34">Nidoking</a>
                            <li>#038 <a href="pokedex/38">Ninetales</a>
                            <li>#059 <a href="pokedex/59">Arcanine</a>
                            <li>#094 <a href="pokedex/94">Gengar</a>
                        </ul>
                    </div>
                    <div class="grid-col span-md-6">
                        <ul class="list-blank text-muted text-small">
                            <li>#130 <a href="/pokedex/130">Gyarados</a>
                            <li>#133 <a href="/pokedex/133">Eevee</a>
                            <li>#149 <a href="/pokedex/149">Dragonite</a>
                            <li>#150 <a href="/pokedex/150">Mewtwo</a>
                            <li>#150 <a href="/pokedex/26">Raichu</a>
                            <li>#809 <a href="/pokedex/143">Snorlax</a>
                        </ul>
                    </div>
                </div>
                <p class="text-center">
                	<c:if test="${not empty lstPkmType }">
						<c:forEach var="type" items="${lstPkmType }">
							<a href="type/${type.type }" class="type-icon type-${type.type }">${type.type }</a>
						</c:forEach>
					</c:if>
                </p>                
            </div>
        </div>
        
    </main>

</body>
</html>