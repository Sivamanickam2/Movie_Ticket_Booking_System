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
<%ResultSet rs=(ResultSet)request.getAttribute("movie");
rs.next();
%>
<h1>Enter the Needed Update</h1>
<form action="saveUpdateMovie" method="post">

<input type="number" value="<%=rs.getInt(1)%>" name="movieId" readonly="readonly">
<br>
<input type="text" value="<%=rs.getString(2)%>" name="movieTitle">
<br>
<input type="text" value="<%=rs.getString(3)%>" name="movieGenre">
<br>
<input type="text" value="<%=rs.getString(4)%>" name="movieDirector">
<br>
<input type="number" value="<%=rs.getInt(5)%>" name="movieRating">
<input type="submit" value="Update">

</form>
</body>
</html>