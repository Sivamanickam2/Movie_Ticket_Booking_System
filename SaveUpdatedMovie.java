package com.jsp.servlet.moviedb;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/saveUpdateMovie")
public class SaveUpdatedMovie extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int movieId=Integer.parseInt(req.getParameter("movieId"));
		String movieTitle=req.getParameter("movieTitle");
		String movieGenre=req.getParameter("movieGenre");
		String movieDirector=req.getParameter("movieDirector");
		int movieRating=Integer.parseInt(req.getParameter("movieRating"));
		
		Connection conn=null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/servlet_movidb?user=root&password=root");
			PreparedStatement pst=conn.prepareStatement("Update movie set movieTitle=?,movieGenre=?,movieDirector=?,movieRating=? where movieId=?");
			 
			
			pst.setString(1, movieTitle);
			pst.setString(2, movieGenre);
			
			pst.setString(3, movieDirector);
			pst.setInt(4, movieRating);
			pst.setInt(5, movieId);
			
			pst.executeUpdate();
			
			resp.sendRedirect("DisplayMovie");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			if(conn!=null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		
		
		
		
		
		
		
		
	}

}
