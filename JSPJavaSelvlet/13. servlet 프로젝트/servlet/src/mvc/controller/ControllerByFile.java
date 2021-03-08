package mvc.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;

public class ControllerByFile extends HttpServlet {

	// 커맨드 매핑데이터 저장할 필드
	private Map<String, CommandHandler> cmdMap = new HashMap<>();
	
	// 초기화 메서드
	public void init() throws ServletException {
		// 설정파일명 가져옴(초기화 파라미터)
		String configFile = getInitParameter("configFile");
		
		// Properties - 설정정보를 다룰 때 사용
		Properties prop = new Properties(); // 프로퍼티 객체 생성
		// 설정파일경로 불러옴(어플리케이션마다 실제 경로가 다를 수 있음)
		String configFilePath = getServletContext().getRealPath(configFile);
		try {
			// 파일읽어들여서 객체 생성
			FileInputStream fis = new FileInputStream(configFilePath);
			// 프로퍼티로 로드
			prop.load(fis);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		// key값들을 iterator객체로 생성
		Iterator keys = prop.keySet().iterator();
		while(keys.hasNext()) {
			String cmd = (String)keys.next(); // 키값
			// 키를 가지고 value값(서블릿 클래스명)을 가져오기
			String className = prop.getProperty(cmd);
			
			// 클래스명을 가지고 로드해서 객체를 생성
			try {
				// 클래스 로드
				Class<?> handlerClass = Class.forName(className);
				// 객체 생성
				CommandHandler instance = (CommandHandler)handlerClass.newInstance();
				// 생성한 객체를 map에 담기
				cmdMap.put(cmd, instance);
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		process(req, res);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		process(req, res);
	}
	private void process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("process");
		// 사용자의 요청 (커맨드) 확인
		String cmd = req.getParameter("cmd");
		CommandHandler handler = cmdMap.get(cmd); // 해당 cmd의 키값으로 value(클래스로 만든 객체) 가져오기
		String path = ""; // 포워딩될 jsp위치를 담을 변수
		try {
			// 로직이 처리된 후 포워딩될 jsp위치 리턴
			path = handler.process(req, res);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		// jsp 포워딩
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, res);
		
	}
}
