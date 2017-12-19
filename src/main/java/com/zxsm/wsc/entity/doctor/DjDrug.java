package com.zxsm.wsc.entity.doctor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


/**
 * 药品
 * @author maeing
 *
 */
@Entity
public class DjDrug {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	// 药名
	@Column(length = 50)
	private String drug;
	
	// 货号
	@Column(length = 20)
	private String drugNo;
	
	// 规格
	@Column(length = 80)
	private String specification;
	
	// 用法
	@Column(length = 200)
	private String Dosage;
	
	// 用量
	@Column(length = 200)
	private String administration;
	

}
