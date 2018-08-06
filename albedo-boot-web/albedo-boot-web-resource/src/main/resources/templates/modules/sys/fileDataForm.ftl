<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption font-blue">
            <i class="fa fa-globe font-blue"></i><#if fileDataVo.id??>编辑<#else>添加</#if>文件
        </div>
		<div class="actions">
			<div class="btn-group">
                <a id="fileData_list" class="btn red list" href="javascript:void(0);" data-table-id="#data-table-fileData">
                    <i class="fa fa-list"> 文件列表</i>
                </a>
            </div>
		</div>
	</div>
	<div class="portlet-body form form-no-modal">
		<!-- BEGIN FORM-->
		<div id="bootstrap-alerts"></div>
		<form id="ajax-form-fileData" action="${ctx}/sys/fileData/edit" method="post"
			class="form-horizontal form-validation form-bordered form-label-stripped"
			config="{rules:{
						},
                       messages:{
					   }}}">
			<div class="form-body">
				<input type="hidden" name="id" value="${(fileDataVo.id)!}" />
				<div class="form-group">
					<label class="control-label col-md-3">名称</label>
					<div class="col-md-5">
						<input type="text" name="name" id="name" class="form-control" value="${(fileDataVo.name)!}" htmlEscape="false" maxlength="32" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-3">路径</label>
					<div class="col-md-5">
						<@albedo.fileInput name="path" value="${(fileDataVo.path)!}" cssClass="" type="files"> </@albedo.fileInput>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-3">大小<span class="required">*</span></label>
					<div class="col-md-5">
						<input type="text" name="size" id="size" class="form-control required" value="${(fileDataVo.size)!}" htmlEscape="false" maxlength="50" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-3">类型</label>
					<div class="col-md-5">
						<input type="text" name="type" id="type" class="form-control" value="${(fileDataVo.type)!}" htmlEscape="false" maxlength="60" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-3">description_</label>
					<div class="col-md-5">
						<textarea name="description" rows="5" maxlength="255" class="form-control input-xxlarge ">${(fileDataVo.description)! }</textarea>
					</div>
				</div>
				<div class="form-actions">
                   <div class="row">
                       <div class="col-md-offset-3 col-md-9">
                           <button type="button" class="btn add green">
                               <i class="fa fa-check"></i> 保存</button>
                           <button type="reset" class="btn default">重置</button>
                           <button type="button" class="btn list" data-table-id="#data-table-fileData">返回</button>
                       </div>
                   </div>
               </div>
			</div>
		</form>
	</div>
</div>
