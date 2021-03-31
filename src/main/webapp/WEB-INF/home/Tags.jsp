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
<div class="qa-body-wrapper">
    <div class="qa-main-heading">
        <h1>
            Most popular tags
        </h1>
    </div>
    <div class="grid-row">
        <div class="qa-main grid-col span-md-9">
				<div class="qa-part-ranking qa-ranking-tags-count">
					<c:if test="${not empty lstTags }">
						<c:forEach var="t" items="${lstTags }">
							<span class="qa-ranking-item qa-top-tags-item"> <span
								class="qa-top-tags-count">${t.tagCount } &#215;</span> <span
								class="qa-top-tags-label"><a href="./tags/${t.tag }"
									class="qa-tag-link">${t.tag }</a></span>
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
                        <a href="./tags?start=80" class="qa-page-link pagination-link">2</a>
                    </li>
                    <li class="qa-page-links-item">
                        <a href="./tags?start=160" class="qa-page-link pagination-link">3</a>
                    </li>
                    <li class="qa-page-links-item">
                        <a href="./tags?start=240" class="qa-page-link pagination-link">4</a>
                    </li>
                    <li class="qa-page-links-item">
                        <a href="./tags?start=320" class="qa-page-link pagination-link">5</a>
                    </li>
                    <li class="qa-page-links-item">
                        <span class="qa-page-ellipsis pagination-static">...</span>
                    </li>
                    <li class="qa-page-links-item">
                        <a href="./tags?start=5360" class="qa-page-link pagination-link">68</a>
                    </li>
                    <li class="qa-page-links-item">
                        <a href="./tags?start=80" class="qa-page-next pagination-link pagination-next">next</a>
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