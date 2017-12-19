package com.zxsm.wsc.service.doctor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
}
