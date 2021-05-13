package com;

import model.user;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class userAPI
 */
@WebServlet("/userAPI")
public class userAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	user UserObj = new user();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public userAPI() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//UserObj.insertUser(usercode, username, password, email, address, dob, phone, type)
		String output = UserObj.insertUser(request.getParameter("txtUserCode"),
				request.getParameter("txtUsername"),
				request.getParameter("txtPassword"),
				request.getParameter("txtEmail"), 
				request.getParameter("txtAddress"),
				request.getParameter("txtDob"),
				request.getParameter("txtPhone"), 
				request.getParameter("SelectType"));
		response.getWriter().write(output);
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Map paras = getParasMap(request);
		
		//UserObj.updateUser(type, userID, userName, password, email, address, dob, phone, desc)
		String output = UserObj.updateUser(paras.get("SelectType").toString(),
				paras.get("hidUserIDSave").toString(),
				paras.get("txtUsername").toString(),
				paras.get("txtPassword").toString(),
				paras.get("txtEmail").toString(),
				paras.get("txtAddress").toString(),
				paras.get("txtDob").toString(),
				paras.get("txtPhone").toString());
				
		response.getWriter().write(output);
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Map paras = getParasMap(request);
		//UserObj.deleteUser(type, userID)
		String output = UserObj.deleteUser(paras.get("SelectType").toString()
				,paras.get("userID").toString());
		response.getWriter().write(output);
	}

	// Convert request parameters to a Map
	private static Map getParasMap(HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
			String queryString = scanner.hasNext() ? scanner.useDelimiter("\\A").next() : "";
			scanner.close();
			String[] params = queryString.split("&");
			for (String param : params) {

				String[] p = param.split("=");
				map.put(p[0], p[1]);
			}
		} catch (Exception e) {
		}
		return map;
	}
}
