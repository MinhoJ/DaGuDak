package kr.co.DaGuDak.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import kr.co.DaGuDak.model.CommentVO;
import kr.co.DaGuDak.service.CommentService;

@Controller
@RequestMapping("/comment/*")
public class CommentController {

	@Inject
	CommentService commentService;

	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public ModelAndView insert(@ModelAttribute CommentVO vo, RedirectAttributes ra, HttpSession session)
			throws Exception {
		System.out.println("CommentController.insert() 실행");
		String url = "";
		RedirectView rv = new RedirectView();

		System.out.println(vo);

		commentService.create(vo);

		url = "/DaGuDak/board/content?bno=" + vo.getBno();
		rv.setUrl(url);
		rv.setExposeModelAttributes(false);
		return new ModelAndView(rv);
	}
	
	@RequestMapping("list")
	public ModelAndView list(@RequestParam("bid") int bid, @RequestParam("bno") int bno, ModelAndView mav) throws Exception {
		List<CommentVO> list = commentService.list(bid, bno);
		mav.setViewName("board/commentList");
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute CommentVO vo, RedirectAttributes ra, HttpSession session)
			throws Exception {
		
		//수정 버튼 눌렀을때 cmtno 넘어오게 하는 방법 생각해보기
		
		System.out.println("CommentController.update() 실행");
		String url = "";
		RedirectView rv = new RedirectView();

		System.out.println(vo);
		
		boolean cmtUpdatePasswordCheck = commentService.update(vo);
		ra.addFlashAttribute("cmtUpdatePasswordCheck", cmtUpdatePasswordCheck);
		
		System.out.println("cmtUpdatePasswordCheck: " + cmtUpdatePasswordCheck);
		
		url = "/DaGuDak/board/content?bno=" + vo.getBno();
		rv.setUrl(url);
		rv.setExposeModelAttributes(false);
		
		return new ModelAndView(rv);

	}
	
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public ModelAndView delete(@ModelAttribute int cmtno, @ModelAttribute String cmt_password, RedirectAttributes ra, HttpSession session)
			throws Exception {
		System.out.println("CommentController.delete() 실행");
		String url = "";
		RedirectView rv = new RedirectView();

		//System.out.println(delete(cmtno) : );

		boolean cmtDeletePasswordCheck = commentService.delete(cmtno, cmt_password);
		
		ra.addFlashAttribute("cmtDeletePasswordCheck", cmtDeletePasswordCheck);
		
		System.out.println("cmtDeletePasswordCheck: " + cmtDeletePasswordCheck);
		
		//ajax 사용시 어디로 리턴하는지 확인할 것
		//url = "/DaGuDak/board/content?bno=" + vo.getBno();
		rv.setUrl(url);
		rv.setExposeModelAttributes(false);
		
		return new ModelAndView(rv);	}
	

	
	/*
	 * 
	 * @RequestMapping("listJson")
	 * 
	 * @ResponseBody public List<CommentVO> listJson(@RequestParam int bno) {
	 * List<CommentVO> list = commentService.list(bno); return list; }
	 */
	 

}
