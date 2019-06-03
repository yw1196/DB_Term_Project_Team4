package user;

public class Screen {
	private String ID;
	private String Seat_Col;
	private String Seat_Row;
	private String Seat_TotalNum;
	private String Seat_BookedNum;
	private String Movie_Id;
	private String Cinema_Name;
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getSeat_Col() {
		return Seat_Col;
	}
	public void setSeat_Col(String seat_Col) {
		Seat_Col = seat_Col;
	}
	public String getSeat_Row() {
		return Seat_Row;
	}
	public void setSeat_Row(String seat_Row) {
		Seat_Row = seat_Row;
	}
	public String getSeat_TotalNum() {
		return Seat_TotalNum;
	}
	public void setSeat_TotalNum(String seat_TotalNum) {
		Seat_TotalNum = seat_TotalNum;
	}
	public String getSeat_BookedNum() {
		return Seat_BookedNum;
	}
	public void setSeat_BookedNum(String seat_BookedNum) {
		Seat_BookedNum = seat_BookedNum;
	}
	public String getMovie_Id() {
		return Movie_Id;
	}
	public void setMovie_Id(String movie_Id) {
		Movie_Id = movie_Id;
	}
	public String getCinema_Name() {
		return Cinema_Name;
	}
	public void setCinema_Name(String cinema_Name) {
		Cinema_Name = cinema_Name;
	}
}
