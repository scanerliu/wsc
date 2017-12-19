package com.zxsm.wsc.repository.doctor;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.zxsm.wsc.entity.doctor.DjPrescription;


public interface DjPrescriptionRepo extends PagingAndSortingRepository<DjPrescription, Long>, JpaSpecificationExecutor<DjPrescription> 
{
	
}
