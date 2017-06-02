package TheBook.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import TheBook.service.bookBaguniVO;
import TheBook.service.bookBuyDetailVO;
import TheBook.service.bookBuyVO;
import TheBook.service.bookMemberVO;
import TheBook.service.bookMyPageService;
import TheBook.service.bookRebookVO;
import TheBook.service.bookVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("bookMyPageService")
public class bookMyPageImpl extends EgovAbstractServiceImpl implements bookMyPageService {

	@Resource(name = "bookMyPageDAO")
	private bookMyPageDAO bookMyPageDAO;

	@Override
	public bookMemberVO selectMemInfo(String memid) throws Exception {
		return bookMyPageDAO.selectMemInfo(memid);
	}

	@Override
	public List<?> selectMemBookBuy(bookBuyDetailVO bookBuyDetailVO) throws Exception {
		return bookMyPageDAO.selectMemBookBuy(bookBuyDetailVO);
	}
	
	@Override
	public int selectMemBookBuyTot(String memid) {
		return bookMyPageDAO.selectMemBookBuyTot(memid);
	}

	@Override
	public List<?> selectMemBookAuthor(String memid) {
		return bookMyPageDAO.selectMemBookAuthor(memid);
	}

	@Override
	public int selectCntPay(String memid) {
		return bookMyPageDAO.selectCntPay(memid);
	}

	@Override
	public int selectCntPrepare(String memid) {
		return bookMyPageDAO.selectCntPrepare(memid);
	}

	@Override
	public int selectCntShipping(String memid) {
		return bookMyPageDAO.selectCntShipping(memid);
	}

	@Override
	public int selectCntFinish(String memid) {
		return bookMyPageDAO.selectCntFinish(memid);
	}

	@Override
	public List<?> selectBookQnaList(String memid) throws Exception {
		return bookMyPageDAO.selectBookQnaList(memid);
	}

	@Override
	public List<?> selectReBookList(String memid) throws Exception {
		return bookMyPageDAO.selectReBookList(memid);
	}

	@Override
	public int selectReMemInfo(bookMemberVO bookMemberVO) {
		return bookMyPageDAO.selectReMemInfo(bookMemberVO);
	}

	@Override
	public int updateMemModify(bookMemberVO bookMemberVO) {
		return bookMyPageDAO.updateMemModify(bookMemberVO);
	}

	@Override
	public int deleteMemModify(bookMemberVO bookMemberVO) {
		return bookMyPageDAO.deleteMemModify(bookMemberVO);
	}

	@Override
	public bookBuyDetailVO selectBookBuyDetail(bookBuyDetailVO detailVO) throws Exception {
		return bookMyPageDAO.selectBookBuyDetail(detailVO);
	}

	@Override
	public int updateBookMemberPointPlus(bookMemberVO memberVO) throws Exception {
		return bookMyPageDAO.updateBookMemberPointPlus(memberVO);
	}

	@Override
	public int selectBookMemberGrade(String memid) throws Exception {
		return bookMyPageDAO.selectBookMemberGrade(memid);
	}

	@Override
	public int deleteRebook(String buydetailbookunq) throws Exception {
		return bookMyPageDAO.deleteRebook(buydetailbookunq);
	}

	@Override
	public int deleteBookBaguni(String buydetailbookunq) throws Exception {
		return bookMyPageDAO.deleteBookBaguni(buydetailbookunq);
	}

	@Override
	public int updateBookBototal(bookBuyDetailVO detailVO) throws Exception {
		return bookMyPageDAO.updateBookBototal(detailVO);
	}

	@Override
	public int updateBookBuyDetailCondition(bookBuyDetailVO detailVO) throws Exception {
		return bookMyPageDAO.updateBookBuyDetailCondition(detailVO);
	}

	@Override
	public int selectBookCost(bookBuyDetailVO detailVO) {
		return bookMyPageDAO.selectBookCost(detailVO);
	}
	
	
	@Autowired
	PlatformTransactionManager txManager;
	
	@Override
	public boolean requestCancel(bookBuyDetailVO detailVO, String memid) throws Exception{
		
		String buyunq = detailVO.getBuydetailbuyunq();
		String bookunq = detailVO.getBuydetailbookunq();
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setName("tx_requestCancel");
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);
		
