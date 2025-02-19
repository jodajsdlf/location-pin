package egov.location.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egov.location.model.CodeModel;
import egov.location.model.LocationModel;
import egov.page.Search; 

@Mapper
public interface LocationMapper { 
	List<LocationModel> selectLocation();

	List<LocationModel> selectLocationList(Search sch);  

	int selectLocationListCnt(Search sch);
	
	List<CodeModel> categoryCode();

	List<LocationModel> selecMapLocation();

}
