package kr.co.DaGuDak.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
   public ModelAndView delete(@ModelAttribute CommentVO vo, RedirectAttributes ra, HttpSession session)
         throws Exception {
      System.out.println("CommentController.delete() 실행");
      String url = "";
      RedirectView rv = new RedirectView();

      System.out.println(vo);

      boolean cmtDeletePasswordCheck = commentService.delete(vo);
      
      ra.addFlashAttribute("cmtDeletePasswordCheck", cmtDeletePasswordCheck);
      
      System.out.println("cmtDeletePasswordCheck: " + cmtDeletePasswordCheck);
      
      url = "/DaGuDak/board/content?bno=" + vo.getBno();
      rv.setUrl(url);
      rv.setExposeModelAttributes(false);
      
      return new ModelAndView(rv);   }
   

   /*
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