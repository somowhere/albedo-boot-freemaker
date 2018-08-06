<div class="row">
    <div class="col-md-12">
        <!-- BEGIN EXAMPLE TABLE PORTLET-->
        <div class="portlet light bordered">
            <div class="portlet-title">
                <div class="caption font-blue">
                    <i class="fa fa-globe font-blue"></i>数据列表
                </div>
                <div class="actions">
                    <div class="btn-group">
                        <#if SecurityUtil.hasPermission('sys_fileData_edit')><a class="btn red dialog" href="javascript:void(0);"
                        data-url="${ctx}/sys/fileData/edit" data-is-modal="" data-modal-width="950" data-table-id="#data-table-fileData">
                            <i class="fa fa-plus"> 添加文件</i>
                        </a></#if>
                    </div>
                </div>
            </div>
            <div class="portlet-body">
            	<form class="form-inline form-search" id="form-search-fileData">
						<div class="form-group">
					        <label class="input-label" for="name">名称</label>
							<input type="text" class="form-control" searchItem="searchItem" id="name" name="name" value="${(fileData.name)!}" attrType="String" operate="like" htmlEscape="false" maxlength="32" />
						</div>
                         <div class="form-group form-btn">
                         <button class="btn btn-sm green btn-outline filter-submit-table-fileData margin-bottom" type="button"><i class="fa fa-search"></i> 查询</button>
                         <button class="btn btn-sm red btn-outline filter-cancel" type="reset"><i class="fa fa-times"></i> 重置</button>
                         </div>
                     </form>
                     <hr />
              		<div id="bootstrap-alerts"></div>
                    <table class="table table-striped table-bordered table-hover dataTable no-footer dt-responsive" id="data-table-fileData">
                        <thead>
                        <tr role="row" class="heading">
                        	<th class="all"> 名称 </th>
                        	<th class=""> 路径 </th>
                        	<th class=""> 大小 </th>
                        	<th class=""> 类型 </th>
                        <#if SecurityUtil.hasPermission('sys_fileData_edit,sys_fileData_delete,sys_fileData_lock')><th width="10%"> 操作 </th></#if>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
              </div>
        </div>
        <!-- END EXAMPLE TABLE PORTLET-->
    </div>
</div>
<!-- END PAGE BASE CONTENT -->
<script type="text/javascript">
    var dataFileDataTables = function () {
        var initTradeOrderTable = function () {
            var grid = new Datatable();
            grid.init({
                src: $("#data-table-fileData"),
                dataTable: {
                    "ajax": {
                        "url": "${ctx}/sys/fileData/page",
                        type: 'GET',
                        "dataType": 'json'
                    },
                    "columns": [
					{data:'name'
					, render: function(data, type, row){
						<#if SecurityUtil.hasPermission('sys_fileData_edit')>data = '<a href="javascript:void(0);" class="dialog" data-table-id="#data-table-fileData" data-is-modal="" data-url="${ctx}/sys/fileData/edit?id='+row.id+'" title=\"点击编辑文件\">'+data+'</a>'</#if>
						return data;
					}}
					, {data:'path'
					}
					, {data:'size'
					}
					, {data:'type'
					}
					<#if SecurityUtil.hasPermission('sys_fileData_edit,sys_fileData_delete,sys_fileData_lock')>, 
                       { orderable: false, data: function ( row, type, val, meta ) {
                        	var data = '<span class="operation">'<#if SecurityUtil.hasPermission('sys_fileData_edit')>+'<a href="javascript:void(0);" class="dialog" data-table-id="#data-table-fileData" data-is-modal="" data-modal-width="950" data-url="${ctx}/sys/fileData/edit?id='+row.id+'"><i class=\"fa fa-lg fa-pencil\" title=\"编辑文件\"></i></a>'</#if>
                    		<#if SecurityUtil.hasPermission('sys_fileData_lock')>+'<a href="javascript:void(0);" class="confirm" data-table-id="#data-table-fileData" data-title="你确认要操作选中的文件吗？" data-url="${ctx}/sys/fileData/lock/'+row.id+'"><i class=\"fa fa-lg fa-'+(row.status=="正常" ? "unlock" : "lock") +'  font-yellow-gold\" title=\"'+(row.status=="正常" ? "锁定" : "解锁") +'文件\"></i></a></span>'</#if>
                    		<#if SecurityUtil.hasPermission('sys_fileData_delete')>+'<a href="javascript:void(0);" class="confirm" data-table-id="#data-table-fileData" data-method="post" data-title="你确认要删除选中的文件吗？" data-url="${ctx}/sys/fileData/delete/'+row.id+'"><i class=\"fa fa-lg fa-trash-o font-red-mint\" title=\"删除\"></i></a></span>'</#if>+'<\span>';
                        	return data;
                        }
                        }</#if>
                    ]
                }
            });
            $(".filter-submit-table-fileData").click(function(){
            	grid.submitFilter();
            })
        };
        return {
            init: function () {
                if (!jQuery().dataTable) {
                    return;
                }
                initTradeOrderTable();
            }
        };
    }();
    jQuery(document).ready(function() {
        dataFileDataTables.init();
    });
</script>