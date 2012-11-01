package controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




import businessmodel.ToDoMethods;
import businessmodel.authenticate;
import businessmodel.userbean;
import businessmodel.ImplementMethods;
import dataconnection.JDBC;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/FormServlet")
public class FormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String text ;
		text = request.getParameter("text");
		
		authenticate field = new authenticate();
		boolean result = field.isBlank(text);
		if(result){
			RequestDispatcher dispatcher = request.getRequestDispatcher("form.jsp");
		    dispatcher.forward(request, response);
		}
		 
		 else { 
			userbean newtext = new userbean();
			newtext.setText(text);
				
			JDBC myjdbc = new JDBC();
			Connection connection = myjdbc.connect();
				
				
			ToDoMethods one = new ImplementMethods(connection);
			one.inserttext(newtext);
				
			RequestDispatcher dispatcher = request.getRequestDispatcher("FormResponse.jsp");
			dispatcher.forward(request, response);
			     
				
		        }
				
				
	
		 
		

	   
	
	}

}
