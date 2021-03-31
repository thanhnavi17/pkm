<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<c:url value="/resources/home/css/pokemondb-50e199edcb.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/home/css/pokebase-30f0a62573.css"/>">
	<!-- SweetAlert2 -->
<link rel="stylesheet" href="<c:url value="/resources/admin/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css"/>">
<!-- Font Awesome -->
<link rel="stylesheet" href="<c:url value="/resources/admin/plugins/fontawesome-free/css/all.min.css"/>">
<script src="<c:url value="/resources/admin/plugins/sweetalert2/sweetalert2.min.js"/>"></script>
<script>
var Toast = Swal.mixin({
    toast: true,
    position: 'margin-auto',
    showConfirmButton: false,
    timer: 3000
  });
</script>
<script type="text/javascript">
	$(document).ready(function() {
		//Kiểm tra tương tác
		var postID = $('#postID').val();
		var user = $('.qa-logged-in-data').text();
		checkVote(postID, user);
		
		//Xử lý sự kiện khi kích vào vote hoặc unvote
		$('.myvote').click(function(e){
			e.preventDefault();
			var postID = $('#postID').val();
			var value = $(this).attr('data-val');

			var user = $('.qa-logged-in-data').text();
			$.ajax({
				type: "GET",
				url: "http://localhost:8086/PokemonDatabase/pokebase/vote/"+ postID+"&"+user+"&"+value,
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				async : true,
				traditional : true,
				success : function(result){
					if(result.isVote == 1){
						$('#vote-up').css('background-position','0 -32px');
						$('#vote-down').css('background-position','-24px -64px');
					}
					if(result.isVote == -1){
						$('#vote-down').css('background-position','-24px -32px');
						$('#vote-up').css('background-position','0 -64px');
					}
				},
				error : function(result){
					$('#vote-up').css('background-position','0 -64px');
					$('#vote-down').css('background-position','-24px -64px');
				}
			});
		});
		
		//Hiển thị form trả lời 
		$('#q_doanswer').click(function(e) {
			e.preventDefault();
			$('#anew').css('display', 'block');
		});
		
		//Yêu cầu đăng nhập
		$('.qa-form-light-button-comment').click(function(e) {
			e.preventDefault();
			var username = $('.qa-logged-in-data').text();
			if(username != ""){
				var ma = $(this).attr('data-val');
				$('#'+ma).css('display','block');
			} else{
				Toast.fire({
			        icon: 'warning',
			        title: 'Vui lòng đăng nhập'
			      })
			}
		});
		
		//Hiển thị comment con(cmt trong cmt)
		$('.qa-a-item-c-list').each(function(){
			var id = $(this).attr('id');
			var answerID = id.substring(5,id.length - 5);

			$.ajax({
				type: "GET",
				url: "http://localhost:8086/PokemonDatabase/pokebase/showReply/"+ answerID,
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				async : true,
				traditional : true,
				success: function(result){
					var lstReply = "";
					$.each(result, function(index,rep){
						lstReply += ("<div class='qa-c-list-item'>");
						lstReply += ("<div class='qa-c-item-content qa-post-content'>");
						lstReply += ("<div itemprop='text'>"+rep.reply+"</div></div>");
						lstReply += ("<small class='text-mute'>"+rep.ngayTao+" </small>");
						lstReply += ("<small class='text-mute'><a href=''> "+rep.objUser.username+"</a></small></div>");
					});
					$("#"+id).append(lstReply);
				}
			});
		});
		
		
	});
	function checkVote(questionID,username){
		if(username != ""){
			$.ajax({
				type: "GET",
				url: "http://localhost:8086/PokemonDatabase/pokebase/checkVote/"+ questionID +"&"+ username,
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				async : true,
				traditional : true,
				success: function(result){
					console.log(result.isVote);
					if(result.isVote == 1){
						$('#vote-up').css('background-position','0 -32px');
					}if(result.isVote == -1){
						$('#vote-down').css('background-position','-24px -32px');
					}
				}
			});
		}
	}
	function tru() {
        let obj = $('#quantity');
        let current = obj.html();
        if(current > 0) {
            obj.html(--current);
        }
    }

    function cong() {
        let obj = $('#quantity');
        let current = obj.html();
        obj.html(++current);
    }
