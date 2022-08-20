package sqlmap;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisManager {
//Mybatis의 SqlSession객체를 생성한다.
	private static SqlSessionFactory instance;
	
	private MybatisManager() {
		
	}
	/* 생성자는 보통 public으로 사용되나, private를 쓰면 외부접근이 불가하다.
	 * 웹프로그램 : 웹은 불특정 다수가 접속해서 서비스를 받음
	 * MybatisManager객체가 계속적으로 생기게되면 메모리가 늘어나고 결국 서버다운
	 * 다수의 인스턴스 생성을 막고 하나의 인스턴스만 생성시켜 처리한다.
	 * 이러한 패턴을 싱글턴 패턴기법이라고 한다.
	 * new로 접근이 안되기 때문에 getInstance()메소드로 우회해 접근한다.
	 */
	public static SqlSessionFactory getInstance() {
		Reader reader = null;
		try {
			//getResourceAsReader: Java Resource의 src의 xml을 읽어드리는 메소드
			reader = Resources.getResourceAsReader("sqlmap/sqlMapConfig.xml");
			instance = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(reader != null) reader.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return instance;
	}
}
