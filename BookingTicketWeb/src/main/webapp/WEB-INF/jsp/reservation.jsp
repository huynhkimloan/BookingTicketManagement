<%-- 
    Document   : conservation
    Created on : Aug 24, 2022, 4:14:38 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="display: flex">
    <div class="col-sm-6">
        <div class="row">
            <c:forEach items="${listSeatA}" var="seat" begin="0" end="0">
                <c:choose>
                    <c:when test="${seat.active eq 1}">
                        <div class="col-sm-8 mb-2"><button type="button" disabled name="seats" class="btn btn-secondary">${seat.name}</button></div>
                        </c:when>
                        <c:otherwise>
                        <div class="col-sm-8 mb-2 seats"><button type="button" id="seat-${seat.id}" onclick="addToPay(${seat.id}, '${seat.name}', ${price}, ${pasCar.id}, ${tripId})" class="btn btn-warning">${seat.name}</button></div>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:forEach items="${listSeatA}" var="seat" begin="1" end="1">
                    <c:choose>
                        <c:when test="${seat.active eq 1}">
                        <div class="col-sm-1 mb-2"><button type="button" disabled name="seats" class="btn btn-secondary">${seat.name}</button></div>
                        </c:when>
                        <c:otherwise>
                        <div class="col-sm-1 mb-2 seats"><button type="button" id="seat-${seat.id}" onclick="addToPay(${seat.id}, '${seat.name}', ${price}, ${pasCar.id}, ${tripId})" class="btn btn-warning">${seat.name}</button></div>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
        </div>
        <div class="row">
            <c:forEach items="${listSeatA}" var="seat" begin="2" end="4">
                <c:choose>
                    <c:when test="${seat.active eq 1}">
                        <div class="col mb-2"><button type="button" disabled name="seats" class="btn btn-secondary">${seat.name}</button></div>
                        </c:when>
                        <c:otherwise>
                        <div class="col mb-2"><button type="button" id="seat-${seat.id}" onclick="addToPay(${seat.id}, '${seat.name}', ${price}, ${pasCar.id}, ${tripId})" class="btn btn-warning">${seat.name}</button></div>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
        </div>
        <div class="row">
            <c:forEach items="${listSeatA}" var="seat" begin="5" end="7">
                <c:choose>
                    <c:when test="${seat.active eq 1}">
                        <div class="col mb-2"><button type="button" name="seats" disabled class="btn btn-secondary">${seat.name}</button></div>
                        </c:when>
                        <c:otherwise>
                        <div class="col mb-2"><button type="button" id="seat-${seat.id}" onclick="addToPay(${seat.id}, '${seat.name}', ${price}, ${pasCar.id}, ${tripId})" class="btn btn-warning">${seat.name}</button></div>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
        </div>
        <div class="row">
            <c:forEach items="${listSeatA}" var="seat" begin="8" end="10">
                <c:choose>
                    <c:when test="${seat.active eq 1}">
                        <div class="col mb-2"><button type="button" name="seats" disabled class="btn btn-secondary">${seat.name}</button></div>
                        </c:when>
                        <c:otherwise>
                        <div class="col mb-2"><button type="button" id="seat-${seat.id}" onclick="addToPay(${seat.id}, '${seat.name}', ${price}, ${pasCar.id}, ${tripId})" class="btn btn-warning">${seat.name}</button></div>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
        </div>
        <div class="row">
            <c:forEach items="${listSeatA}" var="seat" begin="11" end="13">
                <c:choose>
                    <c:when test="${seat.active eq 1}">
                        <div class="col mb-2"><button type="button" name="seats" disabled class="btn btn-secondary">${seat.name}</button></div>
                        </c:when>
                        <c:otherwise>
                        <div class="col mb-2"><button type="button" id="seat-${seat.id}" onclick="addToPay(${seat.id}, '${seat.name}', ${price}, ${pasCar.id}, ${tripId})" class="btn btn-warning">${seat.name}</button></div>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
        </div>
        <div class="row">
            <c:forEach items="${listSeatA}" var="seat" begin="14">
                <c:choose>
                    <c:when test="${seat.active eq 1}">
                        <div class="col mb-2"><button type="button" name="seats" disabled class="btn btn-secondary">${seat.name}</button></div>
                        </c:when>
                        <c:otherwise>
                        <div class="col mb-2"><button type="button" id="seat-${seat.id}" onclick="addToPay(${seat.id}, '${seat.name}', ${price}, ${pasCar.id}, ${tripId})" class="btn btn-warning">${seat.name}</button></div>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
        </div>
    </div>

    <div class="col-sm-6">
        <div class="row">
            <c:forEach items="${listSeatB}" var="seat" begin="0" end="0">
                <c:choose>
                    <c:when test="${seat.active eq 1}">
                        <div class="col-sm-8 mb-2"><button type="button" name="seats" disabled class="btn btn-secondary">${seat.name}</button></div>
                        </c:when>
                        <c:otherwise>
                        <div class="col-sm-8 mb-2"><button type="button" id="seat-${seat.id}" onclick="addToPay(${seat.id}, '${seat.name}', ${price}, ${pasCar.id}, ${tripId})" class="btn btn-warning">${seat.name}</button></div>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:forEach items="${listSeatB}" var="seat" begin="1" end="1">
                    <c:choose>
                        <c:when test="${seat.active eq 1}">
                        <div class="col-sm-1 mb-2"><button type="button" name="seats" disabled class="btn btn-secondary">${seat.name}</button></div>
                        </c:when>
                        <c:otherwise>
                        <div class="col-sm-1 mb-2 "><button type="button" id="seat-${seat.id}" onclick="addToPay(${seat.id}, '${seat.name}', ${price}, ${pasCar.id}, ${tripId})" class="btn btn-warning">${seat.name}</button></div>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
        </div>
        <div class="row">
            <c:forEach items="${listSeatB}" var="seat" begin="2" end="4">
                <c:choose>
                    <c:when test="${seat.active eq 1}">
                        <div class="col mb-2"><button type="button" name="seats" disabled class="btn btn-secondary">${seat.name}</button></div>
                        </c:when>
                        <c:otherwise>
                        <div class="col mb-2"><button type="button" id="seat-${seat.id}" onclick="addToPay(${seat.id}, '${seat.name}', ${price}, ${pasCar.id}, ${tripId})" class="btn btn-warning">${seat.name}</button></div>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
        </div>
        <div class="row">
            <c:forEach items="${listSeatB}" var="seat" begin="5" end="7">
                <c:choose>
                    <c:when test="${seat.active eq 1}">
                        <div class="col mb-2"><button type="button" name="seats" disabled class="btn btn-secondary">${seat.name}</button></div>
                        </c:when>
                        <c:otherwise>
                        <div class="col mb-2"><button type="button" id="seat-${seat.id}" onclick="addToPay(${seat.id}, '${seat.name}', ${price}, ${pasCar.id}, ${tripId})" class="btn btn-warning">${seat.name}</button></div>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
        </div>
        <div class="row">
            <c:forEach items="${listSeatB}" var="seat" begin="8" end="10">
                <c:choose>
                    <c:when test="${seat.active eq 1}">
                        <div class="col mb-2"><button type="button" name="seats" disabled class="btn btn-secondary">${seat.name}</button></div>
                        </c:when>
                        <c:otherwise>
                        <div class="col mb-2"><button type="button" id="seat-${seat.id}" onclick="addToPay(${seat.id}, '${seat.name}', ${price}, ${pasCar.id}, ${tripId})" class="btn btn-warning">${seat.name}</button></div>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
        </div>
        <div class="row">
            <c:forEach items="${listSeatB}" var="seat" begin="11" end="13">
                <c:choose>
                    <c:when test="${seat.active eq 1}">
                        <div class="col mb-2"><button type="button" name="seats" disabled class="btn btn-secondary">${seat.name}</button></div>
                        </c:when>
                        <c:otherwise>
                        <div class="col mb-2"><button type="button" id="seat-${seat.id}" onclick="addToPay(${seat.id}, '${seat.name}', ${price}, ${pasCar.id}, ${tripId})" class="btn btn-warning">${seat.name}</button></div>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
        </div>
        <div class="row">
            <c:forEach items="${listSeatB}" var="seat" begin="14">
                <c:choose>
                    <c:when test="${seat.active eq 1}">
                        <div class="col mb-2"><button type="button" name="seats" disabled class="btn btn-secondary">${seat.name}</button></div>
                        </c:when>
                        <c:otherwise>
                        <div class="col mb-2"><button type="button" id="seat-${seat.id}" onclick="addToPay(${seat.id}, '${seat.name}', ${price}, ${pasCar.id}, ${tripId})" name="seats" class="btn btn-warning">${seat.name}</button></div>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
        </div>
    </div>
</div>

<strong class="text-success"><i>Số lượng vé: </i><span id="count">${counter}</span></strong>

<div class="mailbox-border" style="float: right">
    <a href="<c:url value="/bill" />" class="btn btn-secondary" type="button" data-toggle="tooltip" 
       data-placement="top" title="Thanh toán">Chi tiết</a> 
</div>
<br>
<br>
