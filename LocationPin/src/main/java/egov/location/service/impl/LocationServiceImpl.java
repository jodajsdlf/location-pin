package egov.location.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egov.location.mapper.LocationMapper;
import egov.location.model.CodeModel;
import egov.location.model.LocationModel;
import egov.location.service.LocationService;
import egov.page.Search; 

@Service
public class LocationServiceImpl extends EgovAbstractServiceImpl implements LocationService {

	@Resource
	LocationMapper mapper; 

	@Override
	public List<LocationModel> selectLocationList(Search sch) throws Exception {
		return mapper.selectLocationList(sch);
	}
	
	@Override
	public int selectLocationListCnt(Search sch) throws Exception {
		return mapper.selectLocationListCnt(sch);
	}

	@Override
	public List<CodeModel> categoryCode() throws Exception {
		return mapper.categoryCode();
	}

	@Override
	public List<LocationModel> selecMapLocation(Search sch) throws Exception {
		return mapper.selecMapLocation(sch);
	}
 
	
}
