package com.zxsm.wsc.repository.doctor;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.zxsm.wsc.entity.doctor.DjDrug;


public interface DjDrugRepo extends PagingAndSortingRepository<DjDrug, Long>, JpaSpecificationExecutor<DjDrug> 
{
	
}
