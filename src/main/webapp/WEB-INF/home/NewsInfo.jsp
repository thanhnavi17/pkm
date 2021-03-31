<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<main id="main" class="main-content grid-container">
    <h1>${objNew.tieuDe }</h1>
    <div class="grid-row">
        <div class="grid-col span-md-8">
            <p class="text-muted">General News &#8212; 13 January, 2021</p>
            <div>${objNew.noiDung }</div>
        </div>
        <div class="grid-col span-md-4">
            <div class="component text-center" style="min-height:250px">
                <div id="bsa-zone_1612827561562-2_123456"></div>
            </div>
            <h2>Recent news</h2>
            <ul class="list-blank list-articles">
            <c:if test="${not empty lstNews }">
					<c:forEach var="n" items="${lstNews }">
                <li>
                    <p><a href="news/${n.id }">${n.tieuDe }</a><br>
                        <small class="text-muted">26 February, 2021 &#8226; General News</small>
                    </p>
                </li>
            </c:forEach>
            </c:if>    
            </ul>
            
        </div>
    </div>
</main>
</body>
</html>