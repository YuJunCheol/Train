package test;

public class Calculator {

	public int add(int num1, int num2) {
		int num3 = num1+num2;
		return num3;
	}
	
	public String gugu() {
		String txt = "";
		for (int i=2; i<=9; i++) {
			for (int j=1; j<=9; j++) {
				txt += i+"*"+j+"="+(i*j)+"<br>";
			}			
		}
		return txt;
	}
}
