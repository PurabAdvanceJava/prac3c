<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*,java.sql.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP InsertDB Page</title>
    </head>
    <body>
        <c:if test="${empty param.product_id or empty param.product_name or empty param.quantity}">
            <c:redirect url="insert.jsp">
                <c:param name="errMsg" value="Please Enter Product Details"/>
            </c:redirect>
        </c:if>
        
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/test" user="root" password="root"/>
        <sql:update dataSource="${dbsource}" var="result">
            INSERT INTO product_details (product_id, product_name, quantity) VALUES (?, ?, ?);
            <sql:param value="${param.product_id}"/>
            <sql:param value="${param.product_name}"/>
            <sql:param value="${param.quantity}"/>
        </sql:update>
        
        <c:if test="${result >= 1}">
            <font size="5" color="green">Data Inserted</font>
            <c:redirect url="insert.jsp">
                <c:param name="susMsg" value="Data Inserted"/>
            </c:redirect>
        </c:if>
    </body>
</html>
