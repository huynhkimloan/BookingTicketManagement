<%-- 
    Document   : addtrip
    Created on : Aug 14, 2022, 3:18:06 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<c:url value="/admin/trips/savetrip" var="save" />
<form:form method="post" action="${save}" modelAttribute="trip" enctype="multipart/form-data" acceptCharset="UTF-8">
    <div class="mb-3">
        <label class="form-label">Tên chuyến</label>
        <form:input type="text" class="form-control" path="coachname" placeholder="Nhập tên chuyến..."/>
    </div>
    <div class="mb-3">
        <label class="form-label" for="departureday">Ngày khởi hành</label>
        <form:input type="text" class="form-control" id="departureday" path="departureday" name="departureday" placeholder="Nhập ngày khởi hành..."/>
    </div>
    <div class="mb-3">
        <label class="form-label" for="departuretime">Giờ khởi hành </label>
        <form:input type="text" class="form-control" id="departuretime" path="departuretime" name="departuretime" placeholder="Nhập giờ khởi hành..."/>
    </div>
    <div class="mb-3">
        <label class="form-label" for="arrivaltime">Giờ đến</label>
        <form:input type="text" class="form-control" id="arrivaltime" path="arrivaltime" name="arrivaltime" placeholder="Nhập giờ đến..."/>
    </div>
    <div class="mb-3">
        <label class="form-label">Tuyến xe</label>
        <form:select class="form-select" path="routeId">
            <c:forEach items="${routes}" var="r">
                <option value="${r.id}">${r.routename}</option>
            </c:forEach>
        </form:select>
    </div>
    <div class="mb-3">
        <label class="form-label">Nhân viên phụ trách</label>
        <form:select class="form-select" path="userIdEmployee">
            <c:forEach items="${users}" var="r">
                <option value="${r.id}">${r.name}</option>
            </c:forEach>
        </form:select>
    </div>
    <div class="mb-3">
        <label class="form-label">Xe</label>
        <form:select class="form-select" path="passengercarId">
            <c:forEach items="${pcars}" var="r">
                <option value="${r.id}">${r.name}</option>
            </c:forEach>
        </form:select>
    </div>
    <div class="mb-3">
        <label class="form-label">Ảnh</label>
        <form:input type="file" class="form-control" path="file" placeholder="Chọn ảnh..."/>
    </div>
    <div>
        <input class="btn btn-success" type="submit" value="Thêm"/>

        <a href="<c:url value="/admin/trips/addtrip" />" class="btn btn-info" type="button" data-toggle="tooltip" 
           data-placement="top" title="Quay lại"><i class="fas fa-undo"></i></a>

        <a href="<c:url value="/admin/trips/list" />" class="btn btn-secondary" type="button" data-toggle="tooltip" 
           data-placement="top" title="Danh sách"> <i class="fas fa-list"></i></a> 
    </div>
</form:form>
