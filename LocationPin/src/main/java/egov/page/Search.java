package egov.page;

import lombok.Data;

@Data
public class Search {
	private int pageNum = 1; // 기본페이지
	private int amount = 10; // 한페이지 게시물수
	private int limit=0;
	
	private String searchType = ""; //검색 타입
	private String searchName = ""; //검색어
	
	public int getLimit(){
		return (pageNum - 1) * amount; 
	}
	
}
