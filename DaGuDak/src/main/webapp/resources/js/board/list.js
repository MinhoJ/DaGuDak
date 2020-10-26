$(document).ready(function(){
	$("#btnWrite").on("click", function(){
		location.href = "/DaGuDak/board/write/";
	});
});

function list(bid, curPage,searchOption,keyword){
	location.href="list?bid=" + bid + "&curPage=" + curPage + "&searchOption=" + searchOption +"&keyword=" + keyword;
}

function listBtn(bid, curPage, searchOption, keyword) {
	location.href="list?bid=" + bid + "&curPage=" + curPage + "&searchOption=" + searchOption +"&keyword=" + keyword;
}
