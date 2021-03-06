package com.serviddio.gis.controller;

import java.io.IOException;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.serviddio.gis.model.DAOUser;
import com.serviddio.gis.model.UserLog;
import com.serviddio.gis.model.UserOnline;
import com.serviddio.gis.tools.Crittog;

/**
 * Servlet implementation class ServletLogin
 */
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	public ServletLogin() {
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
		request.getRequestDispatcher("/WEB-INF/signin.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getSession(false).getAttribute("user") != null) {
			response.sendRedirect("./Success");
		} else {
			System.out.println("utente non trovato, cerco nel DB");

			if (!DAOUser.getIstance().checkArchived(request.getParameter("email"))) {
				
				
				
				Boolean checked = DAOUser.getIstance().check(request.getParameter("email"),
						Crittog.getIstance().encrypt(request.getParameter("password")));
				

				if (checked) {
					UserLog ut = new UserLog(request.getParameter("email"), request.getParameter("password"));
					ut.setName(DAOUser.getIstance().getName_last_user());
					ut.setRole(DAOUser.getIstance().getRole());
					HttpSession session = request.getSession();
					session.setAttribute("user", ut);
					session.setMaxInactiveInterval(30 * 60);
					UserOnline us = new UserOnline(session.getId(), ut.getName(), ut.getEmail(), ut.getRole());
					SessionCounter contatoreSessione = (SessionCounter) session.getAttribute(SessionCounter.COUNTER);
					contatoreSessione.updateSession(session.getId(), us);

					
					response.sendRedirect("./Success");

				} else {

					request.getRequestDispatcher("/WEB-INF/signinError.jsp").forward(request, response);

				}

			}
			else
			{
				System.out.println("tentativo di accesso da parte dell'utente: "+request.getParameter("email")+" locked");
				response.sendRedirect("./Login");
			}

		}

	}

}