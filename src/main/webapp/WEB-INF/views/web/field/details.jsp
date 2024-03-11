<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<title>${field.getName()}</title>

<div class="site-content container">
    <h2 class="section-heading">${field.getName()}</h2>


    <c:if test="${not empty specializedList}">

    <table class="table table-hover specialized-table">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">Tên chuyên nghành</th>
            <th scope="col">Chương trình đào tạo</th>
        </tr>
        </thead>
        <tbody>
            <c:forEach var="specialized" items="${specializedList}" varStatus="loop">
                <tr>
                    <th scope="row">${loop.index + 1}</th>
                    <td>${specialized.getName()}</td>
                    <td>
                        <c:set var="type" value="${specialized.getType()}"/>
                        <c:choose>
                            <c:when test="${type==0}">
                                <span class="text-info">Tiêu chuẩn</span>
                            </c:when>

                            <c:when test="${type==1}">
                                <span class="text-success">Tiên tiến</span>
                            </c:when>

                            <c:when test="${type==2}">
                                <span class="text-primary">Chất lượng cao</span>
                            </c:when>

                            <c:when test="${type==3}">
                                <span class="text-warning">Định hướng (POHE)</span>
                            </c:when>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    </c:if>

</div>