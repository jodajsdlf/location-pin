package egov.location.controller;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fasterxml.jackson.databind.ObjectMapper;

import egov.location.model.LocationModel;
import egov.location.service.LocationService;

@Controller
public class LocationContoller { 
	
	@Autowired
	private LocationService locationService;
	
	@GetMapping(value="location.do")
	public String Location (Model model) throws Exception{
		List<LocationModel> list = locationService.selectLocation();
		model.addAttribute("list", list);
		return "location";
	}
	
	@GetMapping(value="locationMap.do")
	public String locationMap(Model model) throws Exception{ 
		 List<LocationModel> list = locationService.selectLocation();
		 model.addAttribute("list", list); 
		return "locationmap";
	}
	 
	@GetMapping(value="locationMapKke.do")
	public String locationMapKke(Model model) throws Exception { 
	    List<LocationModel> list = locationService.selectLocation();
	    
	    // JSON 문자열로 변환하여 JSP에 전달
	    ObjectMapper objectMapper = new ObjectMapper();
	    String jsonList = objectMapper.writeValueAsString(list);
	    
	    model.addAttribute("list", jsonList);
	    return "locationmap";
	}

}
