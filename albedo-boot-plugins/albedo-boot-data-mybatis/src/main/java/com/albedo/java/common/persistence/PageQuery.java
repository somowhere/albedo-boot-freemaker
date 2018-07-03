package com.albedo.java.common.persistence;

import com.albedo.java.util.PublicUtil;
import com.baomidou.mybatisplus.plugins.Page;
import com.google.common.collect.Lists;
import org.apache.commons.lang.StringUtils;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.util.Iterator;
import java.util.Map;

/**
 * @author somewhere
 * @date 2018/03/08
 */
public class PageQuery<T> extends Page<T> {
    private static final String PAGE = "page";
    private static final String LIMIT = "limit";
    private static final String ORDER_BY_FIELD = "orderByField";
    private static final String IS_ASC = "isAsc";

    public PageQuery(Pageable pageable, Map<String, Object> params) {

        super(pageable.getPageNumber()
                , pageable.getPageSize());
        if(PublicUtil.isNotEmpty(params))
        this.setCondition(params);

        if (pageable.getSort()!=null) {
            Iterator<Sort.Order> iterator = pageable.getSort().iterator();
            while (iterator.hasNext()){
                Sort.Order order = iterator.next();
                if(order.getDirection().isAscending()){
                    if(this.getAscs() == null)this.setAscs(Lists.newArrayList());
                    this.getAscs().add(order.getProperty());
                }else if(order.getDirection().isDescending()){
                    if(this.getDescs() == null)this.setDescs(Lists.newArrayList());
                    this.getDescs().add(order.getProperty());
                }
            }
        }else{
            this.setAsc(false);
        }

    }
}
