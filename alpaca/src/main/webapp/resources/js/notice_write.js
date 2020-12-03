var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "c_content",
		sSkinURI : "se2/SmartEditor2Skin.html",
		fCreator : "createSEditor2",
		htParams : {
					bUseToolbar : true,
					bUseVerticalResizer : false,
					bUseModeChanger : false
		}
	});
	
$(function() {
	$("#savebutton").click(function() {
		oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);
		
		var selcatd = $("#selcatd > option:selected").val();
		var title = $("#title").val();
		var content = document.getElementById("c_content").value;
		
		if (selcatd == "") {
				alert("카테고리를 선택해주세요.");
				return;
		}
		if (title == null || title == "") {
				alert("제목을 입력해주세요.");
				$("#title").focus();
				return;
		}		
		if(content == "" || content == null || content == '&nbsp;' ||
						content == '<br>' || content == '<br/>' || content == '<p>&nbsp;</p>'){
						alert("본문을 작성해주세요.");
						oEditors.getById["c_content"].exec("FOCUS");
						return;
		}
		
		var result = confirm("발행 하시겠습니까?");
		
		if(result){
				alert("발행 완료!");
				$("#noticeWriteForm").submit();
		}else{		
				return;
		}				

	});
})					