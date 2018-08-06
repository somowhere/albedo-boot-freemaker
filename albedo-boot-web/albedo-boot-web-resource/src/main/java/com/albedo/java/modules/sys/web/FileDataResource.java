/**
 * Copyright &copy; 2018 <a href="https://github.com/somewhereMrli/albedo-boot">albedo-boot</a> All rights reserved.
 */
package com.albedo.java.modules.sys.web;

import com.albedo.java.common.security.SecurityUtil;
import com.albedo.java.modules.sys.service.FileDataService;
import com.albedo.java.util.JsonUtil;
import com.albedo.java.util.PublicUtil;
import com.albedo.java.util.StringUtil;
import com.albedo.java.util.domain.Globals;
import com.albedo.java.util.domain.PageModel;
import com.albedo.java.util.exception.RuntimeMsgException;
import com.albedo.java.vo.sys.FileDataVo;
import com.albedo.java.web.rest.ResultBuilder;
import com.albedo.java.web.rest.base.DataVoResource;
import com.alibaba.fastjson.JSON;
import com.codahale.metrics.annotation.Timed;
import com.google.common.collect.Lists;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * 文件管理Controller 文件
 * @author admin
 * @version 2018-08-06
 */
@Controller
@RequestMapping(value = "${albedo.adminPath}/sys/fileData")
public class FileDataResource extends DataVoResource<FileDataService, FileDataVo> {

   public FileDataResource(FileDataService fileDataService) {
        super(fileDataService);
    }
	@GetMapping(value = "/")
	@Timed
	public String list() {
		return "modules/sys/fileDataList";
	}

	/**
	 * GET / : get all fileData.
	 *
	 * @param pm
	 *            the pagination information
	 * @return the ResponseEntity with status 200 (OK) and with body all fileData
	 */
	@GetMapping(value = "/page")
	@Timed
	public ResponseEntity getPage(PageModel pm) {
	    service.findPage(pm, SecurityUtil.dataScopeFilter());
		JSON json = JsonUtil.getInstance().setRecurrenceStr().toJsonObject(pm);
		return ResultBuilder.buildObject(json);
	}

	@GetMapping(value = "/edit")
	@Timed
	public String form(FileDataVo fileDataVo) {
		if(fileDataVo == null){
			throw new RuntimeMsgException(PublicUtil.toAppendStr("查询文件失败，原因：无法查找到编号为[", request().getParameter("id"), "]的文件"));
		}
		return "modules/sys/fileDataForm";
	}

	/**
	 * POST / : Save a fileDataVo.
	 *
	 * @param fileDataVo the HTTP fileData
	 */
	@PostMapping(value = "/edit", produces = MediaType.APPLICATION_JSON_VALUE)
	@Timed
	public ResponseEntity save(@Valid @RequestBody FileDataVo fileDataVo) {
		log.debug("REST request to save FileDataForm : {}", fileDataVo);
        service.checkProperty(fileDataVo);
		service.save(fileDataVo);
		return ResultBuilder.buildOk("保存文件成功");

	}

	/**
	 * DELETE //:id : delete the "id" FileData.
	 *
	 * @param ids the id of the fileData to delete
	 * @return the ResponseEntity with status 200 (OK)
	 */
	@PostMapping(value = "/delete/{ids:" + Globals.LOGIN_REGEX
			+ "}", produces = MediaType.APPLICATION_JSON_VALUE)
	@Timed
	public ResponseEntity delete(@PathVariable String ids) {
		log.debug("REST request to delete FileData: {}", ids);
		service.deleteBatchIds(Lists.newArrayList(ids.split(StringUtil.SPLIT_DEFAULT)));
		return ResultBuilder.buildOk("删除文件成功");
	}
	/**
	 * lock //:id : lockOrUnLock the "id" FileData.
	 *
	 * @param ids the id of the fileData to lock
	 * @return the ResponseEntity with status 200 (OK)
	 */
	@PostMapping(value = "/lock/{ids:" + Globals.LOGIN_REGEX
			+ "}", produces = MediaType.APPLICATION_JSON_VALUE)
	@Timed
	public ResponseEntity lockOrUnLock(@PathVariable String ids) {
		log.debug("REST request to lockOrUnLock FileData: {}", ids);
		service.lockOrUnLock(Lists.newArrayList(ids.split(StringUtil.SPLIT_DEFAULT)));
		return ResultBuilder.buildOk("操作文件成功");
	}

}
