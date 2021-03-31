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
</head>
<body>
<c:url value="/home/homeLogin" var="urlLogin" />

    <div class="qa-body-wrapper">
        <div class="qa-main-heading">
            <h1>
                Log in
            </h1>
        </div>
        <div class="grid-row">
            <div class="qa-main grid-col span-md-9">
                <div class="qa-part-form">
                    <form method="post" action="${urlLogin }">
                        <table class="qa-form-tall-table">
                            <tr>
                                <td class="qa-form-tall-label">
                                    Email or Username:
                                </td>
                            </tr>
                            <tr>
                                <td class="qa-form-tall-data">
                                    <input name="username" id="username" dir="auto" type="text" value=""
                                        class="qa-form-tall-text">
                                </td>
                            </tr>
                            <tr>
                                <td class="qa-form-tall-label">
                                    Password:
                                </td>
                            </tr>
                            <tr>
                                <td class="qa-form-tall-data">
                                    <input name="password" id="password" dir="auto" type="password" value=""
                                        class="qa-form-tall-text">
                                    <div class="qa-form-tall-note"><a href="./forgot">I forgot my password</a></div>
                                </td>
                            </tr>
                            <tr>
                            	<td><span style="color: red;">${message}</span></td>
                            </tr>
                            <tr>
                                <td class="qa-form-tall-label">
                                    <label>
                                        <input name="remember" type="checkbox" value="1" class="qa-form-tall-checkbox">
                                        Remember me on this computer
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="1" class="qa-form-tall-buttons">
                                    <input value="Log In" title="" type="submit"
                                        class="qa-form-tall-button qa-form-tall-button-login btn">
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