package kr.co.DaGuDak.controller;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.DaGuDak.model.MemberVO;
import kr.co.DaGuDak.service.MemberService;

@Controller
@RequestMapping("/views/member/*")
public class MemberController {

   private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

   @Inject // MemberService 객체 주입.
   MemberService service;

   // 회원가입 get
   @RequestMapping(value = "register", method = RequestMethod.GET)
   public void getRegister() throws Exception {
       
   }

   // 회원가입 post
   @RequestMapping(value = "register", method = RequestMethod.POST)
   public String postRegister(@ModelAttribute MemberVO vo, Model model) throws Exception {
      service.register(vo);
      model.addAttribute("member_id", vo.getMember_id());
      return "member/confirmRegister"; // 완료 시 회원가입 확인페이지로 리턴.
   }

   // Id 중복체크
   @ResponseBody
   @RequestMapping(value = "/idChk", method = RequestMethod.GET)
   public int checkId(String member_id) throws Exception {
      // id에 입력값이 없음.
      if (member_id == "") {
         return 2;
      } else {
         int result = service.idChk(member_id);

         // 아이디 사용 불가
         if (result == 1) {
            return 1;
            // 아이디 사용 가능
         } else {
            return 0;
         }
      }
   }

   // 로그인 화면
   @RequestMapping("login")
   public String login() {
      return "member/login";
   }

// 로그인 여부

	@RequestMapping(value = "loginCheck", method = RequestMethod.POST)
	public ModelAndView loginCheck(@ModelAttribute MemberVO vo, HttpSession session, Model model,
			HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();

		boolean result = false;
		if (service.idChk(vo.getMember_id()) == 1) {
			result = service.loginCheck(vo, session);
			if (result == true) {
				model.addAttribute("loginResult", "성공");
				mv.setViewName("home");
			} else {
				model.addAttribute("loginResult", "비밀번호 문제");
				mv.setViewName("home");
			}
		} else {
			model.addAttribute("loginResult", "아이디 문제");
			mv.setViewName("home");
		}

      return mv;
   }

   // 로그아웃
   @RequestMapping("logout")
   public ModelAndView logout(HttpSession session) {
      ModelAndView mv = new ModelAndView();
      service.logout(session);
      mv.setViewName("home");
      return mv;
   }

// 마이페이지
   @RequestMapping(value = "myPage", method = RequestMethod.GET)
   public String myPage(Model model, HttpSession session) throws Exception {
      MemberVO vo = new MemberVO();
      String loginId = (String) session.getAttribute("userId");
      vo = service.userInfo(loginId);
      model.addAttribute("vo", vo);
      return "member/myPage";
   }

//회원 수정페이지
   @RequestMapping(value = "myPageUpdate", method = RequestMethod.POST)
   public String myPageUpdate(HttpSession session, Model model) throws Exception {
      MemberVO vo = new MemberVO();
      String loginId = (String) session.getAttribute("userId");
      vo = service.userInfo(loginId);
      model.addAttribute("vo", vo);
      return "member/myPageUpdate";
   }

//성공 
   @RequestMapping(value = "confirmUpdate", method = RequestMethod.POST)
   public ModelAndView updateMember(@ModelAttribute MemberVO vo, Model model, HttpSession session) throws Exception {
      service.updateMember(vo);
      ModelAndView mv = new ModelAndView();
      mv.setViewName("home");
      return mv;
   }

   @RequestMapping(value = "deleteMember", method = RequestMethod.GET)
   public String deleteMemberGet(HttpSession session, Model model) throws Exception {
      MemberVO vo = new MemberVO();
      String loginId = (String) session.getAttribute("userId");
      vo = service.userInfo(loginId);
      model.addAttribute("vo", vo);
      return "member/deleteMember";
   }

   // 회원탈퇴

	@RequestMapping(value = "deleteMember", method = RequestMethod.POST)
	public ModelAndView deleteMemberPost(@ModelAttribute MemberVO vo, Model model, HttpSession session)
			throws Exception {
		ModelAndView mv = new ModelAndView();
		String loginId = (String) session.getAttribute("userId");
		System.out.println(loginId + "=================");

		// 비밀번호 체크하기
		boolean passwordChk = service.passwordChk(loginId, vo);

		if (passwordChk && vo.getPassword() != null) { // 탈퇴 성공
			service.deleteMember(loginId);
			model.addAttribute("deleteMessage", "성공");
			session.invalidate(); // 세션 삭제
			mv.setViewName("home");

		} else if (passwordChk == false && vo.getPassword() != null) { // 탈퇴 실패
			vo = service.userInfo(loginId);
			model.addAttribute("vo", vo);
			model.addAttribute("deleteMessage", "실패");
			mv.setViewName("member/deleteMember");

		} else {
			model.addAttribute("vo", vo);
			mv.setViewName("member/deleteMember");
		}

		return mv;

	}

   // 포인트 충전
   @RequestMapping(value = "pointBank", method = RequestMethod.GET)
   public String chargePointGet(HttpSession session, Model model) throws Exception {
      MemberVO vo = new MemberVO();
      String loginId = (String) session.getAttribute("userId");
      vo = service.userInfo(loginId);
      model.addAttribute("vo", vo);
      return "member/pointBank";
   }

   @RequestMapping(value = "pointBank", method = RequestMethod.POST)
   public ModelAndView chargePointPost(Model model, HttpSession session, @ModelAttribute MemberVO vo)
         throws Exception {

      ModelAndView mv = new ModelAndView();
      String loginId = (String) session.getAttribute("userId");

      boolean passwordChk = service.passwordChk(loginId, vo);

      if (passwordChk) {
         int myPoint = service.getPoint(loginId);
         service.chargePoint(loginId, myPoint + vo.getPoint());
         model.addAttribute("chargePoint", "성공");
         mv.setViewName("home");
      } else {

         vo = service.userInfo(loginId);  
         model.addAttribute("vo", vo);
         model.addAttribute("chargePoint", "실패");
         mv.setViewName("member/pointBank");
      }

      return mv;
   }

}