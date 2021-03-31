<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
			$(this).html('½');
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
        <h1>Hệ của Pokemon &amp; Bảng tương khắc</h1>
        <div class="grid-row">
            <div class="grid-col span-md-4">
                <h2>Danh sách</h2>
                <p class="text-center">
                	<c:if test="${not empty lstType }">
						<c:forEach var="t" items="${lstType }">
							<a href="type/${t.type }" class="type-icon type-${t.type }">${t.type }</a>
						</c:forEach>
					</c:if>
                </p>
                <nav class="panel panel-nav">
                    <h3>Trang liên quan</h3>
                    <ul class="list-focus">
                        <li><a href="/type/dual">Dual type charts</a></li>
                        <li><a href="/type/old">Previous type charts</a></li>
                        <li><a href="/type/unused">Unused type combinations</a></li>
                    </ul>
                </nav>
                
            </div>
            <div class="grid-col span-md-8">
                <h2>Sơ lược về hệ</h2>
				<p>Tất cả các Pokemon và các moves của chúng đều mang hệ nhất
					định. Mỗi hệ sẽ mạnh hơn một vài hệ và yếu hơn vài hệ khác trong cả
					tấn công lẫn phòng thủ. Trong chiến đấu, bạn nên sử dụng Pokemon và
					chiêu thức có hệ có lợi hơn đối thủ; điều đó sẽ làm đòn đánh gây
					nhiều sát thương hơn mức bình thường.</p>
				<p>
					Khắc đơn hệ (ví dụ như 1 đòn tấn công hệ Water đánh vào Pokemon hệ
					Ground) sẽ khiến nó gây ra gấp đôi sát thương. Lợi thế cũng sẽ <q>cộng
						dồn</q>, đối với khắc song hệ (ví dụ như đòn tấn công hệ Water đánh
					vào Pokemon hệ Rock/Ground) sẽ gây ra gấp bốn lần sát thương .
					Trong cả hai trường hợp trên bạn đều sẽ thấy thông báo <q>It's
						super effective!</q> trong game sau khi tấn công.
				</p>
				<p>
					Ngược lại, bất lợi khi bị khắc bởi đơn hệ hoặc song hệ sẽ chỉ gây
					ra một nửa và một phần tư sát thương tương ứng.Và bạn sẽ thấy thông
					báo <q>It's not very effective...</q> trong game.
				</p>
				<p>
					Một tính năng khác về hệ là Same Type Attack Bonus (STAB). Như tên
					gọi của nó, đây là trường hợp tăng sát thương cho kỹ năng của
					Pokemon nếu Pokemon có hệ tương ứng với hệ của kỹ năng sử dụng (một
					ví dụ là Pokemon hệ Fire sử dụng Move hệ Fire). Trong trường hợp
					này, sát thương được tăng lên gấp 1.5 lần bình thường.Hơn nữa nó
					cũng được cộng dồn với các loại sát thương khắc hệ ở trên, nên một
					Pokemon hệ Water sử dụng một Move hệ Water tấn công một Pokemon
					mang song hệ Ground/Rock sẽ gây ra gấp <em>sáu lần</em>
					(2&times;2&times;1.5) sát thương so với bình thường!
				</p>
			</div>
        </div>
        <h2>Type chart</h2>
        <div class="grid-row">
            <div class="grid-col span-lg-4">
                <p>Biểu đồ loại đầy đủ ở đây hiển thị điểm mạnh và điểm yếu của từng loại. Nhìn xuống bên tay trái
                     bên cho loại tấn công, sau đó di chuyển qua để xem mức độ hiệu quả của nó đối với từng loại Pokémon .
                </p>
                <p class="text-small text-muted">Note: biểu đồ này dành cho các trò chơi từ năm 2013 trở đi - Pokémon X / Y, OR / AS,
                     Pokémon GO và Sun / Moon. Biểu đồ loại cho các trò chơi cũ hơn có một số khác biệt nhỏ - xem bên dưới .</p>
                <h3>Kí hiệu</h3>
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
            Generation 2, Dark and Steel types were added, while in Generation 6 (<a href="/x-y">Pokémon X and Pokémon
                Y</a>) the Fairy type was added. Below are the differences compared to the current type chart. The
            charts can be seen on the <a href="/type/old">Old Type Charts</a> page.</p>
        <h3>Generation 2-5</h3>
        <ul>
            <li>There was no <strong>Fairy</strong> type.
            <li><strong>Ghost</strong> and <strong>Dark</strong> type moves were not very effective against
                <strong>Steel</strong> type Pokémon. From Generation 6 they do neutral damage.
        </ul>
        <h3>Generation 1</h3>
        <ul>
            <li>There were no <strong>Dark</strong> or <strong>Steel</strong> types.
            <li><strong>Ghost</strong>-type moves had no effect on <strong>Psychic</strong> Pokémon. (Note
                that this only affected <a href="/move/lick">Lick</a> as <a href="/move/confuse-ray">Confuse Ray</a>
                and <a href="/move/night-shade">Night Shade</a> affected all Pokémon equally.)<br>
                <small class="text-muted">This was supposedly a mistake in the programming: several game guides stated
                    that Ghost was
                    super-effective on Psychic, and an in-game trainer at Saffron City says that <q>Psychic Pokémon
                        fear only ghosts and bugs!</q> It was corrected in Generation 2 when Ghost became
                    super-effective
                    against Psychic.</small>
            <li><strong>Bug</strong> was super-effective on <strong>Poison</strong> and vice-versa. This was changed so
                that Bug is now not very effective against Poison, and Poison now does regular damage against Bug.
            <li><strong>Ice</strong> type moves were neutral against <strong>Fire</strong> type Pokémon. Now
                they are not very effective.
        </ul>
    </main>
</body>
</html>