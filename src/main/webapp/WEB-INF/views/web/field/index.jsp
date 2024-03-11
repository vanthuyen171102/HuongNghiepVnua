<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>Các nghành đào tạo</title>

<div class="site-content container">
    <h2 class="section-heading">Các nghành đào tạo</h2>

    <div class="field-grid">
        <c:if test="${not empty fieldList}">
        <c:forEach var="field" items="${fieldList}" varStatus="loop">
        <a href="/nghanh-hoc/${field.getId()}" class="field-item">
            ${field.getName()}
        </a>
        </c:forEach>
        </c:if>

        
    </div>

</div>