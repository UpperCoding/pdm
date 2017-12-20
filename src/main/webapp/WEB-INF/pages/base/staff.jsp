<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
		$('#name').val('');
		$('#telephone').val('');
		$('#station').val('');
		$('#haspda').removeAttr("checked");
		$('#standardId').combobox('setValue', '');
		$('#id').val('');
		$('#id').removeAttr('readonly');
		$('#addStaffWindow').window("open");
	}
	
	function doView(){
		alert("查看...");
	}
	
	function doDelete(){
		//判断是否选中
		var array = $('#grid').datagrid('getSelections');
		if(array.length == 0) {
			$.messager.alert('警告','删除前必须选中！','warning');
		} else {
			$('#gridForm').submit();
			/* $('#gridForm').form('submit', {  
			    url:"${pageContext.request.contextPath}/staff_delBatch.action",  
			    success:function(data){  
			        alert(data)  
			    }  
			});  */
		}
	}
	
	function doRestore(){
		//判断是否选中
		var array = $('#grid').datagrid('getSelections');
		if(array.length == 0) {
			$.messager.alert('警告','恢复前必须选中！','warning');
		} else {
			$('#').submit('');
		}
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
		text : '作废',
		iconCls : 'icon-cancel',
		handler : doDelete
	},{
		id : 'button-save',
		text : '还原',
		iconCls : 'icon-save',
		handler : doRestore
	}];
	// 定义列
	var columns = [ [ {
		field : 'id',
		checkbox : true,
	},{
		field : 'name',
		title : '姓名',
		width : 120,
		align : 'center'
	}, {
		field : 'telephone',
		title : '手机号',
		width : 120,
		align : 'center'
	}, {
		field : 'haspda',
		title : '是否有PDA',
		width : 120,
		align : 'center',
		formatter : function(data,row, index){
			if(data=="1"){
				return "有";
			}else{
				return "无";
			}
		}
	}, {
		field : 'deltag',
		title : '是否作废',
		width : 120,
		align : 'center',
		formatter : function(data,row, index){
			if(data=="0"){
				return "正常使用"
			}else{
				return "已作废";
			}
		}
	}, {
		field : 'standard',
		title : '取派标准',
		width : 120,
		align : 'center',
		formatter : function(data,row, index){
			return data.name;
		}
	}, {
		field : 'station',
		title : '所谓单位',
		width : 200,
		align : 'center'
	} ] ];
	
	$(function(){
		// 先将body隐藏，再显示，不会出现页面刷新效果
		$("body").css({visibility:"visible"});
		
		// 取派员信息表格
		$('#grid').datagrid( {
			iconCls : 'icon-forward',
			fit : true,
			border : false,
			rownumbers : true,
			striped : true,
			pageList: [3,5,10],
			pagination : true,
			toolbar : toolbar,
			url : "${pageContext.request.contextPath}/staff_pageQuery.action",
			idField : 'id',
			columns : columns,
			onDblClickRow : doDblClickRow
		});
		
		// 添加取派员窗口
		$('#addStaffWindow').window({
	        title: '添加取派员',
	        width: 400,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 400,
	        resizable:false
	    });
		
		/* // 页面加载后，发起ajax请求
		$.post("${pageContext.request.contextPath}/standard_ajaxlist.action",function(data){
			for(var i=0; i < data.length;i++) {
				
			}
			$(data).each(function(){
				var option =$("<option value='"+this.id+"'>"+this.name+"</option>");
				$("#standardList").append(option);
				//应用combobox效果
				$("#standardList").combobox();
			});
		}); */
		
		//给保存按钮添加点击事件
		$('#save').click(function(){
			//表单form校验
			if($('#staffForm').form('validate')) {
				//通过校验
				$('#staffForm').submit();
			} else {
				//校验失败
				$.messager.alert('警告','表单存在非法数据项','warning');
			}
		});
		
	});

	function doDblClickRow(rowIndex, rowData){
		//form回显
		$('#name').val(rowData.name);
		$('#telephone').val( rowData.telephone);
		$('#station').val(rowData.station);
		//pda勾选
		if(rowData.haspda == "1") {
			$('#haspda').attr("checked","checked");
		} else {
			$('#haspda').removeAttr("checked");
		}
		$('#standardId').combobox('setValue', rowData.standard.id);
		$('#id').val(rowData.id);
		$('#id').attr('readonly','readonly');
		//弹出修改窗口
		$("#addStaffWindow").window('open');
	}
</script>	
</head>
<body class="easyui-layout" style="visibility:hidden;">
	<form action="${pageContext.request.contextPath}/staff_delBatch.action" method="post" id="gridForm">
		<div region="center" border="false">
	    	<table id="grid"></table>
		</div>
	</form>
	<div class="easyui-window" title="对收派员进行添加或者修改" id="addStaffWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="save" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >保存</a>
			</div>
		</div>
		
		<div region="center" style="overflow:auto;padding:5px;" border="false">
			<form action="${pageContext.request.contextPath}/staff_saveOrUpdate.action" method="post" id="staffForm">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">收派员信息</td>
					</tr>
					<!-- TODO 这里完善收派员添加 table -->
					<tr>
						<td>取派员编号</td>
						<td><input type="text" id="id" name="id" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>姓名</td>
						<td><input type="text" id="name" name="name" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>手机</td>
						<td><input type="text" id="telephone" name="telephone" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>单位</td>
						<td><input type="text" id="station" name="station" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td colspan="2">
						<input type="checkbox" id="haspda" name="haspda" value="1" />
						是否有PDA</td>
					</tr>
					<tr>
						<td>取派标准</td>
						<td>
							<!-- 目标model是staff，提供setStandard方法，在Standard中提供setId的方法 -->
							<input class="easyui-combobox" name="standard.id"  id="standardId" 
    							data-options="valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/standard_ajaxlist.action',required:true" />  
    						<!-- <select id="standardList">
    						</select> -->
						</td>
					</tr>
					</table>
			</form>
		</div>
	</div>
</body>
</html>	