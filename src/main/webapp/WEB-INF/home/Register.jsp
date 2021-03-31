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
	<c:url value="/register-a-new-user" var="urlRegister" />
	<div class="qa-body-wrapper">
		<div class="qa-main-heading">
			<h1>Register as a new user</h1>
		</div>
		<div class="grid-row">
			<div class="qa-main grid-col span-md-9">
				<div class="qa-part-form">
					<form method="post" action="${urlRegister }">
						<table class="qa-form-tall-table">
							<tr>
								<td class="qa-form-tall-label">Username:</td>
							</tr>
							<tr>
								<td class="qa-form-tall-data"><input name="username"
									id="username" dir="auto" type="text" value=""
									class="qa-form-tall-text"></td>
							</tr>
							<tr>
								<td><span style="color: red;">${userMess}</span></td>
							</tr>
							<tr>
								<td class="qa-form-tall-label">Password:</td>
							</tr>
							<tr>
								<td class="qa-form-tall-data"><input name="password"
									id="password" dir="auto" type="password" value=""
									class="qa-form-tall-text"></td>
							</tr>
							<tr>
								<td class="qa-form-tall-label">Email:</td>
							</tr>
							<tr>
								<td class="qa-form-tall-data"><input name="email"
									id="email" dir="auto" type="text" value=""
									class="qa-form-tall-text">
									<div class="qa-form-tall-note">Privacy: Your email
										address will not be shared or sold to third parties.</div></td>
							</tr>
							<tr>
								<td class="qa-form-tall-label">Anti-spam verification:</td>
							</tr>
							<tr>
								<td class="qa-form-tall-data">
									<div id="qa_captcha_div_1"></div>
								</td>
							</tr>
							<tr>
								<td colspan="1" class="qa-form-tall-buttons"><input
									onclick="qa_show_waiting_after(this, false);" value="Register"
									title="" type="submit"
									class="qa-form-tall-button qa-form-tall-button-register btn">
								</td>
							</tr>
						</table>
					</form>
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