package com.zxsm.wsc.service.employe;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zxsm.wsc.common.tencent.common.TdWXPay;
import com.zxsm.wsc.entity.doctor.DjDrug;
import com.zxsm.wsc.entity.user.DjUser;
import com.zxsm.wsc.search.DrugCriteria;
import com.zxsm.wsc.vo.DeptVO;

@Service
@Transactional
public class ECommonService {
	
	private final static String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";   
	private final static String dbURL = "jdbc:sqlserver://183.230.173.25; DatabaseName=zsmxnyc";   
	private final static String userName = "sa"; //默认用户名  
	private final static String userPwd = "zhenshanmei"; //安装sql server 2005时的密码  
	private  static ResultSet rs=null;    //声明数据库结果集      
	private  static PreparedStatement pstmt=null; //声明数据库操作  
	public static volatile Connection conn;
	
	public static Connection connectSqlServer()
	{
		if(conn == null)
		{
			synchronized (Connection.class)
			{
				if(conn == null)
				{
					try {
						Class.forName(driverName);
					} catch (ClassNotFoundException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					try {
						conn = DriverManager.getConnection(dbURL,userName,userPwd);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
		return conn;
	}
	
	
	/**
	 * 传输会员
	 * @param user
	 * @return
	 */
	public Boolean insertUser(DjUser user)
	{
		String sql = "INSERT INTO 微信会员 (记录号,姓名,性别,出生日期,移动电话) values (" +
					 user.getId() + ", " + "'微信会员' ," + user.getSex() +", "+user.getBirthday() + ", '" + user.getUsername() + "'" +
					 ");";
		System.out.println(sql);
		Connection sqlServer = connectSqlServer();
		ResultSet rs=null;    //声明数据库结果集      
		PreparedStatement pstmt=null; //声明数据库操作  
		try {
			pstmt = sqlServer.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}
	/**
	 * 查询药品信息
	 * @param user
	 * @return
	 */
	public List<DjDrug> selectDrugByDrug(DrugCriteria dc)
	{
		List<DjDrug> list = new ArrayList<DjDrug>();
		String sql = "select top 20 货号,sum(库存数量) as stock,品名,规格,abc类别,销售价 from v门店批次库存库 where 部门='" + dc.getDept() + "' and 品名 like '%" + dc.getKeyword() + "%' group by 货号,品名,规格,abc类别,销售价  order by abc类别";
		System.out.println(sql);
		Connection sqlServer = connectSqlServer();
		ResultSet rs=null;    //声明数据库结果集      
		PreparedStatement pstmt=null; //声明数据库操作  
		try {
			pstmt = sqlServer.prepareStatement(sql);
			rs=pstmt.executeQuery();  //执行查询操作  
			ResultSetMetaData metaData = rs.getMetaData();
			int columnCount = metaData.getColumnCount();
			int columnCount_tem = 1;
			while(columnCount_tem <= columnCount)
			{
				System.out.print(metaData.getColumnName(columnCount_tem++) + "		");
			}
			System.out.println("\n");
			while(rs.next()){
				/*int row = rs.getRow();
				StringBuffer LogStr = new StringBuffer();
				columnCount_tem = 1;
				while(columnCount_tem <= columnCount)
				{
					String Result_str = rs.getString(columnCount_tem++);
					LogStr.append(Result_str+"		");
				}
				System.out.println(LogStr);  */
				DjDrug drug = new DjDrug();
				drug.setDrugNo(rs.getString(1));
				drug.setStock(rs.getString(2));
				drug.setDrug(rs.getString(3));
				drug.setSpecification(rs.getString(4));
				drug.setAbc(rs.getString(5));
				drug.setPrice(rs.getString(6));
				list.add(drug);
			}  
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return list;
		}
		return list;
	}


	public List<DeptVO> selectDeptAll() {
		List<DeptVO> list = new ArrayList<DeptVO>();
		String sql = "select 简称 from 客户清单2 where 1=1";
		System.out.println(sql);
		Connection sqlServer = connectSqlServer();
		ResultSet rs=null;    //声明数据库结果集      
		PreparedStatement pstmt=null; //声明数据库操作  
		try {
			pstmt = sqlServer.prepareStatement(sql);
			rs=pstmt.executeQuery();  //执行查询操作  
			ResultSetMetaData metaData = rs.getMetaData();
			int columnCount = metaData.getColumnCount();
			int columnCount_tem = 1;
			while(columnCount_tem <= columnCount)
			{
				System.out.print(metaData.getColumnName(columnCount_tem++) + "		");
			}
			System.out.println("\n");
			while(rs.next()){
				/*int row = rs.getRow();
				StringBuffer LogStr = new StringBuffer();
				columnCount_tem = 1;
				while(columnCount_tem <= columnCount)
				{
					String Result_str = rs.getString(columnCount_tem++);
					DeptVO dept = new DeptVO();
					dept.setKeyname(Result_str);
					list.add(dept);
					LogStr.append(Result_str+"		");
				}
				System.out.println(LogStr);*/  
				String Result_str = rs.getString(1);
				DeptVO dept = new DeptVO();
				dept.setKeyname(Result_str);
				list.add(dept);
			}  
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return list;
		}
		return list;
	}
}
