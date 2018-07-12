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
                    <#if SecurityUtil.hasPermission('sys_user_edit')><a id="add-user" class="btn red dialog"
                                                                        href="javascript:void(0);"
                                                                        data-url="${ctx}/sys/user/edit"
                                                                        data-modal-width="950" data-is-modal=""
                                                                        data-table-id="#data-table-user">
                        <i class="fa fa-plus"> 添加用户</i>
                    </a></#if>
                    </div>
                </div>
            </div>
            <div class="portlet-body">
                <form class="form-inline form-search" role="form">
                    <div class="form-group">
                        <label class="input-label" for="loginId">登录Id </label>
                        <input type="text" class="form-control" searchItem="searchItem" id="loginId" name="loginId"
                               realName="a.login_id"
                               placeholder="..." /></div>
                    <div class="form-group">
                        <label class="input-label" for="email">邮箱</label>
                        <input type="text" class="form-control" searchItem="searchItem" id="email" name="email"
                               realName="a.email_"
                               placeholder="..." />
                    </div>
                    <div class="form-group">
                        <label class="input-label">状态</label>
                    <@albedo.form name="status_" analytiColumn="false" searchItem="searchItem" dictCode="sys_status" boxType="checkbox" operate="in" attrType="Integer"> </@albedo.form>
                    </div>
                    <div class="form-group form-btn">
                        <button class="btn btn-sm green btn-outline filter-submit-table-user margin-bottom"
                                type="button"><i class="fa fa-search"></i> 查询
                        </button>
                        <button id="dialogUserUpload" class="btn green btn-outline btn-sm" type="button"> 批量上传</button>
                        <button id="downloadUserTemplate" class="btn green btn-outline btn-sm" type="button"> 模板下载</button>
                        <button class="btn btn-sm red btn-outline filter-cancel" type="reset"><i
                                class="fa fa-times"></i> 重置
                        </button>
                    </div>
                </form>
                <hr/>
                <div id="bootstrap-alerts"></div>
                <table class="table table-striped table-bordered table-hover dataTable no-footer dt-responsive"
                       id="data-table-user">
                    <thead>
                    <tr role="row" class="heading">
                        <th width="10%" colspan="1"> 所属组织</th>
                        <th width="10%" colspan="1"> 登录Id</th>
                        <th width="10%" colspan="1"> 姓名</th>
                        <th width="10%"> 手机</th>
                        <th width="10%"> 邮箱</th>
                        <th width="20%"> 角色</th>
                        <th width="10%"> 状态</th>
                        <th width="10%"> 修改时间</th>
                        <th width="10%"> 操作</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
        <!-- END EXAMPLE TABLE PORTLET-->
        <div id="user-dialog-modal" class="modal fade confirm-modal modal-confirm-dialog" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">批量上传</h4>
            </div>
            <div class="modal-body">
                <div id="bootstrap-alerts"></div>
                <form id="user-form-update" class="form-horizontal" >
                    <div class="form-group">
                        <label class="control-label col-md-2">文件</label>
                        <div class="col-md-10">
                            <div class="col-md-8">
                            <#--<input id="dataFile" name="dataFile" type="file" class="required" />-->
                                <@albedo.fileInput name="dataFile" cssClass="required" type="files" options="{
                                autoUpload: false,
                                singleFileUploads: true,
                                url: '${ctx}/sys/user/uploadData',
                                add: fileuploadAdd
                                }"> </@albedo.fileInput>
                            <#--<@albedo.fileInput name="dataFile1" cssClass="required" type="files" options="{-->
                            <#--}"> </@albedo.fileInput>-->
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn dark btn-outline" data-dismiss="modal" aria-hidden="true">关闭</button>
                <button id="btn-confirm-user-upload" class="btn green">确认</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var dataUserTables = function () {
        var initTradeOrderTable = function () {
            var gridUser = new Datatable();
            gridUser.init({
                src: $("#data-table-user"),
                dataTable: {
                    ajax: {
                        url: "${ctx}/sys/user/page"
                    },
                    "columns": [
                        {data: "orgName"}, {data: "loginId"},
                        {data: "name"},
                        {data: "phone"},
                        {data: "email"},
                        {data: "roleNames", orderable: false},
                        {data: "status", render: function (data, type, row) {
                            var cssClass = (data == "正常" ? "info" : "warning");
                            return '<span class="label label-sm label-' + cssClass + '">' + data + '</span>';
                        }
                        }, {data: "lastModifiedDate"},
                        {
                            orderable: false, data: function (row, type, val, meta) {
                            var data = '<span class="operation">'<#if SecurityUtil.hasPermission('sys_user_edit')>+ '<a href="javascript:void(0);" class="dialog" data-table-id="#data-table-user" data-url="${ctx}/sys/user/edit?id='+ row.id+ '" data-modal-width="950"><i class=\"fa fa-lg fa-pencil\" title=\"编辑用户\"></i></a>'</#if>
                                    <#if SecurityUtil.hasPermission('sys_user_lock')>+ '<a href="javascript:void(0);" class="confirm" data-table-id="#data-table-user" data-title="你确认要操作【'+ row.loginId+ '】用户吗？" data-url="${ctx}/sys/user/lock/'+ row.id+ '"><i class=\"fa fa-lg fa-'+ (row.status == "正常" ? "unlock" : "lock") + '  font-yellow-gold\" title=\"'+ (row.status == "正常" ? "锁定" : "解锁") + '用户\"></i></a></span>'</#if>
                                    <#if SecurityUtil.hasPermission('sys_user_delete')>+ '<a href="javascript:void(0);" class="confirm" data-table-id="#data-table-user" data-method="post" data-title="你确认要删除【'+ row.loginId+ '】用户吗？" data-url="${ctx}/sys/user/delete/'+ row.id+ '"><i class=\"fa fa-lg fa-trash-o font-red-mint\" title=\"删除\"></i></a>'</#if> + '</span>';
                            return data;
                        }
                        }
                    ]
                }
            });
            $(".filter-submit-table-user").click(function () {
                gridUser.submitFilter();
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

    function fileuploadAdd(e, data) {
        $("input[name='dataFile']").val(data.files[0].name);
        console.log($('#btn-confirm-user-upload'))
        //绑定开始上传事件
        $('#btn-confirm-user-upload').click(function() {
            if(FormValidation.validate()){
                jqXHR = data.submit()
                    .success(function (data, textStatus, jqXHR) {
                        if(data && data.status==1) {
                            toastr.success(data.message)
                            $("#user-dialog-modal").modal("hide");
                            $("input[name='dataFile']").val("");
                            $(".filter-submit-table-user").trigger("click")
                            //解绑，防止重复执行
                            $("#btn-confirm-user-upload").off("click");
                        }else{
                            toastr.warning(data.message);
                        }
                    });
            }
        })
    }
    jQuery(document).ready(function () {
        dataUserTables.init();
        $("#downloadUserTemplate").click(function(){
            albedo.goTo("${ctx}/sys/user/importTemplate")
        })
        $("#dialogUserUpload").click(function(){
            $("input[name='dataFile']").val("");
            $("#user-dialog-modal").modal({width:740});
            FormValidation.init($("#user-form-update"));
        });
    });
</script>
