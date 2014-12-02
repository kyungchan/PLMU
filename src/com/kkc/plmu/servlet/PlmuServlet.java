package com.kkc.plmu.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kkc.plmu.Article;
import com.kkc.plmu.DAO;
import com.kkc.plmu.Music;
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
				Article article = DAO.findArticleById(Integer.parseInt(request.getParameter("id")));
				Music music = DAO.findMusicById(article.getMusicid());
				request.setAttribute("article", article);
				request.setAttribute("music", music);
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
		// TODO Auto-generated method stubHttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String actionUrl = "";
	
		request.setCharacterEncoding("utf-8");

		List<String> errorMsgs = new ArrayList<String>();
		if(request.getParameter("_method").equals("recode")){
			request.setAttribute("musiccode", request.getParameter("musiccode"));
			request.setAttribute("inst", request.getParameter("inst"));
			request.setAttribute("method", "create");
			request.setAttribute("current", "play");
			actionUrl = "create.jsp";
			errorMsgs.add("rse");
		} else {
			
			String title = request.getParameter("title");
			String context = request.getParameter("context");
			String author = request.getParameter("author");
			
		
			if (title == null || title.trim().length() == 0) {
				errorMsgs.add("제목을 입력해주세요.");
				title = null;
			}
	
			if (context == null || context.trim().length() == 0) {
				errorMsgs.add("내용을 입력해주세요.");
				context = null;
			}
			
			if (author == null || author.trim().length() == 0) {
				errorMsgs.add("작성자를 입력해주세요.");
				author = null;
			}
			
			
			try {
				if(errorMsgs.isEmpty()){
					Article article = new Article();
					Music music = new Music();
					article.setTitle(title);
					article.setContext(context);
					article.setAuthor(author);
					music.setInstrument(request.getParameter("inst"));
					music.setMusiccode(request.getParameter("musiccode"));
					if(request.getParameter("_method").equals("create")){
						if(DAO.Musiccreate(music)){
							article.setMusicid(DAO.getRecentMusicId());
							if(DAO.Articlecreate(article)){
								request.setAttribute("errormsg", "게시글 작성 성공");
								actionUrl = "error.jsp";
							} else {
								request.setAttribute("errormsg", "게시글 작성 실패(게시글)");
								DAO.Musicremove(DAO.getRecentMusicId()); // Article이 등록실패하면 Music은 쓸모가 없어지므로
								actionUrl = "error.jsp";
							}
						} else {
							request.setAttribute("errormsg", "게시글 작성 실패(음악)");
							actionUrl = "error.jsp";
						}
					} else if(request.getParameter("_method").equals("update")){
						article.setId(Integer.parseInt(request.getParameter("id")));
						if(DAO.Articleupdate(article)){
							request.setAttribute("errormsg", "게시글 수정 성공");
							actionUrl = "error.jsp";
						} else {
							request.setAttribute("errormsg", "게시글 수정 실패");
							actionUrl = "error.jsp";
						}
					}
				} else {
					request.setAttribute("errormsg", errorMsgs);
					actionUrl = "error.jsp";
				}
			} catch (SQLException | NamingException e) {
				errorMsgs.add(e.getMessage());
				request.setAttribute("errormsg", errorMsgs);
				actionUrl = "error.jsp";
			}
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(actionUrl);
		dispatcher.forward(request, response);
	}

}
