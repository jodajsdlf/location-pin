package egov.location.service;

import java.util.List;

import egov.location.model.LocationModel;
import egov.page.Search;

public interface LocationService  {

	List<LocationModel> selectLocation() throws Exception; 
}
