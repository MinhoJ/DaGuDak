function deleteBtn(bid, bno) {
      var answer = confirm('이 게시글을 삭제하시겠습니까?');
      if(answer) {
         location.href='delete?bid=' + bid + '&bno='+bno
      }
}