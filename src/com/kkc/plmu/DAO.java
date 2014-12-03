package com.kkc.plmu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DAO {
	public static DataSource getDataSource() throws NamingException {
		Context initCtx = null;
		Context envCtx = null;

		initCtx = new InitialContext();
		envCtx = (Context) initCtx.lookup("java:comp/env");
		return (DataSource) envCtx.lookup("jdbc/WebDB");
	}

	public static Article findArticleById(int id) throws SQLException, NamingException {
		Article article = null;

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		DataSource ds = getDataSource();
		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement("SELECT * FROM articles WHERE id = ?");
			stmt.setInt(1, id);
			rs = stmt.executeQuery();

			if (rs.next()) {
				article = new Article(rs.getInt("id"), rs.getString("title"),
						rs.getString("context"), rs.getString("author"),
						rs.getString("time_stamp"), rs.getInt("likecount"), 
						rs.getInt("dislike"), rs.getInt("musicid"));
			}
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (stmt != null)
				try {
					stmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}

		return article;
	}

	public static int Articlecreate(Article article) throws SQLException,
			NamingException {
		int result = 0;
		Connection conn = null;
		PreparedStatement stmt = null;
		PreparedStatement stmt2 = null;
		ResultSet rs = null;

		DataSource ds = getDataSource();

		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement("INSERT INTO articles(title, context, author, musicid) "
							+ "VALUES(?, ?, ?, ?)");
			stmt.setString(1, article.getTitle());
			stmt.setString(2, article.getContext());
			stmt.setString(3, article.getAuthor());
			stmt.setInt(4, article.getMusicid());
			stmt.executeUpdate();
			
			stmt2 = conn.prepareStatement("SELECT * FROM articles WHERE author=? AND title=? ORDER BY id DESC LIMIT 1");
			stmt2.setString(1, article.getAuthor());
			stmt2.setString(2, article.getTitle());
			rs = stmt2.executeQuery();
			if (rs.next()) {
				result = rs.getInt("id");
			}
			
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (stmt != null)
				try {
					stmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}

		return result;
	}
	
	public static boolean Articleupdate(Article article) throws SQLException,
			NamingException {
		int result;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		DataSource ds = getDataSource();

		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement("UPDATE articles SET title=?, context=?, author=? WHERE id=?");
			stmt.setString(1, article.getTitle());
			stmt.setString(2, article.getContext());
			stmt.setString(3, article.getAuthor());
			stmt.setInt(4, article.getId());
			result = stmt.executeUpdate();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (stmt != null)
				try {
					stmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}

		return (result == 1);
	}

	public static boolean Articlelike(Article article) throws SQLException,
			NamingException {
		int result;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		DataSource ds = getDataSource();

		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement("UPDATE articles SET likecount=? WHERE id=?");
			stmt.setInt(1, article.getLikecount() + 1);
			stmt.setInt(2, article.getId());
			result = stmt.executeUpdate();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (stmt != null)
				try {
					stmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}

		return (result == 1);
	}
	

	public static boolean Articledislike(Article article) throws SQLException,
			NamingException {
		int result;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		DataSource ds = getDataSource();

		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement("UPDATE articles SET dislike=? WHERE id=?");
			stmt.setInt(1, article.getDislike() + 1);
			stmt.setInt(2, article.getId());
			result = stmt.executeUpdate();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (stmt != null)
				try {
					stmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}

		return (result == 1);
	}
	
	
	public static boolean Articleremove(int id) throws NamingException, SQLException {
		int result;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		DataSource ds = getDataSource();

		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement("DELETE FROM articles WHERE id=?");
			stmt.setInt(1, id);
			result = stmt.executeUpdate();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (stmt != null)
				try {
					stmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}

		return (result == 1);
	}
	
	public static int getRecentMusicId() throws SQLException, NamingException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int id = 0;
		DataSource ds = getDataSource();
		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement("SELECT * FROM musics ORDER BY id DESC LIMIT 1");
			rs = stmt.executeQuery();

			if (rs.next()) {
				id = rs.getInt("id");
			}
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (stmt != null)
				try {
					stmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}
		return id;
	}
	
	public static Music findMusicById(int id) throws SQLException, NamingException {
		Music music = null;

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		DataSource ds = getDataSource();
		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement("SELECT * FROM musics WHERE id = ?");
			stmt.setInt(1, id);
			rs = stmt.executeQuery();

			if (rs.next()) {
				music = new Music(rs.getInt("id"), rs.getString("instrument"),
						rs.getString("musiccode"));
			}
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (stmt != null)
				try {
					stmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}

		return music;
	}	
	
	public static boolean Musiccreate(Music music) throws SQLException,
			NamingException {
		int result;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		DataSource ds = getDataSource();

		try {
			conn = ds.getConnection();
			stmt = conn
					.prepareStatement("INSERT INTO musics(instrument, musiccode) "
							+ "VALUES(?, ?)");
			stmt.setString(1, music.getInstrument());
			stmt.setString(2, music.getMusiccode());
			result = stmt.executeUpdate();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (stmt != null)
				try {
					stmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}

		return (result == 1);
	}
	
	public static boolean Musicremove(int id) throws NamingException, SQLException {
		int result;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		DataSource ds = getDataSource();

		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement("DELETE FROM musics WHERE id=");
			stmt.setInt(1, id);
			result = stmt.executeUpdate();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (stmt != null)
				try {
					stmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}

		return (result == 1);
	}
	public static PageResult<Article> getPage(int page, int numItemsInPage)
			throws SQLException, NamingException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		if (page <= 0) {
			page = 1;
		}

		DataSource ds = getDataSource();
		PageResult<Article> result = new PageResult<Article>(numItemsInPage,
				page);

		int startPos = (page - 1) * numItemsInPage;

		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();

			// article 테이블: article 수 페이지수 개산
			rs = stmt.executeQuery("SELECT COUNT(*) FROM articles");
			rs.next();

			result.setNumItems(rs.getInt(1));

			rs.close();
			rs = null;
			stmt.close();
			stmt = null;

			// articles 테이블 SELECT
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM articles ORDER BY id DESC LIMIT "
					+ startPos + ", " + numItemsInPage);
			while (rs.next()) {
				result.getList().add(
						new Article(rs.getInt("id"), rs.getString("title"), rs
								.getString("context"), rs.getString("author"),
								rs.getString("time_stamp"),rs.getInt("likecount"),
								rs.getInt("dislike"), rs.getInt("musicid")));
			}
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (stmt != null)
				try {
					stmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}

		return result;
	}
	
}


