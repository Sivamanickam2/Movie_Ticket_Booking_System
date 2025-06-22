<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%ResultSet rs =(ResultSet) request.getAttribute("resultSet"); %>
<h1>All Movie Details</h1>
<table border="">
<tr>
<th> MovieId</th>
<th> MovieTile</th>
<th> MovieGenre</th>
<th> MovieDirector</th>
<th> MovieRating</th>
<th>Update</th>
<th>Delete</th>
</tr>

<%while(rs.next()){ %>
<tr class="record">
<td><%=rs.getInt(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getInt(5) %></td>
<td><a href="UpdateMovie?movieId=<%=rs.getInt(1)%>">Update</a></td>
<td><a href="DeleteMovie?movieId=<%=rs.getInt(1)%>">Delete</a></td>
</tr>
<%} %>








</table>
</body>
</html>