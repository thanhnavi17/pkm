<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/home/css/pokemondb-50e199edcb.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/home/css/pokebase-30f0a62573.css"/>">
<script type="text/javascript">
	$(document).ready(function(){
		$('#tags').keyup(function(){
			$('#tag_hints').empty();
			var keyword = $('#tags').val();
			var chuoi = ""
			for(var i = (keyword.length-1); i >= 0;i-- ){
				if(keyword[i] == ","){
					break;
				}
				chuoi += keyword[i];
			}
			var str = "";
			for(var i = (chuoi.length-1); i >= 0; i--){
				str += chuoi[i];
			}
			console.log(str);
			if(str != ""){
				$.ajax({
					type: "GET",
					url: "http://localhost:8086/PokemonDatabase/pokebase/showTags/"+ str,
					dataType : "json",
					contentType : "application/json; charset=utf-8",
					async : true,
					traditional : true,
					success: function(result){
						$('#tag_complete_title').css('display','block');
						var tags = "";
						$.each(result, function(index,tag){
							tags += ("<a href='' class='qa-tag-link myTag' data-tag='"+tag.tag+"'><span style='font-weight:normal;'>"+tag.tag+"</span></a> &nbsp;");
						})
						$('#tag_hints').append(tags);
					}
				});
			}else{
				$('#tag_complete_title').css('display','none');
			}
		});
		
		$('#tag_hints').on('click','.myTag',function(e){		
			e.preventDefault();
			var tagName = $(this).attr('data-tag');
			var chuoi = $('#tags').val();
			var viTri = 0;
			for(var i = (chuoi.length-1); i >= 0; i--){
				if(chuoi[i] == ","){
					viTri = i;
					break;
				}
			}
			var str = chuoi.slice(0, viTri);
			if(str != ""){
				$('#tags').val(str+","+tagName+",");
			}else{
				$('#tags').val(tagName+",");
			}
		
			$('#tag_complete_title').css('display','none');
			$('#tag_hints').empty();
			
		});
	});
</script>
</head>
<body>
<c:url value="/pokebase/ask-a-question" var="ask" />
<%if(session.getAttribute("userOnline") != null){ %>
    <div class="qa-body-wrapper">
        <div class="qa-main-heading">
            <h1>
                Ask a question
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
                <div class="qa-part-form">
                    <s:form name="ask" method="post" action="${ask }" modelAttribute="question">
                        <table class="qa-form-tall-table">
                            <tr>
                                <td class="qa-form-tall-label">
                                    Tiêu đề:
                                </td>
                            </tr>
                            <tr>
                                <td class="qa-form-tall-data">
                                    <s:input name="title" id="title" type="text" value=""
                                        class="qa-form-tall-text" path="title"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="qa-form-tall-data">
                                    <span id="similar"></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="qa-form-tall-label">
                                    Nội dung bài viết:
                                </td>
                            </tr>
                            <tr>
                                <td class="qa-form-tall-data">
                                    <div id="wmd-button-bar-content" class="wmd-button-bar"></div>
                                    <s:textarea path="content" id="wmd-input-content" class="wmd-input"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="qa-form-tall-label">
                                    Tags:
                                </td>
                            </tr>
                            <tr>
                                <td class="qa-form-tall-data">
                                    <input name="tags" id="tags" type="text" value="" class="qa-form-tall-text">
                                    <div class="qa-form-tall-note"><span id="tag_examples_title"
                                            style="display:none;">Example tags: </span><span id="tag_complete_title"
                                            style="display:none;">Matching tags: </span><span id="tag_hints"></span></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="qa-form-tall-label">
                                    <label> <input name="notify"
											type="checkbox" value="1" class="qa-form-tall-checkbox">
											Email me if my question is answered or commented on
									</label>
									</td>
                            </tr>
                            <tr>
                                <td colspan="1" class="qa-form-tall-buttons">
                                    <input onclick="qa_show_waiting_after(this, false); " value="Ask the Question" title=""
                                        type="submit" class="qa-form-tall-button qa-form-tall-button-ask btn btn-primary">
                                </td>
                            </tr>
                        </table>
                    </s:form>
                </div>
            </div>
            <div class="qa-sidepanel grid-col span-md-3">
                <div class="qa-widgets-side qa-widgets-side-top">
                    <div class="qa-widget-side qa-widget-side-top">
                        <div class="qa-activity-count">
                            <p class="qa-activity-count-item">
                                <span class="qa-activity-count-data">45,943</span> questions
                            </p>
                            <p class="qa-activity-count-item">
                                <span class="qa-activity-count-data">86,323</span> answers
                            </p>
                            <p class="qa-activity-count-item">
                                <span class="qa-activity-count-data">182,474</span> comments
                            </p>
                            <p class="qa-activity-count-item">
                                <span class="qa-activity-count-data">78,446</span> users
                            </p>
                        </div>
                    </div>
                    <div class="qa-widget-side qa-widget-side-top">
                        <h3>
                            Most popular tags
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
    <%}else{ %>
    	<div class="qa-error">
			Vui lòng <a href="../home/login">đăng nhập</a> hoặc <a href="./register">đăng ký</a> để thực hiện tính năng này.
		</div>
    <%} %>
<script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
<script>
	CKEDITOR.replace( 'content' );
</script>
</body>
</html>