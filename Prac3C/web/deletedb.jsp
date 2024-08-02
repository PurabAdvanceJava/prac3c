<%-- 
    Document   : deletedb
    Created on : Jul 29, 2024, 7:54:25 AM
    Author     : Admin
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/test" user="root" password="root"/>
         <sql:update dataSource="${dbsource}" var="result">
            DELETE FROM product_details WHERE product_id = ?;
            <sql:param value="${param.pid}"/>
        </sql:update>
         <c:if test="${result >= 1}">
            <font size="5" color="green">Data Inserted</font>
            <c:redirect url="display.jsp">
                <c:param name="susMsg" value="Data deleted"/>
            </c:redirect>
        </c:if>
    </body>
</html>