</script>
</head>
<body>
	<c:url value="/pokebase/${objQ.id }/answer" var="urlAns" />
	<div><input type="hidden" value="${objQ.id }" id="postID"></div>
	<div class="qa-body-wrapper" itemprop="mainEntity" itemscope
		itemtype="https://schema.org/Question">
		<div class="qa-main-heading">
			<h1>
				<a href="#"> <span
					itemprop="name">${objQ.title }</span>
				</a>
			</h1>
		</div>
		<div class="grid-row">
			<div class="qa-main grid-col span-md-9">
				<div class="panel panel-warning">
				<%if(session.getAttribute("userOnline") != null){ %>
					Chào mừng, ${sessionScope.userOnline.username }! Nơi đây có vài sự
					khác biệt so với các diễn đàn thông thường, vậy nên vui lòng hãy
					đọc hết <a href="/pokebase/rules"><b> điều khoản và luật lệ</b></a>
					trước khi tham gia, cảm ơn.<br> <small class="text-muted">Thông
						báo này sẽ không xuất hiện nếu thành viên đạt 80 điểm trở lên.</small>
				<%} %>
				</div>
				<div class="qa-part-q-view">
					<div class="qa-q-view" id="q${objQ.id }">
						<div class="qa-q-view-stats">
							<form method="post" action="#">
								<div class="qa-voting qa-voting-net" id="voting_q${objQ.id }">
									<div class="qa-vote-buttons qa-vote-buttons-net">
										<input type="submit" value="" data-val="1" id="vote-up"
											class="qa-vote-first-button qa-vote-up-disabled myvote">
									</div>
									<div class="qa-vote-count qa-vote-count-net">
										<span class="qa-netvote-count"> <span
											class="qa-netvote-count-data" id="quantity">${objQ.vote }</span><span
											class="qa-netvote-count-pad"> votes

										</span>
										</span>
									</div>
									<div class="qa-vote-buttons qa-vote-buttons-net">
										<input type="submit" value="" data-val="-1" id="vote-down"
											class="qa-vote-second-button qa-vote-down-disabled myvote">
									</div>
									<div class="qa-vote-clear"></div>
								</div>
							</form>
							<form method="post"
								action="#">
								<span class="qa-favoriting" id="favoriting"> <input
									title="Add this question to my favorites"
									name="favorite_Q_${objQ.id }" type="submit" value=""
									class="qa-favorite-button">
								</span>
							</form>

						</div>
						<div class="qa-q-view-main">
							<form method="post" action="#">
								<div class="qa-q-view-content qa-post-content">
									${objQ.content }</div>
								<div class="qa-q-view-tags">
									<ul class="qa-q-view-tag-list">
										<c:if test="${not empty lstTags }">
											<c:forEach var="tag" items="${lstTags }">
												<li class="qa-q-view-tag-item"><a
													href="<c:url value="pokebase/tags/${tag.objTag.tag }"/>" rel="tag" class="qa-tag-link">${tag.objTag.tag }</a></li>
											</c:forEach>
										</c:if>
									</ul>
								</div>
								<span class="qa-q-view-avatar-meta"> <!--<span
									class="qa-q-view-avatar"> <a href="#"
										class="qa-avatar-link"><img
											src="https://www.gravatar.com/avatar/bbccfd783178645fbb9ee0084bd3762c?s=60"
											width="60" height="60" class="qa-avatar-image" alt=""></a>
								</span>--> <span class="qa-q-view-meta">đã đăng vào<span
										class="qa-q-view-when"> <span
											class="qa-q-view-when-data">${objQ.ngayTao }</span>
									</span> <span class="qa-q-view-who"> <span
											class="qa-q-view-who-pad">bởi </span> <span
											class="qa-q-view-who-data"><span itemprop="author"
												itemscope itemtype="https://schema.org/Person"><a
													href="../user/${objQ.objUser.username }" class="qa-user-link" itemprop="url"><span
														itemprop="name">${objQ.objUser.username }</span></a></span></span>
									</span> <br>
								</span>
								</span>
								<div class="qa-q-view-buttons">
									<input name="q_doanswer" id="q_doanswer" value="answer"
										title="Answer this question" type="submit"
										class="qa-form-light-button qa-form-light-button-answer ">
								</div>
							</form>
							
						</div>
						<div class="qa-q-view-clear"></div>
					</div>
				</div>
				<div class="qa-part-a-form">
					<div class="qa-a-form" id="anew" style="display: none;">
						<h2>Your answer</h2>
						<s:form method="post" action="${urlAns }" name="a_form"
							modelAttribute="answer">
							<table class="qa-form-tall-table">
								<tr>
									<td class="qa-form-tall-data">
										<div id="wmd-button-bar-a_content" class="wmd-button-bar"></div>
										<s:textarea path="answerContent" id="wmd-input-a_content"
											class="wmd-input" />

									</td>
								</tr>
								<tr>
									<td class="qa-form-tall-label"><label> <input
											name="a_notify" type="checkbox" value="1"
											class="qa-form-tall-checkbox"> Email me if my answer
											is selected or commented on
									</label></td>
								</tr>
								<tr>
									<td colspan="1" class="qa-form-tall-buttons"><input
										value="Add answer" title="" type="submit"
										class="qa-form-tall-button qa-form-tall-button-answer btn btn-primary">
										<input name="docancel" value="Cancel" title="" type="submit"
										class="qa-form-tall-button qa-form-tall-button-cancel btn">
									</td>
								</tr>
							</table>
						</s:form>
					</div>
				</div>
				<div class="qa-part-a-list">
					<h2 id="a_list_title">
						<span itemprop="answerCount">${lstAnswer.size() }</span> Answers
					</h2>
					<div class="qa-a-list" id="a_list">
						<c:if test="${not empty lstAnswer }">
							<c:forEach var="ans" items="${lstAnswer }">
								<div class="qa-a-list-item " id="ans${ans.id }" itemprop="suggestedAnswer" itemscope
									itemtype="https://schema.org/Answer">
									<form method="post" action="#">
										<div class="qa-voting qa-voting-net" id="voting_${ans.id }">
											<div class="qa-vote-buttons qa-vote-buttons-net">
												<input type="submit" value=""
													class="qa-vote-first-button qa-vote-up-disabled">
											</div>
											<div class="qa-vote-count qa-vote-count-net">
												<span class="qa-netvote-count"> <span
													class="qa-netvote-count-data">${ans.vote }</span><span
													class="qa-netvote-count-pad"> votes
												</span>
												</span>
											</div>
											<div class="qa-vote-buttons qa-vote-buttons-net">
												<input type="submit" value=""
													class="qa-vote-second-button qa-vote-down-disabled">
											</div>
											<div class="qa-vote-clear"></div>
										</div>

									</form>
									<div class="qa-a-item-main">
										<form method="post" action="#">
											<div class="qa-a-selection"></div>
											<div class="qa-a-item-content qa-post-content">
												${ans.answerContent }</div>
											<span class="qa-a-item-avatar-meta"> <span
												class="qa-a-item-meta"> đã trả lời vào <span
													class="qa-a-item-when"> <span
														class="qa-a-item-when-data">${ans.ngayTao }</span>
												</span> <span class="qa-a-item-who"> <span
														class="qa-a-item-who-pad">bởi </span> <span
														class="qa-a-item-who-data"><span itemprop="author"
															itemscope itemtype="https://schema.org/Person"><a
																href="../user/${ans.objUser.username }" class="qa-user-link"
																itemprop="url"><span itemprop="name">${ans.objUser.username }</span></a></span></span>
												</span> <br>
											</span>
											</span>
											<div class="qa-a-item-buttons">
												<input name="" value="comment" data-val="c_ans${ans.id }"
													title="Add a comment on this answer" type="submit"
													class="qa-form-light-button qa-form-light-button-comment">
											</div>
										</form>
										<div class="qa-a-item-c-list" id="c_ans${ans.id }_list">
											
										</div>
										<div class="qa-c-form" id="c_ans${ans.id }" style="display: none;">
										<c:url value="/pokebase/${ans.id }/comment" var="urlCmt" />
											<h2>Your comment on this answer:</h2>
											<s:form method="post" action="${urlCmt }" name="c_form" modelAttribute="reply">
												<table class="qa-form-tall-table">
													<tr>
														<td class="qa-form-tall-data"><s:textarea
																path="reply" rows="4" cols="40"
																class="qa-form-tall-text" /></td>
													</tr>
													<tr>
														<td colspan="1" class="qa-form-tall-buttons"><input
															value="Add comment" title="" type="submit"
															class="qa-form-tall-button qa-form-tall-button-comment btn">
															<input name="docancel" value="Cancel" title=""
															type="submit"
															class="qa-form-tall-button qa-form-tall-button-cancel btn">
														</td>
													</tr>
												</table>
											</s:form>
										</div>
									</div>
									<div class="qa-a-item-clear"></div>
								</div>
							</c:forEach>
						</c:if>
					</div>
					
				</div>
			</div>
			<div class="qa-sidepanel grid-col span-md-3">
				<div class="qa-widgets-side qa-widgets-side-top">
					<div class="qa-widget-side qa-widget-side-top">
						<div class="qa-related-qs">
							<h2 style="margin-top: 0; padding-top: 0;">Câu hỏi liên quan</h2>
							<ul class="qa-related-q-list">
								<li class="qa-related-q-item"><a
									href="../330787/is-this-facade-altaria-moveset-viable">Is
										this Facade Altaria moveset viable?</a></li>
								<li class="qa-related-q-item"><a
									href="../245924/altaria-or-tropius-oras">Altaria or Tropius
										(ORAS)?</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
	<script>
		CKEDITOR.replace('answerContent');
	</script>
</body>
</html>