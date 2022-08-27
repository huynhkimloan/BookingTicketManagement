<%-- 
    Document   : register
    Created on : Aug 10, 2022, 7:38:45 PM
    Author     : dieuh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>--%>
<div class="container register">
    <h1 class="text-center text-danger">ĐĂNG KÝ</h1><!-- comment -->

    <c:if test="${errMsg != null}">
        <div class="alert alert-danger">${errMsg}</div> 
    </c:if>

    <c:url value="/register" var="action" />
    <form:form method="post" action="${action}" enctype="multipart/form-data" modelAttribute="user" >
        
        <div class="form-group">
            <label for="name">Name</label>
            <form:input type="text" path="name" id="name" class="form-control" />
            <form:errors path="name"  cssClass="text-danger" element="div"/>
        </div>

        <div class="form-group">
            <label for="username">Username</label>
            <form:input type="text" path="username" id="username" class="form-control" />
            <form:errors path="username"  cssClass="text-danger" element="div"/>
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <form:input type="password" id="password" path ="password" class="form-control" />
            <form:errors path="password"  cssClass="text-danger" element="div"/>
        </div>

        <div class="form-group">
            <label for="confirm-password">Confirm Password</label>
            <form:input type="password" id="confirm-password" path ="confirmPassword" class="form-control" />
            
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <form:input type="email" id="email" path ="email" class="form-control" />
            <form:errors path="email" cssClass="text-danger" element="div"/>
        </div>

        <div class="form-group">
            <label for="phone">Phone</label>
            <form:input type="number" id="phone" path ="phone" class="form-control" />
            <form:errors path="phone"  cssClass="text-danger" element="div"/>
        </div>

        <div class="form-group">
            <label for="avatar">Avatar</label>
            <form:input type="file" id="avatar" path ="avt" class="form-control" />
            <form:errors path="avatar"  cssClass="text-danger" element="div"/>
        </div>

        <div class="form-group">
            <input type="submit" value="Đăng ký" class="btn btn-danger" />
        </div>
    </form:form>
</div>
