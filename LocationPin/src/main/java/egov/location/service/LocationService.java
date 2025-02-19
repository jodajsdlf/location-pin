package egov.location.service;

import java.util.List;

import egov.location.model.CodeModel;
import egov.location.model.LocationModel;
import egov.page.Search;

public interface LocationService  {

	List<LocationModel> selectLocation() throws Exception;

	int selectLocationListCnt(Search sch) throws Exception;

	List<LocationModel> selectLocationList(Search sch) throws Exception; 
	
	List<CodeModel> categoryCode() throws Exception;
}
