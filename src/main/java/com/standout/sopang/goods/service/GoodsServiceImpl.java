package com.standout.sopang.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.standout.sopang.goods.dao.GoodsDAO;
import com.standout.sopang.goods.vo.GoodsVO;
import com.standout.sopang.goods.vo.ImageFileVO;

@Service("goodsService")
@Transactional(propagation=Propagation.REQUIRED)
public class GoodsServiceImpl implements GoodsService{
	@Autowired
	private GoodsDAO goodsDAO;
	
	public Map<String,List<GoodsVO>> listGoods() throws Exception {
		
		Map<String,List<GoodsVO>> goodsMap=new HashMap<String,List<GoodsVO>>();
		List<GoodsVO> goodsList=goodsDAO.selectGoodsList("bestseller");
		goodsMap.put("bestseller",goodsList);
		
		goodsList=goodsDAO.selectMenusList("������");
		goodsMap.put("cate_digital",goodsList);
		
		goodsList=goodsDAO.selectMenusList("����");
		goodsMap.put("cate_book",goodsList);

		goodsList=goodsDAO.selectMenusList("�ǰ���ɽ�ǰ");
		goodsMap.put("cate_health" ,goodsList);
		
		goodsList=goodsDAO.selectMenusList("��Ȱ��ǰ");
		goodsMap.put("cate_daily",goodsList);
		
		return goodsMap;
	}


	@Override
	public List<GoodsVO> menuGoods(String menuGoods) throws Exception {
		List goodsList=goodsDAO.selectGoodsByMenuGoods(menuGoods);
		return goodsList;
	}
	
	@Override
	public List<String> keywordSearch(String keyword) throws Exception {
		List<String> list=goodsDAO.selectKeywordSearch(keyword);
		return list;
	}
	
	@Override
	public List<GoodsVO> searchGoods(String searchWord) throws Exception{
		List goodsList=goodsDAO.selectGoodsBySearchWord(searchWord);
		return goodsList;
	}
	
	public Map goodsDetail(String _goods_id) throws Exception {
		Map goodsMap=new HashMap();
		GoodsVO goodsVO = goodsDAO.selectGoodsDetail(_goods_id);
		goodsMap.put("goodsVO", goodsVO);
		List<ImageFileVO> imageList =goodsDAO.selectGoodsDetailImage(_goods_id);
		goodsMap.put("imageList", imageList);
		System.out.println(goodsMap);
		return goodsMap;
	}
	
}