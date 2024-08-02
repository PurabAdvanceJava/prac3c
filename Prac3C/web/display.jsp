<%-- 
    Document   : display
    Created on : Jul 29, 2024, 7:54:37 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*,java.sql.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Display Page</title>
        <script>
            function confirmGo (m,u){
                if(confirm(m)){
                    window.location = u;
                }
            }
        </script>
    </head>
    <body>
            <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/test" user="root" password="root"/>
            <sql:query dataSource="${dbsource}" var="result">
                    SELECT * FROM product_details
            </sql:query>
                
            <table border="2">
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Quantity</th>
                    <th colspan="2">Action</th>
                </tr>
                <c:forEach var = "row" items = "${result.rows}">
                    <tr>
                    <td> <c:out value = "${row.product_id}"/></td>
                    <td> <c:out value = "${row.product_name}"/></td>
                    <td> <c:out value = "${row.quantity}"/></td>
                    <td> <a href="update.jsp?pid=<c:out value = "${row.product_id}"/>">update</a> </td>
                    <td><a href="javascript:confirmGo('Are you sure you want to delete this record?', 'deletedb.jsp?pid=${row.product_id}')">delete</a></td>
                  
                    </tr>
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
            </table>
    </body>
</html>
