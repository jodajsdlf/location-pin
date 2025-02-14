package egov.location.service;

import java.util.List;

import egov.location.model.LocationModel;
import egov.page.Search;

public interface LocationService  {

	List<LocationModel> selectLocation(Search sch) throws Exception;
	int selectLocationListCnt(Search sch) throws Exception; 
}
