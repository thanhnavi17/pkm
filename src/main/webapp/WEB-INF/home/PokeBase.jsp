<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/home/css/pokemondb-50e199edcb.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/home/css/pokebase-30f0a62573.css"/>">
<script type="text/javascript">
	$(document).ready(function(){
		$('.post-tag').each(function(){
			var strID = $(this).attr('id');
			var id = strID.substring(5,strID.length);
			
			$.ajax({
				type: "GET",
				url: "http://localhost:8086/PokemonDatabase/pokebase/tagEachPost/"+ id,
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				async : true,
				traditional : true,
				success: function(result){
					var lstTag = "";
					$.each(result, function(index,t){
						lstTag += "<li class='qa-q-item-tag-item'><a href='<c:url value='/pokebase/tags/"+t.objTag.tag+"'/>' class='qa-tag-link'>"+t.objTag.tag+"</a></li> &nbsp;";
					});
					$("#"+ strID).append(lstTag);
				}
			});
		});
	});
</script>
</head>
<body>
    <div class="qa-body-wrapper">
        <div class="qa-main-heading">
            <h1>
                Các bài đăng gần đây
            </h1>
        </div>
        <div class="grid-row">
            <div class="qa-main grid-col span-md-9">
            <%if(session.getAttribute("userOnline") != null){ %>
				<div class="panel panel-warning">
					Chào mừng, ${sessionScope.userOnline.username }! Nơi đây có vài sự
					khác biệt so với các diễn đàn thông thường, vậy nên vui lòng hãy
					đọc hết <a href="/pokebase/rules"><b> điều khoản và luật lệ</b></a>
					trước khi tham gia, cảm ơn.<br> <small class="text-muted">Thông
						báo này sẽ không xuất hiện nếu thành viên đạt 80 điểm trở lên.</small>
				</div>
				<%
					}
				%>
                <div class="panel panel-intro">
					<p>Chào mừng đến với PokéBase, nơi bạn có thể tìm hiểu mọi thứ
						về Pokémon! Bạn có thể hỏi về các vấn đề gặp phải trong Pokémon
						games và nhận được các phản hồi nhanh chóng, tích cực từ cộng đồng
						tuyệt vời của chúng ta. Bắt đầu khám phá nào !</p>
				</div>
                <div class="qa-part-q-list">
						<form method="post" action="./">
							<div class="qa-q-list qa-q-list-vote-disabled">
							<c:if test="${not empty lstQuestion }">
							<c:forEach var="q" items="${lstQuestion }">
								<div class="qa-q-list-item" id="${q.id }">
									<div class="qa-q-item-stats">
										<div class="qa-voting qa-voting-net" id="voting_330807">
											<div class="qa-vote-buttons qa-vote-buttons-net">
												<input title="Please view this question to vote"
													type="submit" value=""
													class="qa-vote-first-button qa-vote-up-disabled"
													disabled="disabled">
											</div>
											<div class="qa-vote-count qa-vote-count-net">
												<span class="qa-netvote-count"> <span
													class="qa-netvote-count-data">${q.vote }</span><span
													class="qa-netvote-count-pad"> vote</span>
												</span>
											</div>
											<div class="qa-vote-buttons qa-vote-buttons-net">
												<input title="Please view this question to vote"
													type="submit" value=""
													class="qa-vote-second-button qa-vote-down-disabled"
													disabled="disabled">
											</div>
											<div class="qa-vote-clear"></div>
										</div>
										<span class="qa-a-count"> <span class="qa-a-count-data">${q.ansCount }</span><span
											class="qa-a-count-pad"> answers</span>
										</span>
									</div>
									<div class="qa-q-item-main">
										<div class="qa-q-item-title">
											<a href="<c:url value="/pokebase/${q.id }"/>">${q.title }</a>
										</div>
										<span class="qa-q-item-avatar-meta"> <span
											class="qa-q-item-meta"> <a
												href="./pokebase/${q.id }"
												class="qa-q-item-what">post</a> <span
												class="qa-q-item-when"> <span
													class="qa-q-item-when-data">${q.ngayTao }</span>
											</span> <span class="qa-q-item-who"> <span
													class="qa-q-item-who-pad">by </span> <span
													class="qa-q-item-who-data"><a
														href="./user/${q.objUser.username }" class="qa-user-link">${q.objUser.username }</a></span>
											</span>
										</span>
										</span>
										<div class="qa-q-item-tags">
											<ul class="qa-q-item-tag-list post-tag" id="tags_${q.id }">

											</ul>
										</div>
									</div>
									<div class="qa-q-item-clear"></div>
								</div>
								</c:forEach>
								</c:if>
							</div>
						</form>
					</div>
                <div class="qa-suggest-next">
                    Để xem nhiều hơn, chọn <a href="./questions">danh sách tất cả câu hỏi</a> hoặc <a
                        href="pokebase/tags">các tags phổ biến</a>.
                </div>
            </div>
            <div class="qa-sidepanel grid-col span-md-3">
                <div class="qa-widgets-side qa-widgets-side-top">
                    <div class="qa-widget-side qa-widget-side-top">
                        <div class="qa-activity-count">
                            <p class="qa-activity-count-item">
                                <span class="qa-activity-count-data">${lstQuestion.size() }</span> questions
                            </p>
                            <p class="qa-activity-count-item">
                                <span class="qa-activity-count-data">${answerCount }</span> answers
                            </p>
                            <p class="qa-activity-count-item">
                                <span class="qa-activity-count-data">${cmtCount }</span> comments
                            </p>
                            <p class="qa-activity-count-item">
                                <span class="qa-activity-count-data">${userCount }</span> users
                            </p>
                        </div>
                    </div>
                    <div class="qa-widget-side qa-widget-side-top">
                        <h3>
                            Các tags phổ biến
                        </h3>
                        <ul class="qa-q-item-tag-list">
                            <li class="qa-q-item-tag-item">
                                <a href="./tag/xy" class="qa-tag-link">xy</a>
                                × 4803
                            </li>
                            
                            <li class="qa-q-item-tag-item">
                                <a href="./tag/anime" class="qa-tag-link">anime</a>
                                × 757
                            </li>
                            <li class="qa-q-item-tag-item">
                                <a href="./tag/types" class="qa-tag-link">types</a>
                                × 673
                            </li>
                            <li class="qa-q-item-tag-item">
                                <a href="./tag/eggs" class="qa-tag-link">eggs</a>
                                × 653
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>