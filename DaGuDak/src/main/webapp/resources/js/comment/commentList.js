//댓글 목록 - 전통적인 Controller 방식
function commentList(){
	$.ajax({
		type: "get",
		url: "${pageContext.request.contextPath}/comment/",
		success: function(result){
		//responseText가 result에 저장됨.
			$("#commentList").jsp(result);
		}
	});
}

//댓글목록 -RestController를 이용하여 json 형식으로 리턴
function commentList2(){
	$.ajax({
		type: "get",
		url: "get방식 url?bno=${dto.bno}",
		success: function(result){
			consol.log(result);
			var output = "<table>";
			for(var i in result){
				output += "<tr>";
				output += "<td>"+result[i].cmt_writer;
				output += "("+changeDate(result[i].regdate)+")<br>";
				output += result[i].cmt_content+"</td>";
				output += "<tr>";
			}
			output += "</tabel>";
			$('')
		}
	});
}