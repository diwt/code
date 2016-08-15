<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>CRM机会列表</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/static/plugins/fontawesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="/static/plugins/ionicons-2.0.1/css/ionicons.min.css">

    <!-- Theme style -->
    <link rel="stylesheet" href="/static/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="/static/plugins/datatables/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="/static/dist/css/skins/skin-blue.min.css">
    <link rel="stylesheet" href="/static/plugins/rangepicker/daterangepicker.css">
</head>

<body class="hold-transition skin-blue  sidebar-mini">
<div class="wrapper">


    <%@include file="../include/header.jsp" %>
    <jsp:include page="../include/leftside.jsp">
        <jsp:param name="menu" value="sales"/>
    </jsp:include>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper" style="background-image: url(/static/dist/img/asanoha-400px.png)">
        <!-- Content Header (Page header) -->
        <section class="content">
            <div class="box box-default collapsed-box">
                <div>
                    <ol class="breadcrumb" style="background-color: transparent">
                        <li><a href="/home"><i class="fa fa-dashboard"></i>主页</a></li>
                        <li class="active">机会列表</li>
                    </ol>
                </div>
                <div class="box-header with-border">

                    <h3 class="box-title">搜索</h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"><i
                                class="fa fa-plus"></i></button>
                    </div>
                </div>
                <div class="box-body">
                    <form action="" class="form-inline">
                        <input type="hidden" id="search_start_time">
                        <input type="hidden" id="search_end_time">
                        <input type="text" id="search_name"  class="form-control" placeholder="机会名称">
                        <select id="search_progress" class="form-control">
                            <option value="">当前进度</option>
                            <option value="初次接触">初次接触</option>
                            <option value="确认意向">确认意向</option>
                            <option value="提供合同">提供合同</option>
                            <option value="完成交易">完成交易</option>
                            <option value="交易搁置">交易搁置</option>
                        </select>
                        <input type="text" id="rangepicker" class="form-control" placeholder="跟进时间">
                        <button type="button" id="search_Btn" class="btn btn-default"><i class="fa fa-search"></i> 搜索</button>
                    </form>
                </div>
            </div>
            <div class="box box-primary">

                <div class="box-header with-border">

                    <h3 class="box-title">机会列表</h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-success btn-xs" id="newBtn"><i class="fa fa-plus"></i> 新增机会</button>
                    </div>
                </div>
                <div class="box-body">
                    <table class="table"  id="dataTable">
                        <thead>
                        <tr>
                            <th>机会名称</th>
                            <th>关联客户</th>
                            <th>价值</th>
                            <th>当前进度</th>
                            <th>最后跟进时间</th>
                            <th>所属员工</th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>
        </section>

        <!-- Main content -->
        <section class="content">

            <!-- Your Page Content Here -->

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
</div>
<!-- ./wrapper -->
<div class="modal fade" id="newModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">新增机会</h4>
            </div>
            <div class="modal-body">
                <form id="newForm">
                    <div class="form-group">
                        <label>机会名称</label>
                        <input type="text" class="form-control" name="name">
                    </div>
                    <div class="form-group">
                        <label>价值</label>
                        <input type="text" class="form-control" name="price">
                    </div>
                    <div class="form-group">
                        <label>关联客户</label>
                        <select name="custid" class="form-control">
                            <c:forEach items="${customerList}" var="customer">
                                <option value="${customer.id}">${customer.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>当前进度</label>
                        <select name="progress" class="form-control">
                            <option value="初次接触">初次接触</option>
                            <option value="确认意向">确认意向</option>
                            <option value="提供合同">提供合同</option>
                            <option value="完成交易">完成交易</option>
                            <option value="交易搁置">交易搁置</option>
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="saveBtn">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- jQuery 2.2.3 -->
<script src="/static/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="/static/bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="/static/dist/js/app.min.js"></script>
<script src="/static/plugins/datatables/js/jquery.dataTables.min.js"></script>
<script src="/static/plugins/datatables/js/dataTables.bootstrap.min.js"></script>
<script src="/static/plugins/moment/moment.min.js"></script>
<script src="/static/plugins/rangepicker/daterangepicker.js"></script>
<script>
    $(function () {

        var dataTable = $("#dataTable").DataTable({
            searching:false,
            serverSide:true,
            ajax:{
                url:"/sales/load",
                data:function(dataSource){
                    dataSource.name = $("#search_name").val();
                    dataSource.progress = $("#search_progress").val();
                    dataSource.startdate = $("#search_start_time").val();
                    dataSource.enddate = $("#search_end_time").val();
                }
            },
            columns:[
                {"data":function(row){
                    return "<a href='/sales/"+row.id+"'>"+row.name+"</a>";
                }},
                {"data":function(row){
                    return "<a href='/customer/"+row.custid+"'>"+row.custname+"</a>";
                }},
                {"data":function(row){
                    return "￥" + row.price;
                }},
                {"data":function(row) {
                    if(row.progress == '交易完成') {
                        return "<span class='label label-success'>"+row.progress+"</span>";
                    }
                    if(row.progress == '交易搁置') {
                        return "<span class='label label-danger'>"+row.progress+"</span>";
                    }
                    return row.progress;
                }},
                {"data":"lasttime"},
                {"data":"username"}
            ],
            ordering:false,
            "autoWidth": false,
            "language": { //定义中文
                "search": "请输入书籍名称:",
                "zeroRecords": "没有匹配的数据",
                "lengthMenu": "显示 _MENU_ 条数据",
                "info": "显示从 _START_ 到 _END_ 条数据 共 _TOTAL_ 条数据",
                "infoFiltered": "(从 _MAX_ 条数据中过滤得来)",
                "loadingRecords": "加载中...",
                "processing": "处理中...",
                "paginate": {
                    "first": "首页",
                    "last": "末页",
                    "next": "下一页",
                    "previous": "上一页"
                }
            }
        });
        //搜索
        $("#search_Btn").click(function(){
            dataTable.ajax.reload();
        });
        //daterangepicker
        $("#rangepicker").daterangepicker({
            format: "YYYY-MM-DD",
            separator: "~",
            locale: {
                "applyLabel": "选择",
                "cancelLabel": "取消",
                "fromLabel": "从",
                "toLabel": "到",
                "customRangeLabel": "自定义",
                "weekLabel": "周",
                "daysOfWeek": [
                    "一",
                    "二",
                    "三",
                    "四",
                    "五",
                    "六",
                    "日"
                ],
                "monthNames": [
                    "一月",
                    "二月",
                    "三月",
                    "四月",
                    "五月",
                    "六月",
                    "七月",
                    "八月",
                    "九月",
                    "十月",
                    "十一月",
                    "十二月"
                ],
                "firstDay": 1
            },
            ranges: {
                '今天': [moment(), moment()],
                '昨天': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                '最近7天': [moment().subtract(6, 'days'), moment()],
                '最近30天': [moment().subtract(29, 'days'), moment()],
                '本月': [moment().startOf('month'), moment().endOf('month')],
                '上个月': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            }
        })
        ;
        $('#rangepicker').on('apply.daterangepicker', function (ev, picker) {
            $("#search_start_time").val(picker.startDate.format('YYYY-MM-DD'));
            $("#search_end_time").val(picker.endDate.format('YYYY-MM-DD'));
        });


        $("#newBtn").click(function () {

            $("#newModal").modal({
                show: true, backdrop: 'static'
            });

        });
    });
</script>
</body>
</html>
