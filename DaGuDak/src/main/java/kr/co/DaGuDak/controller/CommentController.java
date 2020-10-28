package kr.co.DaGuDak.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/comment/*")
public class CommentController {
	/*
	 * @Inject CommentService commentService;
	 * 
	 * @RequestMapping("insert") public void insert(@ModelAttribute CommentVO vo,
	 * HttpSession session) { String userId = (String)
	 * session.getAttribute("userId");//아이디 값을 세션으로 저장 (헤드로 옮길 것)
	 * vo.setCommenter(userId); commentService.create(vo); }
	 * 
	 * @RequestMapping("list") public ModelAndView list(@RequestParam int bno,
	 * ModelAndView mav) { List<CommentVO> list = commentService.list(bno);
	 * mav.setViewName("board/commentList"); mav.addObject("list", list); return
	 * mav; }
	 * 
	 * @RequestMapping("listJson")
	 * 
	 * @ResponseBody public List<CommentVO> listJson(@RequestParam int bno) {
	 * List<CommentVO> list = commentService.list(bno); return list; }
	 */

}
