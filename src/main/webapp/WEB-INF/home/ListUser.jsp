<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="qa-body-wrapper">
    <div class="qa-main-heading">
        <h1>
            List user
        </h1>
    </div>
    <div class="grid-row">
        <div class="qa-main grid-col span-md-9">
            <div class="panel panel-warning">
                Chào mừng, ${sessionScope.userOnline.username }! Nơi đây có vài sự
					khác biệt so với các diễn đàn thông thường, vậy nên vui lòng hãy
					đọc hết <a href="/pokebase/rules"><b> điều khoản và luật lệ</b></a>
					trước khi tham gia, cảm ơn.<br> <small class="text-muted">Thông
						báo này sẽ không xuất hiện nếu thành viên đạt 80 điểm trở lên.</small>
            </div>
				<div class="qa-part-ranking qa-ranking-users-points">
					<c:if test="${not empty lstUser }">
						<c:forEach var="u" items="${lstUser }">
							<span class="qa-ranking-item qa-top-users-item"> <span
								class="qa-top-users-avatar"> <a href="<c:url value="pokebase/user/${u.username }"/>"
									class="qa-avatar-link"><img src="<c:url value="/images/icon/${u.avatar }"/>" width="30" height="30" class="qa-avatar-image" alt=""></a>
							</span> <span class="qa-top-users-label"><a
									href="./user/${u.username }" class="qa-user-link">${u.username }</a></span> <span
								class="qa-top-users-score">${u.objRole.role }</span>
							</span>
						</c:forEach>
					</c:if>
				</div>
				<div class="qa-page-links pagination">
                <span class="qa-page-links-label pagination-static">Page:</span>
                <ul class="qa-page-links-list">
                    <li class="qa-page-links-item">
                        <b class="qa-page-selected pagination-static">1</b>
                    </li>
                    <li class="qa-page-links-item">
                        <a href="./users?start=60" class="qa-page-link pagination-link">2</a>
                    </li>
                    <li class="qa-page-links-item">
                        <a href="./users?start=120" class="qa-page-link pagination-link">3</a>
                    </li>
                    <li class="qa-page-links-item">
                        <a href="./users?start=180" class="qa-page-link pagination-link">4</a>
                    </li>
                    <li class="qa-page-links-item">
                        <a href="./users?start=240" class="qa-page-link pagination-link">5</a>
                    </li>
                    <li class="qa-page-links-item">
                        <span class="qa-page-ellipsis pagination-static">...</span>
                    </li>
                    <li class="qa-page-links-item">
                        <a href="./users?start=19980" class="qa-page-link pagination-link">334</a>
                    </li>
                    <li class="qa-page-links-item">
                        <a href="./users?start=60" class="qa-page-next pagination-link pagination-next">next</a>
                    </li>
                </ul>
                <div class="qa-page-links-clear">
                </div>
            </div>
        </div>
        <div class="qa-sidepanel grid-col span-md-3">
            <div class="qa-sidebar">
                <h3>Câu hỏi hữu dụng</h3>
                <ul class="sidebar-list">
                    <li><a href="/pokebase/meta/70889/username-changes-spring-2020">Làm sao để thay đổi thông tin</a>
                    <li><a href="/pokebase/meta/3000/how-do-you-get-a-picture-on-your-account-avatar">Làm sao để tạo avatar</a>
                    <li><a href="/pokebase/meta/16349/why-was-my-post-hidden-the-mega-thread">Tại sao post của tôi bị ẩn?</a>
                    <li><a href="/pokebase/meta/7120/might-suggest-question-etiquette-the-subgroups-pokemondb">Hãy lịch sự khi đặt câu hỏi</a>
                    <li><a href="/pokebase/meta/7370/flags-vs-down-votes">Report và báo cáo xấu</a>
                    <li><a href="/pokebase/meta/5004/anime-faq-for-anyone-who-wants-it">Anime FAQ</a>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>