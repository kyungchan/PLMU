package com.kkc.plmu;

public class Article implements java.io.Serializable{
	private static final long serialVersionUID = -2811168399859112015L;
	private int id;
	private String title;
	private String context;
	private String author;
	private String timestamp;
	private String pw;
	private int likecount;
	private int dislike;
	private int musicid;
	
	public Article() {
		
	}

	public Article(int id, String title, String context, String author, String timestamp, String pw, int likecount, int dislike, int musicid) {
		super();
		this.id = id;
		this.title = title;
		this.context = context;
		this.author = author;
		this.timestamp = timestamp;
		this.pw = pw;
		this.likecount = likecount;
		this.dislike = dislike;
		this.musicid = musicid;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public int getLikecount() {
		return likecount;
	}

	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}

	public int getDislike() {
		return dislike;
	}

	public void setDislike(int dislike) {
		this.dislike = dislike;
	}

	public int getMusicid() {
		return musicid;
	}

	public void setMusicid(int musicid) {
		this.musicid = musicid;
	}

	public String getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}
	
	
}