		try {
			detailVO = bookMyPageDAO.selectSumCashPoint(detailVO); //디비접속1: SELECT 총책가격,사용현금,사용적립금,수량
			int totBookCost, usedCash, usedPoint, bookCnt = 0; 
			totBookCost= detailVO.getTotBookCost();
			usedCash= detailVO.getUsedCash();
			usedPoint= detailVO.getUsedPoint();
			bookCnt = detailVO.getBuydetailcnt();
			
			bookBuyVO bookBuyVO = new bookBuyVO();
			bookMemberVO bookMemberVO = new bookMemberVO();
			
			int updatedUsedCash, updatedUsedPoint, gap = 0;
			
			if(totBookCost > usedCash){ 
				gap = totBookCost - usedCash;
				updatedUsedPoint = usedPoint - gap;
				updatedUsedCash = 0;
				
				bookBuyVO.setBuycash(updatedUsedCash);
				bookBuyVO.setBuypoint(updatedUsedPoint);
				bookBuyVO.setBuyunq(buyunq);
				
				bookMyPageDAO.updateCashPoint(bookBuyVO); //디비접속2: UPDATE 사용현금 0, 사용적립금-
				bookMemberVO.setMemid(memid);
				bookMemberVO.setGap(gap);
				
				bookMyPageDAO.updateMemPoint(bookMemberVO);//디비접속3: UPDATE 회원적립금+
			}else if(totBookCost < usedCash){
				updatedUsedCash = usedCash - totBookCost;
				
				bookBuyVO.setBuycash(updatedUsedCash);
				bookBuyVO.setBuypoint(usedPoint);
				bookBuyVO.setBuyunq(buyunq);
				
				bookMyPageDAO.updateCashPoint(bookBuyVO); //디비접속2: UPDATE 사용현금-
			}
			
			if(bookunq.startsWith("j")){	//중고책
				bookMyPageDAO.updateRebookStock(bookunq); //디비접속4: UPDATE 중고책 수량 +
				
			}else{	//새책
				bookVO bookVO = new bookVO();
				bookVO.setBototal(bookCnt);
				bookVO.setBounq(bookunq);
				//bookMyPageDAO.updateBookBoTotal(bookVO); //디비접속4: UPDATE 책판매량 -
				bookMyPageDAO.updateBookStock(bookVO);	 //디비접속5: UPDATE 새책수량 +
			}
			
			detailVO.setBuydetailbuyunq(buyunq);
			detailVO.setBuydetailbookunq(bookunq);
			bookMyPageDAO.updateBookDetail(detailVO);//디비접속6: UPDATE 수량 0, 총책가격 0, 취소신청중
			
		}catch(Exception e) {
			txManager.rollback(status);
            return false;
        }
		txManager.commit(status);
		return true;
	}

	@Override
	public int UpdateReBook(String rebounq, int reboprice, String memid) {
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setName("tx_UpdateReBook");
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);
		
		bookBaguniVO bookBaguniVO = new bookBaguniVO();
		bookRebookVO bookRebookVO = new bookRebookVO();
		try {
			
			bookBaguniVO.setBagunirebounq(rebounq);
			bookBaguniVO.setBaguniprice(reboprice);
			bookMyPageDAO.UpdateReBookBaguni(bookBaguniVO);
			
			bookRebookVO.setRebounq(rebounq);
			bookRebookVO.setReboprice(reboprice);
			bookRebookVO.setReboid(memid);
			bookMyPageDAO.UpdateReBook(bookRebookVO);
			
		}catch(Exception e) {
			txManager.rollback(status);
            return 0;
        }
		txManager.commit(status);
		return 1;
	}

	@Override
	public int DeleteReBook(String rebounq, String memid) {
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setName("tx_DeleteReBook");
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);
		
		bookRebookVO bookRebookVO = new bookRebookVO();
		try {
			bookRebookVO.setRebounq(rebounq);
			bookRebookVO.setReboid(memid);
			bookMyPageDAO.DeleteReBookBaguni(rebounq);
			bookMyPageDAO.DeleteReBook(bookRebookVO);
			
		}catch(Exception e) {
			txManager.rollback(status);
            return 0;
        }
		txManager.commit(status);
		return 1;
	}
}