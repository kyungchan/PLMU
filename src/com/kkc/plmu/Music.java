package com.kkc.plmu;

public class Music implements java.io.Serializable{
	private static final long serialVersionUID = -2148206764203027888L;
	private int id;
	private String instrument;
	private String musiccode;
	
	public Music(){
		
	}
	
	public Music(int id, String instrument, String musiccode){
		super();
		this.id = id;
		this.instrument = instrument;
		this.musiccode = musiccode;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getInstrument() {
		return instrument;
	}

	public void setInstrument(String instrument) {
		this.instrument = instrument;
	}

	public String getMusiccode() {
		return musiccode;
	}

	public void setMusiccode(String musiccode) {
		this.musiccode = musiccode;
	}

}
