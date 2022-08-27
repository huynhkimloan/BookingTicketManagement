<%-- 
    Document   : updateroute
    Created on : Aug 11, 2022, 8:07:25 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<c:url value="/admin/routes/editroute" var="edit" />
<form:form action="${edit}" modelAttribute="route" method="post" enctype="multipart/form-data" acceptCharset="UTF-8">
    <div class="mb-3">
        <label class="form-label">Mã tuyến</label>
        <form:input type="text" class="form-control" path="id" readonly="true"/>
    </div>
    <div class="mb-3">
        <label class="form-label">Tên tuyến</label>
        <form:input type="text" class="form-control" path="routename"/>
    </div>
    <div class="mb-3">
        <label class="form-label">Điểm đi</label>
        <form:input type="text" class="form-control" path="startingpoint"/>
    </div>
    <div class="mb-3">
        <label class="form-label">Điểm đến</label>
        <form:input type="text" class="form-control" path="destination"/>
    </div>
    <div class="mb-3">
        <label class="form-label">Giá tiền</label>
        <form:input type="number" class="form-control" path="price"/>
    </div>
    <div class="mb-3">
        <label class="form-label">Giá đặc biệt</label>
        <form:input type="number" class="form-control" path="specialprice"/>
    </div>
    <div class="mb-3">
        <label class="form-label">Ảnh</label>
        <form:input type="text" class="form-control" path="image" id="display-image"/>
        
        <label for="firstimg"><i class="btn btn-secondary" style = "margin: 5px 0 5px 0; cursor: pointer;">Chọn ảnh </i></label>
        <input type = "file" id = "firstimg" hidden="hidden" onchange="getImage()"/>
    </div>
    <div>
        <input class="btn btn-warning" type="submit" value="Sửa"/>     
        <a href="<c:url value="/admin/routes/list" />" class="btn btn-info" type="button" data-toggle="tooltip" 
           data-placement="top" title="Hủy"><i class="fas fa-undo"></i></a> 
    </div>
</form:form>

<script type="text/javascript">
    function getImage()
    {
        const fileChoose = document.getElementById('firstimg');
        document.getElementById('display-image').setAttribute('value',
        fileChoose.value.match( /[\/\\]([\w\d\s\.\-\(\)]+)$/)[1]);
    }
</script>