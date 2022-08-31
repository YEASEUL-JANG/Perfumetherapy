package review.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import items.itemsDTO;
import review.dto.ReviewCommentDTO;
import review.dto.ReviewDTO;
import sqlmap.MybatisManager;

public class ReviewDAO {

	public void insert(ReviewDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.insert("review.insert", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public int count(String userid) {
		int result=0;
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			result=session.selectOne("review.count",userid);
		}catch (Exception e) {
			e.printStackTrace();
		}//finally절 생략 가능
		return result;
	}

	public List<ReviewDTO> list(int start, int end, String userid) {
		List<ReviewDTO> list=null;
		SqlSession session=null;
		//혹시 있을지 모를 예외발생 처리하기 위해 try문 쓰는게 좋다.
		try {
			session=MybatisManager.getInstance().openSession();
			Map<String,Object> map=new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			map.put("userid", userid);
			list=session.selectList("review.list", map);
			/*
			 * for(ReviewDTO dto : list) { String content=dto.getContent();
			 * content=content.replace("\n", "<br>"); dto.setContent(content); }
			 */
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public List<ReviewDTO> searchList(String keyword,String userid) {
		List<ReviewDTO> list=null;
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			Map<String,String> map=new HashMap<>();
			map.put("keyword", "%"+keyword+"%");
			map.put("userid", userid);
			list=session.selectList("review.searchList", map);
			for(ReviewDTO dto : list) {
				String content = dto.getContent();
				String title = dto.getTitle();
				String iname = dto.getItemsDTO().getIname();
				iname=iname.replace(keyword, "<span style='color:red'>"+keyword+"</span>");
				content=content.replace(keyword, "<span style='color:red'>"+keyword+"</span>");
				title=title.replace(keyword, "<span style='color:red'>"+keyword+"</span>");
				dto.setContent(content);
				dto.setTitle(title);
				dto.getItemsDTO().setIname(iname);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public ReviewDTO view(int num) {
		ReviewDTO dto = null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			dto=session.selectOne("review.view", num);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return dto;
	}

	public void update(ReviewDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.update("review.update", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public String getFileName(int num) {
		String result="";
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			result=session.selectOne("review.getFileName", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return result;
	}

	public void delete(int num) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.delete("review.delete", num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public List<ReviewCommentDTO> commentList(int num) {
		List<ReviewCommentDTO> list = null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			list=session.selectList("review.commentList", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public void commentAdd(ReviewCommentDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.insert("review.commentAdd", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public int countall() {
		int result=0;
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			result=session.selectOne("review.countall");
		}catch (Exception e) {
			e.printStackTrace();
		}//finally절 생략 가능
		return result;
	}

	public List<ReviewDTO> listall(int start, int end) {
		List<ReviewDTO> list=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			Map<String,Object> map=new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			list=session.selectList("review.listall", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public List<ReviewDTO> searchAll(String keyword) {
		List<ReviewDTO> list=null;
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			Map<String,String> map=new HashMap<>();
			map.put("keyword", "%"+keyword+"%");
			list=session.selectList("review.searchAll", map);
			for(ReviewDTO dto : list) {
				String content = dto.getContent();
				String title = dto.getTitle();
				String iname = dto.getItemsDTO().getIname();
				iname=iname.replace(keyword, "<span style='color:red'>"+keyword+"</span>");
				content=content.replace(keyword, "<span style='color:red'>"+keyword+"</span>");
				title=title.replace(keyword, "<span style='color:red'>"+keyword+"</span>");
				dto.setContent(content);
				dto.setTitle(title);
				dto.getItemsDTO().setIname(iname);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int countphoto() {
		int result=0;
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			result=session.selectOne("review.countphoto");
		}catch (Exception e) {
			e.printStackTrace();
		}//finally절 생략 가능
		return result;
	}

	public List<ReviewDTO> photolist(int start, int end) {
		List<ReviewDTO> list=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			Map<String,Object> map=new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			list=session.selectList("review.photolist", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public String getusername(int num) {
		String username = "";
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			username=session.selectOne("review.getusername",num);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return username;
	}

	public String getusername2(int num) {
		String username = "";
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			username=session.selectOne("review.getusername2",num);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return username;
	}
	

}
