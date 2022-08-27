<%-- 
    Document   : trip
    Created on : Aug 11, 2022, 4:11:26 PM
    Author     : dieuh
--%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div id="demo" class="carousel slide" data-bs-ride="carousel" style="padding-top:10px;">
    <!-- Indicators/dots -->
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
        <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
        <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
    </div>

    <!-- The slideshow/carousel -->
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="<c:url value="/img/xe2.png"/>" alt="Los Angeles" class="d-block w-100 ">
            <div class="carousel-caption">
                <h1 class="text-danger">CÁC TUYẾN ĐƯỜNG PHỔ BIẾN</h1>
                <p>We had such a great time in LA!</p>
            </div>
        </div>

        <div class="carousel-item">
            <img src="<c:url value="/img/xe3.jpg"/>" alt="Los Angeles" class="d-block w-100 ">
            <div class="carousel-caption">
                <h1 class="text-danger">CÁC TUYẾN ĐƯỜNG PHỔ BIẾN</h1>
                <p>We had such a great time in LA!</p>
            </div>
        </div>

        <div class="carousel-item">
            <img src="<c:url value="/img/x4.png"/>" alt="Los Angeles" class="d-block w-100 ">
            <div class="carousel-caption">
                <h1 class="text-danger">CÁC TUYẾN ĐƯỜNG PHỔ BIẾN</h1>
                <p>We had such a great time in LA!</p>
            </div>
        </div>
    </div>

    <!-- Left and right controls/icons -->
    <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
    </button>
</div>

<form action="">
    <div class="row">
        <ul class="nav search "  >
            <li class="nav-item" style="width: 60%; margin-left: 10%; display: flex;">
                <label style="width: 25%; font-size:20px; padding-top: 10px;">Chọn ngày đi  </label>
                <input type="date" name="kw" id="departureday"  class="form-control" style="padding: 10px; width: 100%;"/> 
            </li>
            <li class="nav-item" style="width: 15%; margin-right: 10%;">
                <input type="submit" value="Tìm" style="padding: 10px; text-align: center; font-size: 20px; width: 100%;" class="btn btn-success"/>
                <!--<button class="btn btn-primary" type="submit" style="padding: 10px; text-align: center; font-size: 20px; width: 100%;"><i class="fa-solid fa-magnifying-glass"></i>  Tìm</button>-->
            </li>    
        </ul>
    </div>  
</form>

<c:if test="${tripDeparturedays.size() == 0}">
    <p>Hôm nay không có chuyến xe nào khởi hành</p>
</c:if>

<div class="row">
    <c:forEach var="tripDepartureday" items="${tripDeparturedays}">
        <div class="col-md-4 col-xs-12" style="padding:10px;">
            <div class="card">
                <img class="img-fluid" src="<c:url value="/img/1.jpg"/>" alt="${trip.coachname}" />
                <div class="card-body ">
                    <h4>Chuyến đi: <i> ${tripDepartureday.coachname}</i></h4>
                    <h9>Ngày khởi hành: <b><fmt:formatDate pattern = "dd/MM/yyyy" value = "${tripDepartureday.departureday}" /></b></h9>
                    <hr>                   
                    <p>Giờ xuất phát: <fmt:formatDate type = "time" value = "${tripDepartureday.departuretime}" /> </p>  
                    <p>Thời gian đến: <fmt:formatDate type = "time" value = "${tripDepartureday.arrivaltime}" /> </p>
                    <a href="<c:url value="/reservation/${tripDepartureday.id}"/>" class="btn btn-primary  action">Đặt</a>
                    <a href="<c:url value="/comment/${tripDepartureday.id}"/>" class="btn btn-primary  action">Xem chi tiết</a>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

