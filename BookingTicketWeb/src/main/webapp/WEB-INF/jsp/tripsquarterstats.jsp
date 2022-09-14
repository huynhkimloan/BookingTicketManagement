<%--
    Document   : tripsquarterstats
    Created on : Aug 20, 2022, 12:59:53 PM
    Author     : dieuh
--%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h2 class="text-center text-danger">THỐNG KÊ THEO QUÝ </h2>
<div class="row">
    <form action="">
        <div class="form-group">
            <label>Từ thời điểm</label>
            <input type="date" name="fromDate" class="form-control mb-3" />
        </div>
        <div class="form-group">
            <label>Đến thời điểm</label>
            <input type="date" name="toDate" class="form-control" />
        </div>
        <input type="submit" value="Thống kê" class="btn btn-success mt-3"/>
    </form>
    <h4 class="text-center text-secondary"> Bảng số liệu thống kê </h4>
    <table class="table">
        <tr>
            <th>Thời gian </th>
            <th>Doanh thu </th>
        </tr>
        <c:forEach items="${tripQuarterStats}" var="m">
            <tr>
                <td>${m[0]}/${m[1]}</td>
                <td>${m[2]} VNĐ</td>
            </tr>
        </c:forEach>
    </table>
    <h4 class="text-center text-secondary"> Thống kê theo dạng biểu đồ </h4>
    <div>
        <canvas id="myTripsQuarterTurnoverTatisticsChart"></canvas>
    </div>
    <script>
        let tripQuarterTurnoverLabels = [], tripQuarterTurnoverInfo = []
        <c:forEach items="${tripQuarterStats}" var="m">
            tripQuarterTurnoverLabels.push('${m[0]}/${m[1]}')
            tripQuarterTurnoverInfo.push(${m[2]})
        </c:forEach>
    </script>
</div>
<script>
    window.onload = function () {
        turnoverTatisticsByTripQuarterChart("myTripsQuarterTurnoverTatisticsChart", tripQuarterTurnoverLabels, tripQuarterTurnoverInfo);
    }
</script>
