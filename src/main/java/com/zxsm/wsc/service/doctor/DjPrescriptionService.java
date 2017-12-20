package com.zxsm.wsc.service.doctor;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zxsm.wsc.common.SerchTools.Criteria;
import com.zxsm.wsc.common.SerchTools.Criterion;
import com.zxsm.wsc.common.SerchTools.Restrictions;
import com.zxsm.wsc.common.UtilsTools.StringTools;
import com.zxsm.wsc.entity.doctor.DjDoctor;
import com.zxsm.wsc.entity.doctor.DjPrescription;
import com.zxsm.wsc.repository.doctor.DjPrescriptionRepo;

@Service
@Transactional
public class DjPrescriptionService {

	@Autowired
	private DjPrescriptionRepo preRepo;
	//查找
		public DjPrescription findOne(Long id)
		{
			if(id == null)
				return null;
			return preRepo.findOne(id);
		}
		
		public Page<DjPrescription> findAll(int page, int size)
		{
			PageRequest pageRequest = new PageRequest(page, size, new Sort(Direction.ASC, "initDate"));
			return preRepo.findAll(pageRequest);
		}
		
		/**
		 * 保存
		 * @param e
		 * @return
		 */
		public DjPrescription save(DjPrescription e)
		{
			if( null == e)
				return null;
			
			return preRepo.save(e);
		}

		public List<DjPrescription> save(List<DjPrescription> entities)
		{

			return (List<DjPrescription>) preRepo.save(entities);
		}
		
		public void delete(Long id)
		{
			preRepo.delete(id);
		}
		
		public Criteria<DjPrescription> initCriteria(Map<String,Object> searchMap)
		{
			if (searchMap == null || searchMap.isEmpty())
				return null;

			Criteria<DjPrescription> criteria = new Criteria<DjPrescription>();

			String patName = (String) searchMap.get(DjPrescription.sPatName);
			if(patName != null)
				criteria.add(Restrictions.like(DjPrescription.sPatName, patName, true));
			
			String preNo = (String) searchMap.get(DjPrescription.sPreNo);
			if(preNo != null)
				criteria.add(Restrictions.like(DjPrescription.sPreNo, preNo, true));
			
			Date preDate = (Date) searchMap.get(DjPrescription.sPreDate);
			if(preDate != null)
				criteria.add(Restrictions.eq(DjPrescription.sPreDate, preDate, true));

			Integer status = (Integer) searchMap.get(DjPrescription.sStatus);
			if(status != null)
				criteria.add(Restrictions.eq(DjPrescription.sStatus, status, true));
			
			Integer passStatus = (Integer) searchMap.get(DjPrescription.sPassStatus);
			if(passStatus != null)
				criteria.add(Restrictions.eq(DjPrescription.sPassStatus, passStatus, true));
			
			Integer type = (Integer) searchMap.get(DjPrescription.sType);
			if(type != null)
				criteria.add(Restrictions.eq(DjPrescription.sType, type, true));
			
			Boolean expressStatus = (Boolean) searchMap.get(DjDoctor.sIsOnline);
			if(expressStatus != null)
				criteria.add(Restrictions.eq(DjDoctor.sIsOnline, expressStatus, true));

			String keywords = (String )searchMap.get(DjDoctor.sKeywords);
			if(StringUtils.isNotBlank(keywords))
				criteria.add(
						Restrictions.or
						(
								new Criterion[] {Restrictions.like(DjDoctor.sUsername, keywords, true),
								Restrictions.like(DjDoctor.sName, keywords, true),
								Restrictions.like(DjDoctor.sDiseaseKwd, keywords, true)}
								)
						);
			
			
			return criteria;
		}
		
		
		/**
		 * 初始化审核单
		 * @param store 门店
		 * @param storeId 门店id
		 * @param imgUrl 审核单的图片地址
		 * @param phaName 药师名字
		 * @param phaId 药师id
		 * @return
		 */
		public DjPrescription initPres(String store,Long storeId,String imgUrl,String phaName,Long phaId)
		{
			DjPrescription pre = new DjPrescription();
			pre.setPreNo(StringTools.getUniqueNoWithHeader("SH"));
			pre.setStore(store);
			pre.setStoreId(storeId);
			pre.setType(1);
			pre.setPreDate(new Date());
			pre.setStatus(0);
			pre.setPassStatus(0);
			pre.setImgUrl(imgUrl);
			pre.setPhaName(phaName);
			pre.setPhaId(phaId);
			return this.save(pre);
		}
}
