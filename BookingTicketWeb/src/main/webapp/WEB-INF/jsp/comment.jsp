<%-- 
    Document   : comment
    Created on : Aug 13, 2022, 8:37:18 PM
    Author     : dieuh
--%>


<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1  class=" alert alert-success" style="text-align: center;">BÌNH LUẬN CỦA KHÁCH HÀNG</h1>


<form onsubmit="addComment(event, ${tripId})">
    <div class="form-group">
        <label for="comment1">Bình luận của bạn:</label>
        <textarea class="form-control" rows="5" id="commentId" ></textarea>
        <br> 
        <input class="btn btn-primary" type="submit" value="Gửi bình luận" /> 
    </div>
</form>

<c:if test="${comments.size() == 0}">
    <p>Không có bình luận</p>
</c:if>

<div id="commentArea">
    <c:forEach items="${comments}" var="comment">
        <div class="col-md-4 col-xs-12" style="padding:10px;">
            <div class="card">
                <div class="card-body ">
                    <div style="display: flex; margin: auto">
                        <img style="width:45px;" src="${comment.customerId.avatar}" class="rounded-circle" />
                        <p style="height:10%; vertical-align: middle; padding-top: 10px; margin-left: 10px"> ${comment.customerId.name}</p>
                    </div>
                    <p>Nội dung: ${comment.content}</p>
                    <p class="comment-date"> ${comment.createddate} </p>
                    <hr>                   
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<div>
    <ul class="pagination">
        <c:forEach begin="1" end="${Math.ceil(commentCounter/10)}" var="a">
            <li class="page-item"><a class="page-link" href="<c:url value="/comment/${tripId}/${trip.id}" />?page=${a}">${a}</a></li>
            </c:forEach>
    </ul>
</div>

<script>
    window.onload = function () {
        let dates = document.getElementsByClassName("comment-date");
        for (let  i = 0; i < dates.length; i++)
            dates[i].innerText = "Ngày tạo:" + moment(dates[i].innerText).fromNow();
        
    };
</script>

<script src="<c:url value="/js/comment.js"/>"></script>