package com.zxsm.wsc.entity.doctor;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.apache.commons.lang3.StringUtils;


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
	
	// abc类
	@Column(length = 10)
	private String abc;
	
	// 销售价
	@Column(length = 20)
	private String price;
	
	// 库存
	@Column
	private String stock;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDrug() {
		return drug;
	}

	public void setDrug(String drug) {
		this.drug = drug == null ? null : drug.trim();
	}

	public String getDrugNo() {
		return drugNo;
	}

	public void setDrugNo(String drugNo) {
		this.drugNo = drugNo == null ? null : drugNo.trim();
	}

	public String getSpecification() {
		return specification;
	}

	public void setSpecification(String specification) {
		this.specification = specification == null ? null : specification.trim();
	}

	public String getDosage() {
		return Dosage;
	}

	public void setDosage(String dosage) {
		Dosage = dosage == null ? null : dosage.trim();
	}

	public String getAdministration() {
		return administration;
	}

	public void setAdministration(String administration) {
		this.administration = administration == null ? null : administration.trim();
	}

	public String getStock() {
		return stock == null ? null : stock.trim();
	}

	public void setStock(String stock) {
		this.stock = stock;
	}

	public String getAbc() {
		return abc;
	}

	public void setAbc(String abc) {
		this.abc = abc == null ? null : abc.trim();
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price == null ? null : price.trim();
	}

	public Integer getStockInt(){
		Integer num = 0;
		if(null!=this.stock){
			try {
				String[] ts = this.stock.split("\\.");
				num = Integer.valueOf(ts[0]);
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return num;
	}
}
