<%-- 
    Document   : header
    Created on : Aug 3, 2022, 1:57:21 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-sm">
    <div class="container-fluid">
        <a class="navbar-brand" href="<c:url value="/" />"><i class="fas fa-bus-alt"style="margin-right: 10px"></i>BookingTicket LH</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mynavbar">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <c:url value="/" var="action" />
                    <a class="nav-link" href="${action}"><i class="fa fa-home"></i> Trang chủ</a>
                </li>
                <c:forEach items="${categories}" var="c">
                    <c:url value="/" var="cUrl">
                        <c:param name="cateId" value="${c.id}" />
                    </c:url>
                    <li class="nav-item">
                        <a class="nav-link" href="${cUrl}">${c.categoryname}</a>
                    </li>
                </c:forEach>
                <li class="nav-item">
                    <a class="nav-link" href="#">Liên hệ</a>
                </li> 
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/reservation"/>">Đặt vé</a>
                </li>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <li class="nav-item">
                        <a class="nav-link text-secondary" href="<c:url value="/admin" />">Trang quản trị</a>
                    </li>
                </sec:authorize>
            </ul>
            <ul class="navbar-nav me-auto"> 
                    <!--    Khi đăng nhập thất bại hiện ra link login và cái tên-->
                    <c:if test="${pageContext.request.userPrincipal.name == null}">
                        <li class="nav-item">
                            <a class="nav-link text-success" href="<c:url value="/login" />">
                                <i class="fa fa-user" aria-hidden="true"></i>  Đăng nhập
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-danger" href="<c:url value="/register" />">
                                <i class="fa-solid fa-user-plus" aria-hidden="true"></i> Đăng ký
                            </a>
                        </li>
                    </c:if>
                    <!-- Ngược lại thi hiện ra logout và tên username -->
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <li class="nav-item">
                            <a href="<c:url value="/"/>" class="nav-link text-info">
                                <c:if test="${currentUser.avatar != null}">
                                    <img style="width:30px;" src="${currentUser.avatar}" class="rounded-circle" />
                                </c:if>
                                <c:if test="${currentUser.avatar == null}">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                </c:if> 
                                ${currentUser.name}
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-danger" href="<c:url value="/logout" />">
                                <i class="fa-solid fa-user-minus" aria-hidden="true"></i>  Đăng xuất
                            </a>
                        </li>
                    </c:if>
            </ul>
            <!--
                        <div class="dropdown pb-2">
                            <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                                <img src="https://github.com/mdo.png" width="30" height="30" class="rounded-circle">
                                <span class="d-none d-sm-inline mx-1">Người dùng</span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-dark text-small shadow">
                                <li><a class="dropdown-item" href="#">Trang cá nhân</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Đăng xuất</a></li>
                            </ul>
                        </div>-->

        </div>
    </div>
</nav>



