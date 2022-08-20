package order.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import order.dto.CartDTO;
import order.dto.OrderDTO;
import sqlmap.MybatisManager;

public class OrderDAO {

	public int deliverStatus1(String userid) {
		int status1 = 0;
		SqlSession session=MybatisManager.getInstance().openSession();
		status1=session.selectOne("order.count1",userid);
		session.close();
		return status1;
	}
	public int deliverStatus2(String userid) {
		int status2 = 0;
		SqlSession session=MybatisManager.getInstance().openSession();
		status2=session.selectOne("order.count2",userid);
		session.close();
		return status2;
	}
	public int deliverStatus3(String userid) {
		int status3 = 0;
		SqlSession session=MybatisManager.getInstance().openSession();
		status3=session.selectOne("order.count3",userid);
		session.close();
		return status3;
	}
	//주문목록
	public List<OrderDTO> orderlist(String userid) {
		List<OrderDTO> list = null;
		SqlSession session=MybatisManager.getInstance().openSession();
		try {
			list=session.selectList("order.orderlist",userid);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return list;
	}
	public List<OrderDTO> cancellist(String userid) {
		List<OrderDTO> list = null;
		SqlSession session=MybatisManager.getInstance().openSession();
		try {
			list=session.selectList("order.cancellist",userid);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return list;
	}
	public List<OrderDTO> returnlist(String userid) {
		List<OrderDTO> list = null;
		SqlSession session=MybatisManager.getInstance().openSession();
		try {
			list=session.selectList("order.returnlist",userid);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return list;
	}
	public void addcartItem(int idx) {
		SqlSession session=MybatisManager.getInstance().openSession();
		try {
			session.insert("order.addcartItem",idx);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
	}
	public void addcartid(int num, int idx) {
		Map<String,Object> map=new HashMap<>();
		map.put("num", num);
		map.put("idx", idx);
		SqlSession session=MybatisManager.getInstance().openSession();
		try {
			session.update("order.addcartid",map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
	}
	public List<CartDTO> cartview() {
		List<CartDTO> list = null;
		SqlSession session=MybatisManager.getInstance().openSession();
		try {
			list = session.selectList("order.cartView");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return list;
	}
	public void updatenumUp(int idx) {
		SqlSession session=MybatisManager.getInstance().openSession();
		try {
			session.update("order.numUp",idx);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
	}
	public void updatenumDown(int idx) {
		SqlSession session=MybatisManager.getInstance().openSession();
		try {
			session.update("order.numDown",idx);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
	}

}
