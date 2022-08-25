package items;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import sqlmap.MybatisManager;

public class itemsDAO {
	public List<itemsDTO> listitem(int start, int end, String category, String big_category) {
		SqlSession session = MybatisManager.getInstance().openSession();
		List<itemsDTO> list = null;
		try {
			if(category.equals("all")) {
				Map<String,Object> map=new HashMap<>();
				map.put("start", start);
				map.put("end", end);
				map.put("big_category", big_category);
				list=session.selectList("items.listAll",map);
			}else {
				Map<String,Object> map=new HashMap<>();
				map.put("start", start);
				map.put("end", end);
				map.put("big_category", big_category);
				map.put("category", "%"+category+"%");
		      list=session.selectList("items.list",map);
			}
			for(itemsDTO dto : list) {//for문으로 처리
				String memo= dto.getMemo(); 
				memo=memo.replace("  ","&nbsp;&nbsp;");
				 memo=memo.replace("<", "&lt"); 
				 memo=memo.replace(">", "&gt");
				 dto.setMemo(memo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return list;
	}
	public void insertItem(itemsDTO dto) {
		SqlSession session = MybatisManager.getInstance().openSession();
		session.insert("items.insert",dto);
		session.commit();
		session.close();
	}
	public int itemCount() {
		SqlSession session=MybatisManager.getInstance().openSession();
		int count=session.selectOne("items.itemCount");
		session.close();
		return count;
	}
	public List<itemsDTO> itemTable(int start, int end, String searchkey, String search){
		SqlSession session=MybatisManager.getInstance().openSession();
		List<itemsDTO> list = null;
		Map<String,Object> map=new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("searchkey", searchkey);
		map.put("search", "%"+search+"%");
		 list=session.selectList("items.itemTable", map);
		for(itemsDTO dto : list) {
			String iname = dto.getIname();
			String brand=dto.getBrand();
			String big_category = dto.getBig_category();
			String category = dto.getCategory();
			//키워드 색칠
			if(searchkey.equals("iname")) {
				iname=iname.replace(search, "<span style='color:red'>"+search+"</span>");
			}else if(searchkey.equals("brand")) {
				brand=brand.replace(search, "<span style='color:red'>"+search+"</span>");
			}else if(searchkey.equals("big_category")) {
				big_category=big_category.replace(search, "<span style='color:red'>"+search+"</span>");
			}else if(searchkey.equals("category")) {
				category=category.replace(search, "<span style='color:red'>"+search+"</span>");
			}else{
				brand=brand.replace(search, "<span style='color:red'>"+search+"</span>");
				iname=iname.replace(search, "<span style='color:red'>"+search+"</span>");
				big_category=big_category.replace(search, "<span style='color:red'>"+search+"</span>");
				category=category.replace(search, "<span style='color:red'>"+search+"</span>");
			}
			dto.setIname(iname);
			dto.setBig_category(big_category);
			dto.setBrand(brand);
			dto.setCategory(category);
		}
		session.close();
		return list;
	}
	public int searchCount(String searchkey, String search) {
		SqlSession session=MybatisManager.getInstance().openSession();
		Map<String,Object> map=new HashMap<>();
		map.put("searchkey", searchkey);
		map.put("search", "%"+search+"%");
		int count=session.selectOne("items.searchCount",map);
		session.close();
		return count;
	}
	public itemsDTO viewItem(int idx) {
		itemsDTO dto = null;
		SqlSession session = MybatisManager.getInstance().openSession();
		try {
			dto=session.selectOne("items.viewItem",idx);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return dto;
	}
	public void updateItem(itemsDTO dto) {
		SqlSession session=MybatisManager.getInstance().openSession();
		session.update("items.update",dto);
		session.commit();
		session.close();
	}

	public void deleteItem(int idx) {
		SqlSession session = MybatisManager.getInstance().openSession();
		session.delete("items.delete",idx);
		session.commit();
		session.close();
	}
	public int listCount(String big_category) {
		SqlSession session=MybatisManager.getInstance().openSession();
		int count=session.selectOne("items.listCount",big_category);
		session.close();
		return count;
	}
	public int listCatCount(String category, String big_category) {
		SqlSession session=MybatisManager.getInstance().openSession();
		Map<String,Object> map=new HashMap<>();
		map.put("category", category);
		map.put("big_category", big_category);
		int count=session.selectOne("items.listCatCount",map);
		session.close();
		return count;
	}
	//찜목록에 아이템 추가
	public void addlike(int idx) {
		SqlSession session = MybatisManager.getInstance().openSession();
		try {
			session.insert("items.addlike",idx);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
	}
	//찜목록에 찜테이블id추가
	public void addlikeid(int idx) {
		SqlSession session = MybatisManager.getInstance().openSession();
		session.update("items.addlikeid",idx);
		session.commit();
		session.close();
	}
	public List<wishDTO> wishview() {
		List<wishDTO> list = null;
		SqlSession session = MybatisManager.getInstance().openSession();
		list = session.selectList("items.wishview");
		session.close();
		return list;
	}
}
