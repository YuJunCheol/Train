package jdbc;

import java.sql.DriverManager;

import javax.servlet.http.HttpServlet;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

public class DBCPInit extends HttpServlet {

	@Override
	public void init() {
		try {
			// 드라이버 로드
			//Class.forName("org.mariadb.jdbc.Driver");
			Class.forName(getInitParameter("driver"));
			
			String url = getInitParameter("url");
			String id = getInitParameter("id");
			String pwd = getInitParameter("pwd");
			
			ConnectionFactory connFactory = new DriverManagerConnectionFactory(url, id, pwd);
			PoolableConnectionFactory poolableConnFactory = new PoolableConnectionFactory(connFactory, null);
			GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
			poolConfig.setMaxTotal(50); // 최대갯수
			poolConfig.setMinIdle(5);   // 최소갯수
			
			// ConnectionPool 객체 생성
			GenericObjectPool<PoolableConnection> connPool = 
					new GenericObjectPool<>(poolableConnFactory, poolConfig);
			poolableConnFactory.setPool(connPool);
			
			Class.forName("org.apache.commons.dbcp2.PoolingDriver");
			PoolingDriver driver = (PoolingDriver)DriverManager.getDriver("jdbc:apache:commons:dbcp:");
			driver.registerPool(getInitParameter("poolName"), connPool);
			System.out.println("Pool 생성 완료");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
}
