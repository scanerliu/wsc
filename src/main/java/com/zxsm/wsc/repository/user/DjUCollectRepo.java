package com.zxsm.wsc.repository.user;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.zxsm.wsc.entity.user.DjUCollect;

/**
 * DjUCollect 实体数据库操作接口
 * 
 * @author maeing
 *
 */

public interface DjUCollectRepo extends PagingAndSortingRepository<DjUCollect, Long>, JpaSpecificationExecutor<DjUCollect> 
{ 
	Integer countByUid(Long uid);
	
	DjUCollect findFirstByUidAndGid(Long userId, Long gid);
	
	@Query("SELECT c.gid FROM DjUCollect c WHERE c.uid=?1")
	List<Long> findGidByUid(Long uid, Sort sort);
}
