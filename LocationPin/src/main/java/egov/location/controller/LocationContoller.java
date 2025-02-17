package egov.location.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

import egov.location.model.LocationModel;
import egov.location.service.LocationService;
import egov.page.Paging;
import egov.page.Search;

@Controller
public class LocationContoller {

	@Autowired
	private LocationService locationService;
	
	// ObjectMapper 인스턴스 생성
    ObjectMapper objectMapper = new ObjectMapper();

    @GetMapping(value = "location.do")
    public String Location(Search sch, Model model) throws Exception {
	        List<LocationModel> list = locationService.selectLocationList(sch);
	        model.addAttribute("list", list);
	
	        int total = locationService.selectLocationListCnt(sch);
	        model.addAttribute("total", total);
	        model.addAttribute("paging", new Paging(sch, total));
        return "location";
    }

	@GetMapping(value = "locationMap.do")
	public String locationMap(Model model) throws Exception {
		List<LocationModel> list = locationService.selectLocation();  
	    
	    // JSON 문자열로 변환하여 JSP에 전달
		objectMapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);
		String jsonList = objectMapper.writeValueAsString(list)
		                       .replaceAll("\\\\n", "") // 줄 바꿈 제거
		                       .replaceAll("\\\\t", ""); // 탭 제거 
	    
	    model.addAttribute("list", jsonList); 
		return "locationmap";
	}

	@GetMapping(value = "locationMapKke.do")
	public String locationMapKke(Model model) throws Exception { 
	    List<LocationModel> list = locationService.selectLocation();  
	    
	    // JSON 문자열로 변환하여 JSP에 전달
	    String jsonList = objectMapper.writeValueAsString(list);
	    
	    model.addAttribute("list", jsonList); 
	    
	    return "locationmapkke";
	}


}
