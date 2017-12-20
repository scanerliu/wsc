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
	
	public static final String sPreNo = "preNo";
	public static final String sStartDate = "startDate";
	public static final String sEndDate = "endDate";
	public static final String sPreDate = "preDate";
	public static final String sPatName = "patName";
	public static final String sStatus = "status";
	public static final String sPassStatus = "passStatus";
	public static final String sType = "type";
	public static final String sStore = "store";
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	// 处方单号
	@Column(length = 100)
	private String preNo;
	
	// 科别
	@Column(length = 50)
	private String cat;
	
	// 床号
	@Column(length = 100)
	private String bedNo;
	
	// 门诊号
	@Column(length = 100)
	private String outpatientNo;
	
	// 日期
	@Column
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date preDate;
	
	// 姓名
	@Column(length = 20)
	private String patName;
	
	// 性别
	@Column(length = 6)
	private String sex;
	
	// 年龄
	@Column(length = 6)
	private String age;
	
	// 体重
	@Column(length = 10)
	private String weight;
	
	// 过敏源
	@Column(length = 50)
	private String allergy;
	
	// 初步诊断
	@Column(length = 200)
	private String diagnosis;
	
	// 医师Id
	@Column
	private Long docId;
	
	// 医师姓名
	@Column(length = 20)
	private String docName;
	
	// 医师签名
	@Column(length = 200)
	private String docImg;
	
	// 药师id
	@Column
	private Long phaId;
	
	// 药师名字
	@Column(length = 20)
	private String phaName;
	
	// 药师签名
	@Column(length = 200)
	private String phaImg;
	
	// 配药人员
	@Column(length = 10)
	private String pharmacist;
	
	// 核对发药
	@Column(length = 10)
	private String checker;
	
	// 门店
	@Column(length = 40)
	private String store;
	
	// 门店id
	@Column
	private Long storeId;
	
	// 药品列表
    @OneToMany(fetch=FetchType.EAGER,cascade=CascadeType.ALL,orphanRemoval=true)
    @JoinColumn(name="drugId")
    private List<DjDrug> drugs;
    
    // 处方状态 0:未审核 1:已审核
    @Column
    private Integer status;
    
    // 处方通过状态 0:未通过 2: 已通过
    @Column
    private Integer passStatus;
    
    // 备注
    @Column(length = 250)
    private String mark;
    
    // 审核单的照片
    @Column(length = 100)
    private String imgUrl;
    
    // 处方单类型 0:处方单 1:处方单审核单
    @Column
    private Integer type;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPreNo() {
		return preNo;
	}

	public void setPreNo(String preNo) {
		this.preNo = preNo;
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

	public Date getPreDate() {
		return preDate;
	}

	public void setPreDate(Date preDate) {
		this.preDate = preDate;
	}

	public String getPatName() {
		return patName;
	}

	public void setPatName(String patName) {
		this.patName = patName;
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

	public String getDocName() {
		return docName;
	}

	public void setDocName(String docName) {
		this.docName = docName;
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

	public String getPhaName() {
		return phaName;
	}

	public void setPhaName(String phaName) {
		this.phaName = phaName;
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

	public String getChecker() {
		return checker;
	}

	public void setChecker(String checker) {
		this.checker = checker;
	}

	public String getStore() {
		return store;
	}

	public void setStore(String store) {
		this.store = store;
	}

	public Long getStoreId() {
		return storeId;
	}

	public void setStoreId(Long storeId) {
		this.storeId = storeId;
	}

	public List<DjDrug> getDrugs() {
		return drugs;
	}

	public void setDrugs(List<DjDrug> drugs) {
		this.drugs = drugs;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getPassStatus() {
		return passStatus;
	}

	public void setPassStatus(Integer passStatus) {
		this.passStatus = passStatus;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
    
}
