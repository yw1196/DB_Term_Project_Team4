package user;

public class Calculator {
	int point;
	
	
	public void setPrice(String str) {
		if(str==null) {str="0";}
		point = Integer.parseInt(str);
		
	}
	public int getPrice() {
		return point;
	}

}

