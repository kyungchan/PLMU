package com.kkc.plmu.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kkc.plmu.Article;
import com.kkc.plmu.DAO;
import com.kkc.plmu.PageResult;

/**
 * Servlet implementation class PlmuServlet
 */
@WebServlet("/plmu")
public class PlmuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlmuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	private int getIntFromParameter(String str, int defaultValue) {
		int id;
		
		try {
			id = Integer.parseInt(str);
		} catch (Exception e) {
			id = defaultValue;
		}
		return id;
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pg = request.getParameter("pg");
		String actionUrl = "";
		request.setCharacterEncoding("utf-8");
		try {
			if (pg == null || pg.equals("index")) {
				actionUrl = "index.jsp";
				request.setAttribute("current", "index");
			} else if (pg.equals("play")) {
				String inst = request.getParameter("inst");
				if(inst == null || inst.equals("piano")){
					request.setAttribute("inst", "piano");
				} else {
					request.setAttribute("inst", "piano");
				}
				actionUrl = "play.jsp";
				request.setAttribute("current", "play");
			} else if(pg.equals("board")){
				int page = getIntFromParameter(request.getParameter("page"), 1);
				PageResult<Article> articles = DAO.getPage(page, 10);
				request.setAttribute("articles", articles);
				request.setAttribute("page", page);
				request.setAttribute("current", "board");
				actionUrl = "board.jsp";
			} else if (pg.equals("show")) {
				Article article = DAO.findById(Integer.parseInt(request.getParameter("id")));
				request.setAttribute("article", article);
				request.setAttribute("current", "board");
				actionUrl = "show.jsp";
			}
		}catch (Exception e) {
			actionUrl = "error.jsp";
			request.setAttribute("errormsg", e.toString());
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(actionUrl);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
