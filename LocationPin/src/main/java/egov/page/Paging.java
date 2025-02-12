package egov.page;

import lombok.Data;

@Data
public class Paging {
	private int startPage;//현재 시작페이지
	private int endPage;//현재 마지막페이지
	private boolean prev, next;//이전,다음 페이지 존제유무
	private int pageSize = 10;//페이징 수
	private int totalPage;//총 페이지 수
	private int total;//총 게시물 수 
	private Search sch;// 쿼리 조건
	
	public Paging(Search sch, int total) {
		this.sch = sch;
		this.total = total;		
		this.endPage = (int)(Math.ceil(sch.getPageNum()/ (double)pageSize)) * pageSize;
		this.startPage = this.endPage - (pageSize - 1);		
		this.totalPage = (int)(Math.ceil((double)total / sch.getAmount()));
		
		if(totalPage < this.endPage) { this.endPage = totalPage; }
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < totalPage;
	}
}
