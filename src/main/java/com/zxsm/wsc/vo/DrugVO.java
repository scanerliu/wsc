package com.zxsm.wsc.vo;

import com.zxsm.wsc.entity.doctor.DjDrug;

public class DrugVO extends DjDrug {

	private String jsonstr;

	public String getJsonstr() {
		return jsonstr;
	}

	public void setJsonstr(String jsonstr) {
		this.jsonstr = jsonstr;
	}
	
	public static DrugVO convertDjDrugToDrugVO(DjDrug drug){
		DrugVO dvo = new DrugVO();
		if(null!=drug){
			dvo.setAbc(drug.getAbc());
			dvo.setAdministration(drug.getAdministration());
			dvo.setDosage(drug.getDosage());
			dvo.setDrug(drug.getDrug());
			dvo.setDrugNo(drug.getDrugNo());
			dvo.setPrice(drug.getPrice());
			dvo.setSpecification(drug.getSpecification());
			dvo.setStock(drug.getPrice());
		}
		return dvo;
	}
	
}
