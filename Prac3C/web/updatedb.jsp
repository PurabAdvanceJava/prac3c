<%-- 
    Document   : updatedb
    Created on : Jul 29, 2024, 7:54:05 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <c:if test="${empty param.product_id or empty param.product_name or empty param.quantity}">
            <c:redirect url="update.jsp">
                <c:param name="errMsg" value="Please Enter Product Details"/>
            </c:redirect>
        </c:if>
         <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/test" user="root" password="root"/>
        <sql:update dataSource="${dbsource}" var="result">
            UPDATE product_details SET product_name = ?, quantity = ? WHERE product_id = ?;
            <sql:param value="${param.product_name}"/>
            <sql:param value="${param.quantity}"/>
            <sql:param value="${param.product_id}"/>
        </sql:update>
        
        <c:if test="${result >= 1}">
            <font size="5" color="green">Data Updated</font>
            <c:redirect url="update.jsp">
                <c:param name="susMsg" value="Data Inserted"/>
            </c:redirect>
        </c:if>
    </body>
</html>
