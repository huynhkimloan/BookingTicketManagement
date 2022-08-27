<%-- 
    Document   : updatetrip
    Created on : Aug 14, 2022, 3:18:23 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<c:url value="/admin/trips/edittrip" var="edit" />
<form:form action="${edit}" modelAttribute="trip" method="post" enctype="multipart/form-data" acceptCharset="UTF-8">
    <c:if test="${ms!=null}">
        <div class="alert alert-danger">${ms}</div>
    </c:if>
    <div class="mb-3">
        <label class="form-label">Mã chuyến</label>
        <form:input type="text" class="form-control" path="id" readonly="true"/>
    </div>
    <div class="mb-3">
        <label class="form-label">Tên chuyến</label>
        <form:input type="text" class="form-control" path="coachname"/>
    </div>
    <div class="mb-3">
        <label class="form-label" for="departureday">Ngày khởi hành</label>
        <form:input type="text" class="form-control" path="departureday" id="departureday" name="departureday"/>
    </div>
    <div class="mb-3">
        <label class="form-label" for="departuretime">Giờ khởi hành</label>
        <form:input type="text" class="form-control" path="departuretime" id="departuretime" name="departuretime"/>
    </div>
    <div class="mb-3">
        <label class="form-label" for="arrivaltime">Giờ đến</label>
        <form:input type="text" class="form-control" path="arrivaltime" name="arrivaltime"  id="arrivaltime"/>
    </div>
    <div class="mb-3">
        <label class="form-label">Tuyến xe</label>
        <form:select path="routeId" class="form-select">
            <c:forEach items="${routes}" var="r">
                <option value="${r.id}">${r.routename}</option>
            </c:forEach>
        </form:select>
    </div>
    <div class="mb-3">
        <label class="form-label">Nhân viên phụ trách</label>
        <form:select path="userIdEmployee" class="form-select">
            <c:forEach items="${users}" var="r">
                <option value="${r.id}">${r.name}</option>
            </c:forEach>
        </form:select>
    </div>
    <div class="mb-3">
        <label class="form-label">Xe</label>
        <form:select class="form-select" path="passengercarId">
            <c:forEach items="${pcars}" var="r">
                <option value="${r.id}">${r.name}</:option>
            </c:forEach>
        </form:select>
    </div>
    <div class="mb-3">
        <label class="form-label">Trạng thái</label>
        <form:select class="form-select" path="active">
            <option value="1">true</option>
            <option value="0">false</option>
        </form:select>
    </div>
    <div class="mb-3">
        <label class="form-label">Ảnh</label>
        <form:input type="text" class="form-control" path="image"/>
    </div>
    <div>
        <input class="btn btn-warning" type="submit" value="Sửa"/>     
        <a href="<c:url value="/admin/trips/list" />" class="btn btn-info" type="button" data-toggle="tooltip" 
           data-placement="top" title="Hủy"><i class="fas fa-undo"></i></a> 
    </div>
</form:form>
