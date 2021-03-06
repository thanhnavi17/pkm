<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        @font-face {
            font-family: 'Fira Sans';
            font-style: normal;
            font-weight: 400;
            font-display: swap;
            src: url("resources/home/fonts/fira-sans-v10-latin-400.woff2") format("woff2");
            unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD
        }

        @font-face {
            font-family: 'Fira Sans';
            font-style: italic;
            font-weight: 400;
            font-display: swap;
            src: url("resources/home/fonts/fira-sans-v10-latin-400i.woff2") format("woff2");
            unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD
        }

        @font-face {
            font-family: 'Fira Sans';
            font-style: normal;
            font-weight: 700;
            font-display: swap;
            src: url("resources/home/fonts/fira-sans-v10-latin-600.woff2") format("woff2");
            unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD
        }

        @font-face {
            font-family: 'Fira Sans';
            font-style: italic;
            font-weight: 700;
            font-display: swap;
            src: url("resources/home/fonts/fira-sans-v10-latin-600i.woff2") format("woff2");
            unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD
        }
    </style>
    <link rel="stylesheet" href="<c:url value="/resources/home/css/pokemondb-005c12ac6c.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/home/css/type-chart-7494ac3a2d.css"/>">
<script type="text/javascript">
$(document).ready(function(){
	$('.type-fx-cell').each(function(){
		var x = $(this).attr('data-val');
		if(x == 0.0){
			$(this).addClass('type-fx-0');
			$(this).html('0');
		}
		if(x == 0.5){
			$(this).addClass('type-fx-50');
			$(this).html('??');
		}
		if(x == 1.0){
			$(this).addClass('type-fx-100');
			$(this).html("");
		}
		if(x == 2.0){
			$(this).addClass('type-fx-200');
			$(this).html("2");
		}
	});
});
</script>
</head>
<body>
<main id="main" class="main-content grid-container">
        <h1>H??? c???a Pokemon &amp; B???ng t????ng kh???c</h1>
        <div class="grid-row">
            <div class="grid-col span-md-4">
                <h2>Danh s??ch</h2>
                <p class="text-center">
                	<c:if test="${not empty lstType }">
						<c:forEach var="t" items="${lstType }">
							<a href="type/${t.type }" class="type-icon type-${t.type }">${t.type }</a>
						</c:forEach>
					</c:if>
                </p>
                <nav class="panel panel-nav">
                    <h3>Trang li??n quan</h3>
                    <ul class="list-focus">
                        <li><a href="/type/dual">Dual type charts</a></li>
                        <li><a href="/type/old">Previous type charts</a></li>
                        <li><a href="/type/unused">Unused type combinations</a></li>
                    </ul>
                </nav>
                
            </div>
            <div class="grid-col span-md-8">
                <h2>S?? l?????c v??? h???</h2>
				<p>T???t c??? c??c Pokemon v?? c??c moves c???a ch??ng ?????u mang h??? nh???t
					?????nh. M???i h??? s??? m???nh h??n m???t v??i h??? v?? y???u h??n v??i h??? kh??c trong c???
					t???n c??ng l???n ph??ng th???. Trong chi???n ?????u, b???n n??n s??? d???ng Pokemon v??
					chi??u th???c c?? h??? c?? l???i h??n ?????i th???; ??i???u ???? s??? l??m ????n ????nh g??y
					nhi???u s??t th????ng h??n m???c b??nh th?????ng.</p>
				<p>
					Kh???c ????n h??? (v?? d??? nh?? 1 ????n t???n c??ng h??? Water ????nh v??o Pokemon h???
					Ground) s??? khi???n n?? g??y ra g???p ????i s??t th????ng. L???i th??? c??ng s??? <q>c???ng
						d???n</q>, ?????i v???i kh???c song h??? (v?? d??? nh?? ????n t???n c??ng h??? Water ????nh
					v??o Pokemon h??? Rock/Ground) s??? g??y ra g???p b???n l???n s??t th????ng .
					Trong c??? hai tr?????ng h???p tr??n b???n ?????u s??? th???y th??ng b??o <q>It's
						super effective!</q> trong game sau khi t???n c??ng.
				</p>
				<p>
					Ng?????c l???i, b???t l???i khi b??? kh???c b???i ????n h??? ho???c song h??? s??? ch??? g??y
					ra m???t n???a v?? m???t ph???n t?? s??t th????ng t????ng ???ng.V?? b???n s??? th???y th??ng
					b??o <q>It's not very effective...</q> trong game.
				</p>
				<p>
					M???t t??nh n??ng kh??c v??? h??? l?? Same Type Attack Bonus (STAB). Nh?? t??n
					g???i c???a n??, ????y l?? tr?????ng h???p t??ng s??t th????ng cho k??? n??ng c???a
					Pokemon n???u Pokemon c?? h??? t????ng ???ng v???i h??? c???a k??? n??ng s??? d???ng (m???t
					v?? d??? l?? Pokemon h??? Fire s??? d???ng Move h??? Fire). Trong tr?????ng h???p
					n??y, s??t th????ng ???????c t??ng l??n g???p 1.5 l???n b??nh th?????ng.H??n n???a n??
					c??ng ???????c c???ng d???n v???i c??c lo???i s??t th????ng kh???c h??? ??? tr??n, n??n m???t
					Pokemon h??? Water s??? d???ng m???t Move h??? Water t???n c??ng m???t Pokemon
					mang song h??? Ground/Rock s??? g??y ra g???p <em>s??u l???n</em>
					(2&times;2&times;1.5) s??t th????ng so v???i b??nh th?????ng!
				</p>
			</div>
        </div>
        <h2>Type chart</h2>
        <div class="grid-row">
            <div class="grid-col span-lg-4">
                <p>The full type chart here displays the strengths and weaknesses of each type. Look down the left hand
                    side for the attacking type, then move across to see how effective it is against each Pok??mon type.
                </p>
                <p class="text-small text-muted">Note: this chart is for games from 2013 onwards - Pok??mon X/Y, OR/AS,
                    Pok??mon GO and Sun/Moon. Type charts for older games have some minor differences - see below.</p>
                <h3>Chart key</h3>
                <ul class="list-blank">
                    <li><span class="type-fx-icon type-fx-0">0</span>
                        No effect <span class="text-muted">(0%)</span>
                    <li><span class="type-fx-icon type-fx-50">&frac12;</span>
                        Not very effective <span class="text-muted">(50%)</span>
                    <li><span class="type-fx-icon type-fx-100">&nbsp;</span>
                        Normal <span class="text-muted">(100%)</span>
                    <li><span class="type-fx-icon type-fx-200">2</span>
                        Super-effective <span class="text-muted">(200%)</span>
                </ul>
                <h3>Downloads</h3>
                <p>You can download the type chart as an image to print out and keep handy as you are playing and
                    battling!</p>
                <p>
                    <a class="panel panel-link panel-cyan text-shadow-dark"
                        href="https://img.pokemondb.net/images/typechart.png" title="Pokemon Type Chart">
                        <span class="img-fixed icon-item-img"
                            data-src="https://img.pokemondb.net/sprites/items/poke-ball.png"
                            data-alt="Pok?? Ball"></span> <span class="icon-string">Gen 6+ type chart image</span>
                    </a>
                </p>
            </div>
            <div class="grid-col span-lg-8 resp-scroll">
                <div class="resp-scroll">
                    <table class="type-table">
                        <thead>
                            <tr>
                                <th class="cell-atkdef">DEFENSE&nbsp;&#8594;<br>ATTACK&nbsp;&#8628;</th>
                                <c:forEach var="t" items="${lstType }">
                                <th><a class="type-icon type-${t.type } type-cell type-abbr" href="type/${t.type }"
                                        title="${t.type }">${t.vietTat }</a></th>
                                </c:forEach>
                            </tr>
                        </thead>
                        <tbody>
                        
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <h2>Type chart changes</h2>
        <p>The majority of the type chart has remained the same over the years, but there have been a few changes. In
            Generation 2, Dark and Steel types were added, while in Generation 6 (<a href="/x-y">Pok??mon X and Pok??mon
                Y</a>) the Fairy type was added. Below are the differences compared to the current type chart. The
            charts can be seen on the <a href="/type/old">Old Type Charts</a> page.</p>
        <h3>Generation 2-5</h3>
        <ul>
            <li>There was no <strong>Fairy</strong> type.
            <li><strong>Ghost</strong> and <strong>Dark</strong> type moves were not very effective against
                <strong>Steel</strong> type Pok??mon. From Generation 6 they do neutral damage.
        </ul>
        <h3>Generation 1</h3>
        <ul>
            <li>There were no <strong>Dark</strong> or <strong>Steel</strong> types.
            <li><strong>Ghost</strong>-type moves had no effect on <strong>Psychic</strong> Pok??mon. (Note
                that this only affected <a href="/move/lick">Lick</a> as <a href="/move/confuse-ray">Confuse Ray</a>
                and <a href="/move/night-shade">Night Shade</a> affected all Pok??mon equally.)<br>
                <small class="text-muted">This was supposedly a mistake in the programming: several game guides stated
                    that Ghost was
                    super-effective on Psychic, and an in-game trainer at Saffron City says that <q>Psychic Pok??mon
                        fear only ghosts and bugs!</q> It was corrected in Generation 2 when Ghost became
                    super-effective
                    against Psychic.</small>
            <li><strong>Bug</strong> was super-effective on <strong>Poison</strong> and vice-versa. This was changed so
                that Bug is now not very effective against Poison, and Poison now does regular damage against Bug.
            <li><strong>Ice</strong> type moves were neutral against <strong>Fire</strong> type Pok??mon. Now
                they are not very effective.
        </ul>
    </main>
</body>
</html>