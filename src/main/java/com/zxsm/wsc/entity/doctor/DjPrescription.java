package com.zxsm.wsc.entity.doctor;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

import org.springframework.format.annotation.DateTimeFormat;

import com.zxsm.wsc.entity.common.DjBaseEntity;

/**
 * 处方单
 * @author maeing
 *
 */
@Entity
public class DjPrescription extends DjBaseEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	// 处方单号
	@Column
	private String no;
	
	// 科别
	@Column
	private String cat;
	
	// 床号
	@Column
	private String bedNo;
	
	// 门诊号
	@Column
	private String outpatientNo;
	
	// 日期
	@Column
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date Date;
	
	// 姓名
	@Column
	private String name;
	
	// 性别
	@Column
	private String sex;
	
	// 年龄
	@Column
	private String age;
	
	// 体重
	@Column
	private String weight;
	
	// 过敏源
	@Column
	private String allergy;
	
	// 初步诊断
	@Column
	private String diagnosis;
	
	// 医师Id
	@Column
	private Long docId;
	
	// 医师签名
	@Column
	private String docImg;
	
	// 药师id
	@Column
	private Long phaId;
	
	// 药师签名
	@Column
	private String phaImg;
	
	// 配药人员
	@Column
	private String pharmacist;
	
	// 核对发药
	@Column
	private String check;
	
	// 门店
	@Column
	private String store;
	
	// 药品列表
    @OneToMany(fetch=FetchType.EAGER,cascade=CascadeType.ALL,orphanRemoval=true)
    @JoinColumn(name="drugId")
    private List<DjDrug> drugs;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getCat() {
		return cat;
	}

	public void setCat(String cat) {
		this.cat = cat;
	}

	public String getBedNo() {
		return bedNo;
	}

	public void setBedNo(String bedNo) {
		this.bedNo = bedNo;
	}

	public String getOutpatientNo() {
		return outpatientNo;
	}

	public void setOutpatientNo(String outpatientNo) {
		this.outpatientNo = outpatientNo;
	}

	public Date getDate() {
		return Date;
	}

	public void setDate(Date date) {
		Date = date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getAllergy() {
		return allergy;
	}

	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}

	public String getDiagnosis() {
		return diagnosis;
	}

	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}

	public Long getDocId() {
		return docId;
	}

	public void setDocId(Long docId) {
		this.docId = docId;
	}

	public String getDocImg() {
		return docImg;
	}

	public void setDocImg(String docImg) {
		this.docImg = docImg;
	}

	public Long getPhaId() {
		return phaId;
	}

	public void setPhaId(Long phaId) {
		this.phaId = phaId;
	}

	public String getPhaImg() {
		return phaImg;
	}

	public void setPhaImg(String phaImg) {
		this.phaImg = phaImg;
	}

	public String getPharmacist() {
		return pharmacist;
	}

	public void setPharmacist(String pharmacist) {
		this.pharmacist = pharmacist;
	}

	public String getCheck() {
		return check;
	}

	public void setCheck(String check) {
		this.check = check;
	}

	public String getStore() {
		return store;
	}

	public void setStore(String store) {
		this.store = store;
	}

	public List<DjDrug> getDrugs() {
		return drugs;
	}

	public void setDrugs(List<DjDrug> drugs) {
		this.drugs = drugs;
	}
    
}
