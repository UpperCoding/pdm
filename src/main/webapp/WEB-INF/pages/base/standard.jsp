<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>收派标准</title>
<!-- 导入jquery核心类库 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<!-- 导入easyui类库 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/ext/portal.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/default.css">	
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/ext/jquery.portal.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/ext/jquery.cookie.js"></script>
<script
	src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"
	type="text/javascript"></script>
<script type="text/javascript">
	function doAdd(){
		//alert("增加...");
		$('#name').val('');
		$('#minweight').numberbox('setValue', null);
		$('#maxweight').numberbox('setValue', null);
		$('#id').val('');
		
		$('#addStandardWindow').window("open");
	}
	
	function doView(){
		alert("查看...");
	}
	
	function doDelete(){
		var array = $('#grid').datagrid('getSelections');
		if(array.length == 0) {
			//一行也没选中
			$.messager.alert('警告','请选中要删除的数据!','warning');
			return ;
		}
		$.messager.confirm('消息','确认要删除吗？',function(r){
			if(r) {
				//提交删除form
				$('#delForm').submit();
			}
		});
	}
	//工具栏
	var toolbar = [ {
		id : 'button-view',	
		text : '查询',
		iconCls : 'icon-search',
		handler : doView
	}, {
		id : 'button-add',
		text : '增加',
		iconCls : 'icon-add',
		handler : doAdd
	}, {
		id : 'button-delete',
		text : '删除',
		iconCls : 'icon-cancel',
		handler : doDelete
	}];
	// 定义列
	var columns = [ [ {
		field : 'id',
		checkbox : true,
	},{
		field : 'name',
		title : '标准名称',
		width : 120,
		align : 'center'
	}, {
		field : 'minweight',
		title : '最小重量',
		width : 120,
		align : 'center'
	}, {
		field : 'maxweight',
		title : '最大重量',
		width : 120,
		align : 'center'
	}, {
		field : 'user.username',
		title : '操作人',
		width : 120,
		align : 'center',
		formatter : function(value,rowData, rowIndex){
			//value表示匹配当前属性的值
			//rowData代表正行数据
			//rowIndex 代表行号
			if(rowData.user!=null) {
				return rowData.user.username;
			}
		}
		
	}, {
		field : 'updatetime',
		title : '操作时间',
		width : 160,
		align : 'center',
		formatter : function(value,rowData, rowIndex){
			return value.replace("T"," ");
		}
	}, {
		field : 'user.station',
		title : '操作单位',
		width : 200,
		align : 'center',
		formatter : function(value,rowData, rowIndex){
			//value表示匹配当前属性的值
			//rowData代表正行数据
			//rowIndex 代表行号
			if(rowData.user!=null) {
				return rowData.user.station;
			}
		}
	} ] ];
	
	$(function(){
		// 先将body隐藏，再显示，不会出现页面刷新效果
		$("body").css({visibility:"visible"});
		
		// 收派标准数据表格
		$('#grid').datagrid( {
			iconCls : 'icon-forward',
			fit : true,
			border : false,
			rownumbers : true,
			striped : true,
			pageList: [3,5,10],
			pagination : true,
			toolbar : toolbar,
			url : "${pageContext.request.contextPath }/standard_pageQuery.action",
			idField : 'id',
			columns : columns,
			onDblClickRow : doDblClickRow
		});
		
		// 添加收派标准窗口
		$('#addStandardWindow').window({
            title: '添加收派标准',
            width: 400,
            modal: true,
            shadow: true,
            closed: true,
            height: 400,
            resizable:false
        });
		
	});
	
	//修改数据
	function doDblClickRow(rowIndex, rowData){
		//form回显
		$('#name').val(rowData.name);
		$('#minweight').numberbox('setValue', rowData.minweight);
		$('#maxweight').numberbox('setValue', rowData.maxweight);
		$('#id').val(rowData.id);
		
		//弹出修改窗口
		$("#addStandardWindow").window('open');
	}
	
	function commitStandardForm(){
		// 校验表单
		if($('#standardForm').form('validate')) {
			$('#standardForm').submit();
		} else {
			$.messager.alert('警告', '表单存在非法数据，请重新输入！', 'warning');
		}
	}
	
		
</script>	
</head>
<body class="easyui-layout" style="visibility:hidden;">
	<form  id="delForm" action="${pageContext.request.contextPath }/standard_delBatch.action" method="post">
	    <div region="center" border="false">
	    	<table id="grid"></table>
		</div>
	</form>
	
	<div class="easyui-window" id="addStandardWindow" collapsible="false" minimizable="false" maximizable="false" style="top:100px;left:200px">
		<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="save" icon="icon-save" href="javascript:commitStandardForm();" class="easyui-linkbutton" plain="true" >保存</a>
			</div>
		</div>
		<div region="center" style="overflow:auto;padding:5px;" border="false">
			<form id="standardForm" action="${pageContext.request.contextPath }/standard_save.action" method="post">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">收派标准信息
						<input type="hidden" id="id" name="id"/>
						</td>
					</tr>
					<tr>
						<td>标准名称</td>
						<td><input type="text" id="name" name="name" class="easyui-validatebox" data-options="required:true" /></td>
					</tr>
					<tr>
						<td>最小重量</td>
						<td><input type="text" id="minweight" name="minweight" class="easyui-numberbox"  /></td>
					</tr>
					<tr>
						<td>最大重量</td>
						<td><input type="text" id="maxweight" name="maxweight" class="easyui-numberbox" /></td>
					</tr>
					</table>
			</form>
		</div>
	</div>
</body>
</html>