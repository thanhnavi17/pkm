<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:url value="/pokebase/user-edit" var="userEdit" />
<div class="qa-body-wrapper">
    <div class="qa-main-heading">
        <h1>
            Thông tin tài khoản
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
            <div class="qa-part-form-profile">
                <s:form enctype="multipart/form-data" method="post" action="${userEdit }" modelAttribute="user">
                    <table class="qa-form-wide-table">
                        <tr>
                            <td class="qa-form-wide-label">
                                Tham gia từ:
                            </td>
                            <td class="qa-form-wide-data">
                                <span class="qa-form-wide-static">${user.ngayTao }</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="qa-form-wide-label">
                                Loại tài khoản:
                            </td>
                            <td class="qa-form-wide-data">
                                <span class="qa-form-wide-static">${user.objRole.role }</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="qa-form-wide-label">
                                Tên đăng nhập:
                            </td>
                            <td class="qa-form-wide-data">
                                <span class="qa-form-wide-static">${user.username }</span>
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="qa-form-wide-label">
                                Email:
                            </td>
                            <td class="qa-form-wide-data">
                                <s:input type="text" class="qa-form-wide-text" path="email"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="qa-form-wide-label" style="vertical-align:top;">
                                Avatar:
                            </td>
                            <td class="qa-form-wide-data">
                                <input name="avatar" type="radio" value="" checked class="qa-form-wide-radio"> None
                            </td>
                        </tr>
                        <tr>
                            <td class="qa-form-wide-label">
                                Họ tên:
                            </td>
                            <td class="qa-form-wide-data">
                                <s:input path="name" type="text" value="" class="qa-form-wide-text"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="qa-form-wide-label">
                                Địa chỉ:
                            </td>
                            <td class="qa-form-wide-data">
                                <s:input path="address" type="text" value="" class="qa-form-wide-text"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="qa-form-wide-label">
                                Điện thoại:
                            </td>
                            <td class="qa-form-wide-data">
                                <s:input path="phone" type="text" value="" class="qa-form-wide-text"/>
                            </td>
                        </tr>
                   
                        <tr>
                            <td class="qa-form-wide-label">
                                Friend Code:
                            </td>
                            <td class="qa-form-wide-data">
                                <s:input path="friendCode" type="text" value="" class="qa-form-wide-text"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="qa-form-wide-label" style="vertical-align:top;">
                                Giới thiệu:
                            </td>
                            <td class="qa-form-wide-data">
                                <s:textarea path="intro" rows="8" cols="40" class="qa-form-wide-text"></s:textarea>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="qa-form-wide-buttons">
                                <input value="Save Profile" title=""
                                    type="submit" class="qa-form-wide-button qa-form-wide-button-save btn btn-primary">
                            </td>
                        </tr>
                    </table>
                </s:form>
            </div>
            <div class="qa-part-form-password">
                <h2>Đổi mật khẩu</h2>
                <form method="post" action="./account">
                    <table class="qa-form-wide-table">
                        <tr>
                            <td class="qa-form-wide-label">
                                Mật khẩu cũ:
                            </td>
                            <td class="qa-form-wide-data">
                                <input name="oldpassword" type="password" value="" class="qa-form-wide-text">
                            </td>
                        </tr>
                        <tr>
                            <td class="qa-form-wide-label">
                                Mật khẩu mới:
                            </td>
                            <td class="qa-form-wide-data">
                                <input name="newpassword1" type="password" value="" class="qa-form-wide-text">
                            </td>
                        </tr>
                        <tr>
                            <td class="qa-form-wide-label">
                                Nhập lại mật khẩu mới:
                            </td>
                            <td class="qa-form-wide-data">
                                <input name="newpassword2" type="password" value="" class="qa-form-wide-text">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="qa-form-wide-buttons">
                                <input value="Change Password" title="" type="submit"
                                    class="qa-form-wide-button qa-form-wide-button-change btn">
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