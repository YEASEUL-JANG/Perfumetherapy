package user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import sqlmap.MybatisManager;

public class userDAO {

	public void insertuser(userDTO dto) {
		SqlSession session = MybatisManager.getInstance().openSession();
		session.insert("users.insert",dto);
		session.commit();
		session.close();
	}

	public int idCheck(String id) {
		int checknum = 0;
		SqlSession session = MybatisManager.getInstance().openSession();
		checknum = session.selectOne("users.idcheck",id);
		session.close();
		return checknum;
	}

	public String userlogin(userDTO dto) {
		String uname = "";
		SqlSession session = MybatisManager.getInstance().openSession();
		try {
			uname = session.selectOne("users.login",dto);
			System.out.println(uname);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return uname;
	}

	public String searchId(userDTO dto) {
		String userid = "";
		SqlSession session = MybatisManager.getInstance().openSession();
		try {
			userid = session.selectOne("users.searchId",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return userid;
	}

	public String searchPasswd(userDTO dto) {
		String passwd = "";
		SqlSession session = MybatisManager.getInstance().openSession();
		try {
			passwd = session.selectOne("users.searchPasswd",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return passwd;
	}


	public int passwdcheck(String userid, String userpasswd) {
		int result = 0;
		SqlSession session = MybatisManager.getInstance().openSession();
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("userid", userid);
			map.put("userpasswd", userpasswd);
			result = session.selectOne("users.passwdcheck",map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return result;
	}

	public userDTO getuser(String userid) {
		userDTO dto = null;
		SqlSession session = MybatisManager.getInstance().openSession();
		try {
			dto = session.selectOne("users.getuser",userid);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return dto;
	}

	public void updatepasswd(userDTO dto) {
		SqlSession session = MybatisManager.getInstance().openSession();
		try {
			session.update("users.updatepasswd",dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
	}

	public void updateme(userDTO dto) {
		SqlSession session = MybatisManager.getInstance().openSession();
		try {
			session.update("users.updateme",dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
	}

	public void withdraw(String userid) {
		SqlSession session = MybatisManager.getInstance().openSession();
		try {
			session.delete("users.withdraw",userid);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
	}
}
