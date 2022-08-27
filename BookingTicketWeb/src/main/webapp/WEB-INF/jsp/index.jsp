<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%--<c:if test="${currentUser != null}">
    ${currentUser.email}-${currentUser.name}
</c:if>--%>

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
            <img src="<c:url value="/img/a1.jpg"/>" alt="Los Angeles" class="d-block w-100 ">
            <div class="carousel-caption">
                <h1 style="padding-top: 100px; ">CÁC TUYẾN ĐƯỜNG PHỔ BIẾN</h1>
                <p>We will give you a great experience!!!</p>
            </div>
        </div>

        <div class="carousel-item">
            <img src="<c:url value="/img/a3.jpg"/>" alt="Los Angeles" class="d-block w-100 ">
            <div class="carousel-caption">
                <h1 style="padding-top: 100px; " >CÁC TUYẾN ĐƯỜNG PHỔ BIẾN</h1>
                <p>We will give you a great experience!!!</p>
            </div>
        </div>

        <div class="carousel-item">
            <img src="<c:url value="/img/a5.jpg"/>" alt="Los Angeles" class="d-block w-100 ">
            <div class="carousel-caption">
                <h1 style="padding-top:100px; ">CÁC TUYẾN ĐƯỜNG PHỔ BIẾN</h1>
                <p>We will give you a great experience!!!</p>
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


<!--Khi chỉ có admin mới hiện ra link này-->
<sec:authorize access="hasRole('Admin')">
    <div> 
        <a href="<c:url value="/admin" />" class="btn btn-danger" >Quản lý đặt vé </a>
    </div> 
</sec:authorize>

<form action="">
    <div class="row searchRoute">
        <ul class="nav" >
            <div class="selectPoint">
                <h5>Điểm đi</h5>
                <li class="nav-item point" >
                    <input class="form-control" list="browsers" name="kw" id="startingpoint">
                    <datalist id="browsers">
                        <option value="Sài Gòn">
                        <option value="Bình Định">
                        <option value="Phú Yên">
                        <option value="Bạc Liêu">
                        <option value="Bến Tre">
                        <option value="Hà Nội">
                        <option value="Đà Nẵng">
                        <option value="Cần Thơ">
                    </datalist>
                </li>
            </div>
            <li class="nav-item " style=""><i class="fa-solid fa-arrow-right-arrow-left btnpoint"></i></li>
            <div class="selectPoint">
                <h5>Điểm đến</h5>
                <li class="nav-item point" style="">
                    <input class="form-control" list="browsers" name="kw1" id="destination">
                    <datalist id="browsers">
                        <option value="Sài Gòn">
                        <option value="Bình Định">
                        <option value="Phú Yên">
                        <option value="Bạc Liêu">
                        <option value="Bến Tre">
                        <option value="Hà Nội">
                        <option value="Đà Nẵng">
                        <option value="Cần Thơ">
                    </datalist>
                </li> 
            </div>
            <li class="nav-item btnSearch" >
                <input style="background-color: rgba(255, 99, 71, 0.5); border-color: orange; border-radius: 5px;" type="submit" value="Tìm" />
            </li>
        </ul> 
    </div>
</form>

<div>
    <ul class="pagination">
        <c:forEach begin="1" end="${Math.ceil(counter/6)}" var="a">
            <li class="page-item"><a class="page-link" href="<c:url value="/" />?page=${a}">${a}</a></li>
            </c:forEach>
    </ul>
</div>
<c:if test="${routes.size() == 0}">
    <p>Không có tuyến bạn cần tìm</p>
</c:if>

<div class="row">
    <c:forEach var="route" items="${routes}">
        <div class="col-md-4 col-xs-12" style="padding:10px;">
            <div class="card">

                <img class="img-fluid card-header" src="<c:url value="${route.image}"/>" alt="${route.routename}" />
                <div class="card-body ">

                    <h3><i> ${route.startingpoint} - ${route.destination}</i></h3>
<!--                    <h9>Ngày khởi hành: <b><fmt:formatDate pattern = "dd/MM/yyyy" value = "${t.departureday}" /></b></h9>-->
                    <hr>
                    <p class="product-carousel-price"><small>Giá: <i> ${route.price} 000 VNĐ</i></small></p> 
<!--                    <p><small>Giờ: <fmt:formatDate type = "time" value = "${t.departuretime}" /> - 
                    <fmt:formatDate type = "time" value = "${t.arrivaltime}" /> </small></p>-->
                    <a href="<c:url value="/trip/${route.id}"/>"  id="priceInfo" class="btn btn-dark action">Xem chi tiết</a>
                </div>
            </div>
        </div>
    </c:forEach>
</div>