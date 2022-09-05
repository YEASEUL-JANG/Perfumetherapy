package order.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import items.wishDTO;
import order.dto.CartDTO;
import order.dto.OrderDTO;
import order.dto.OrderdetailDTO;
import sqlmap.MybatisManager;
import user.userDTO;

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
	//카트테이블에 아이템 insert
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
	//카트테이블에 카트번호 업데이트
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
	//카트테이블 상품삭제
	public void deleteCart(int cartid) {
		SqlSession session=MybatisManager.getInstance().openSession();
		try {
			session.delete("order.deleteCart",cartid);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		
	}
	public int order_seq() {
		int key = 0;
		SqlSession session=MybatisManager.getInstance().openSession();
		key=session.selectOne("order.orderSeq");
		session.close();
		return key;
	}
	public void addorderList(String trade_code, String userid, int total_price) {
		SqlSession session=MybatisManager.getInstance().openSession();
		try {
			Map<Object,Object> map = new HashMap<>();
			map.put("trade_code", trade_code);
			map.put("userid", userid);
			map.put("total_price", total_price);
			session.insert("order.addorderList",map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		
	}
	public void addDetailorder(String trade_code, String userid, int cartid) {
		SqlSession session=MybatisManager.getInstance().openSession();
		try {
			Map<String,Object> map=new HashMap<>();
			map.put("trade_code", trade_code);
			map.put("userid", userid);
			map.put("cartid", cartid);
			session.insert("order.addDetailorder",map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
	}
	public void updateDetailorder(String trade_code, int cartid) {
		Map<String,Object> map=new HashMap<>();
		map.put("trade_code", trade_code);
		map.put("cartid", cartid);
		SqlSession session=MybatisManager.getInstance().openSession();
		try {
			session.update("order.updateDetailorder",map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
	}
	public List<OrderdetailDTO> orderdetail(String userid, String orderid) {
		List<OrderdetailDTO> list = null;
		SqlSession session=MybatisManager.getInstance().openSession();
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("orderid", orderid);
		try {
			list = session.selectList("order.orderdetail",map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return list;
	}
	public userDTO getuser(String userid) {
		userDTO dto = null;
		SqlSession session=MybatisManager.getInstance().openSession();
		try {
			dto = session.selectOne("order.getuser",userid);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return dto;
	}
	//주문내역 삭제
	public void deleteorder(String userid, String orderid) {
		SqlSession session=MybatisManager.getInstance().openSession();
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("userid", userid);
			map.put("orderid", orderid);
			session.delete("order.deleteorder",map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		
	}
	//장바구니에 아이템 다시넣기(주문번호로)
	public void addcartagain(String orderid) {
		SqlSession session=MybatisManager.getInstance().openSession();
		try {
			session.insert("order.addcartagain",orderid);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
	}
	public List<OrderdetailDTO> viewdetailorder(String userid, String orderid) {
		List<OrderdetailDTO> list = null;
		SqlSession session=MybatisManager.getInstance().openSession();
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("userid", userid);
			map.put("orderid", orderid);
			list=session.selectList("order.viewdetailorder",map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return list;
	}
	//order테이블 주문취소상태로 변경
	public void withdrawalorder(String userid, String orderid) {
		Map<String,Object> map=new HashMap<>();
		map.put("userid", userid);
		map.put("orderid", orderid);
		SqlSession session=MybatisManager.getInstance().openSession();
		try {
			session.update("order.updateorder",map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		
	}
	public void takebackorder(String userid, String orderid) {
		Map<String,Object> map=new HashMap<>();
		map.put("userid", userid);
		map.put("orderid", orderid);
		SqlSession session=MybatisManager.getInstance().openSession();
		try {
			session.update("order.takebackorder",map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
	}
	//관심상품 리스트 가져오기
	public wishDTO getwish(int cartid) {
		wishDTO dto = null;
		SqlSession session=MybatisManager.getInstance().openSession();
		try {
			dto = session.selectOne("order.getwish",cartid);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return dto;
	}
	//상세주문테이블에 찜목록 업데이트
	public void updateDetailwish(String trade_code, int cartid) {
		Map<String,Object> map=new HashMap<>();
		map.put("trade_code", trade_code);
		map.put("cartid", cartid);
		SqlSession session=MybatisManager.getInstance().openSession();
		try {
			session.update("order.updateDetailwish",map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
	}
	//관심상품 테이블 삭제
	public void deleteWish(int cartid) {
		SqlSession session=MybatisManager.getInstance().openSession();
		try {
			session.delete("order.deleteWish",cartid);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
	}
	public void wishaddcart(int cartid) {
		SqlSession session=MybatisManager.getInstance().openSession();
		try {
			session.insert("order.wishaddcart",cartid);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
	}
	public CartDTO getcart(int cartid) {
		CartDTO dto = null;
		SqlSession session=MybatisManager.getInstance().openSession();
		try {
			dto = session.selectOne("order.getcart",cartid);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return dto;
	}
	public void deleteAllcart() {
		SqlSession session=MybatisManager.getInstance().openSession();
		try {
			session.delete("order.deleteAllcart");
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
	}
	public void deleteAllwish() {
		SqlSession session=MybatisManager.getInstance().openSession();
		try {
			session.delete("order.deleteAllwish");
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
	}
	public List<OrderDTO> allorder(int start, int end) {
		List<OrderDTO> list = null;
		SqlSession session=MybatisManager.getInstance().openSession();
		try {
			Map<String,Object> map=new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			list=session.selectList("order.allorder",map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return list;
	}
	public int count() {
		int result=0;
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			result=session.selectOne("order.count");
		}catch (Exception e) {
			e.printStackTrace();
		}//finally절 생략 가능
		return result;
	}
	public List<OrderdetailDTO> admindetailorder(String orderid) {
		List<OrderdetailDTO> list = null;
		SqlSession session=MybatisManager.getInstance().openSession();
		try {
			list = session.selectList("order.admindetailorder",orderid);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return list;
	}

}
