<%-- 
    Document   : update
    Created on : Jul 29, 2024, 7:53:54 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*,java.sql.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/test" user="root" password="root"/>
            <sql:query dataSource="${dbsource}" var="result">
                    SELECT * FROM product_details WHERE product_id = ?;
                    <sql:param value="${param.pid}"/>
            </sql:query>
            <c:forEach var = "row" items = "${result.rows}">
            <form action="updatedb.jsp" method="post">
            <table border="2">
                <tr>
                    <th colspan="2"> Update Product </th>
                </tr>
                <tr>
                    <td> Product Id</td>
                    <td><input type="text" name="product_id" value=' ${row.product_id} ' readonly></td>
                </tr>
                <tr>
                    <td> Product Name</td>
                    <td><input type="text" name="product_name" value="${row.product_name}" required>  </td>
                </tr>
                <tr>
                    <td> Quantity</td>
                    <td><input type="text" name="quantity" value="${row.quantity}" required>  </td>
                <tr>
                    <td><input type="submit" name="update" value="Update"></td>
                    <td><input type="reset" name="reset" value="Reset"></td>
                </tr>
            </table>
        </form>
            </c:forEach>
        <font color="red">
            <c:if test="${not empty param.errMsg}">
                <c:out value="${param.errMsg}"/>
                <a href="index.html">Go Back</a>
            </c:if>
        </font>
        <font color="green">
            <c:if test="${not empty param.susMsg}">
                <c:out value="${param.susMsg}"/>
                <a href="index.html">Go Back</a>
            </c:if>
        </font>
    </body>
</html>
