<%-- 
    Document   : bill
    Created on : Aug 25, 2022, 1:43:07 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${seat==null}">
    <h2 class="text-center text-secondary">Thanh toán hóa đơn</h2>
    <p class="text-danger"><i>Không có vé nào được đặt!</i></p>
    <i>Tổng số lượng vé:</i> <strong class="text-success">${counter}</strong>
</c:if>

<c:if test="${seat!=null}">
    <div class="container-fluid">
        <h2 class="text-center text-secondary">Thanh toán hóa đơn</h2>
        <br>
        <table class="table">
            <tr>
                <th>Số thứ tự</th>
                <th>Vị trí ngồi</th>
                <th>Giá vé đơn</th>
                <th></th>
            </tr>
            <c:forEach var="c" items="${seat}">
                <tr id="s-${c.id}">
                    <td>${c.id}</td>
                    <td>${c.name}</td>
                    <td>${c.price}</td>
                    <td>
                        <a href="javascrip:;" style="color: tomato" onclick="deleteSeat(${c.id})" 
                           title="Xóa"><i class="bi bi-trash"></i></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div>
            <strong class="text-success"><i>Tổng số lượng vé: </i><span id="count">${counter}</span></strong>
            <strong class="text-danger" style="float: right"><i>Tổng tiền: </i>
                <span id="amount">${seatStats.amount}</span>000 VNĐ</strong>
        </div>
        <div style="float: right"><button class="btn btn-warning" onclick="pay()">Thanh toán</button></div>
        <br>
    </div>
</c:if>