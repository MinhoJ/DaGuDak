package kr.co.DaGuDak.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.DaGuDak.model.BoardPager;
import kr.co.DaGuDak.model.BoardVO;
import kr.co.DaGuDak.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Inject
	BoardService boardService;

	public ModelAndView mav = new ModelAndView();

	@RequestMapping(value = "list")
	public ModelAndView list(@RequestParam(defaultValue = "title") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage,
			@RequestParam int bid, HttpSession session) throws Exception {

		// 세션으로 bid 저장할 것, 그럼 작성하기->수정,삭제,목록할 때 파라미터 값 없어도 게시판 별로 컨트롤 가능

		session.setAttribute("bid", bid);

		int boardid = (int) session.getAttribute("bid");

		int count = boardService.countArticle(boardid, searchOption, keyword);
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();

		List<BoardVO> list = boardService.listAll(start, end, searchOption, keyword, boardid);
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("list", list);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("boardPager", boardPager);
		map.put("curPage", curPage);
		map.put("bid", boardid);

		mav.addObject("map", map);
		mav.setViewName("board/list");

		return mav;
	}

	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String write() {
		return "board/write";
	}

	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insert(@ModelAttribute BoardVO vo, HttpServletRequest request) throws Exception {
		// pom.xml에 디펜던시 추가함
		// list.jsp에 input hidden 값으로 bid 고정시켜둠. 세션처리 후 jsp 수정
		boardService.create(vo, request);
		// 메서드 실행 후, redirect:list인 경우, bid 값도 같이 리턴하도록 수정하기
		return "redirect:list";
	}

	@RequestMapping(value = "content", method = RequestMethod.GET)
	public ModelAndView content(@RequestParam("bno") int bno, HttpSession session) throws Exception {
		boardService.increaseViewCnt((int) session.getAttribute("bid"), bno, session);
		// boardService.read(bid, bno) 여기에서 파일 이름 받아서 다운로드하기

		mav.setViewName("board/content");
		mav.addObject("dto", boardService.read((int) session.getAttribute("bid"), bno));
		return mav;
	}

	@RequestMapping(value = "updateForm", method = RequestMethod.GET)
	public ModelAndView uppdateForm(@RequestParam("bno") int bno, HttpSession session) throws Exception {
		mav.setViewName("board/update");
		mav.addObject("dto", boardService.read((int) session.getAttribute("bid"), bno));
		return mav;
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@ModelAttribute BoardVO vo, HttpServletRequest request) throws Exception {
		boardService.update(vo, request);
		return "redirect:list";
	}

	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(@RequestParam("bno") int bno, HttpSession session) throws Exception {

		boardService.delete((int) session.getAttribute("bid"), bno);
		return "redirect:list";
	}

}
