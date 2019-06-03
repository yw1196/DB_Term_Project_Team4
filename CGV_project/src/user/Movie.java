package user;

public class Movie {
	private String ID;
	private String Title;
	private String Director;
	private String Actor;
	private String Plot;
	private String Rating;
	public String getRating() {
		return Rating;
	}
	public void setRating(String rating) {
		Rating = rating;
	}
	private String StartDate;
	private String Running_Time;
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getDirector() {
		return Director;
	}
	public void setDirector(String director) {
		Director = director;
	}
	public String getActor() {
		return Actor;
	}
	public void setActor(String actor) {
		Actor = actor;
	}
	public String getPlot() {
		return Plot;
	}
	public void setPlot(String plot) {
		Plot = plot;
	}
	public String getStartDate() {
		return StartDate;
	}
	public void setStartDate(String startDate) {
		StartDate = startDate;
	}
	public String getRunning_Time() {
		return Running_Time;
	}
	public void setRunning_Time(String running_Time) {
		Running_Time = running_Time;
	}

}
