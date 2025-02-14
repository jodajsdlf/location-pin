package egov.location.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egov.location.model.LocationModel;
import egov.page.Search; 

@Mapper
public interface LocationMapper { 

	List<LocationModel> selectLocation(Search sch);  
	int selectLocationListCnt(Search sch);
}
