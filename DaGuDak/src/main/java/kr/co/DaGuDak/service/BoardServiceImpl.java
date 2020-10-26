package kr.co.DaGuDak.service;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.DaGuDak.dao.BoardDAO;
import kr.co.DaGuDak.model.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardDAO boardDao;

	@Override
	public void create(BoardVO vo, HttpServletRequest request) throws Exception {
		String title = vo.getTitle();
		String content = vo.getContent();
		String writer = vo.getWriter();

		title = title.replace("<", "&lt;");
		title = title.replace(">", "&gt;");
		writer = writer.replace("<", "&lt;");
		writer = writer.replace(">", "&gt;");

		title = title.replace("  ", "&nbsp;&nbsp;");
		writer = writer.replace("  ", "&nbsp;&nbsp;");

		content = content.replace("\n", "<br>");
		vo.setTitle(title);
		vo.setContent(content);
		vo.setWriter(writer);
		
		if(vo.getFile().isEmpty() == false)
			insertFile(vo, request);
		
		boardDao.create(vo);
	}

	@Override
	public BoardVO read(int bid, int bno) throws Exception {
		return boardDao.read(bid, bno);
	}

	@Override
	public void update(BoardVO vo, HttpServletRequest request) throws Exception {
		if(vo.getFile().isEmpty() == false)
			insertFile(vo, request);
		boardDao.update(vo);
	}

	@Override
	public void delete(int bid, int bno) throws Exception {
		boardDao.delete(bid, bno);

	}

	@Override
	public void increaseViewCnt(int bid, int bno, HttpSession session) throws Exception {
		long update_time = 0;
		if (session.getAttribute("update_time_" + bno) != null) {
			update_time = (long) session.getAttribute("update_time_" + bno);
		}

		long current_time = System.currentTimeMillis();

		if (current_time - update_time > 5 * 1000) {
			boardDao.increaseViewcnt(bid, bno);
			session.setAttribute("update_time_" + bno, current_time);
		}

	}

	@Override
	public List<BoardVO> listAll(int start, int end, String searchOption, String keyword, int bid) throws Exception {
		System.out.println("BoardServiceImpl.listAll(): bid == " + bid);
		return boardDao.listAll(start, end, searchOption, keyword, bid);
	}

	@Override
	public int countArticle(int bid, String searchOption, String keyword) throws Exception {
		return boardDao.countArticle(bid, searchOption, keyword);
	}
	
	@Override
	public void insertFile(BoardVO vo, HttpServletRequest request)
			throws IllegalStateException, IOException {
		
		MultipartHttpServletRequest mpRequest = (MultipartHttpServletRequest)request;

		String root_path = mpRequest.getSession().getServletContext().getRealPath("/");
		String attach_path = "resources/upload/";
		String file_name;
		String fileExtension;
		String file_rename;
		long file_size;
		
		System.out.println("BoardServiceImpl.insertFile() upload path: "+root_path+attach_path);

		Iterator<String> iterator = mpRequest.getFileNames();

		MultipartFile multipartFile = null;

		File file = new File(root_path + attach_path);
		if (file.exists() == false) {
			file.mkdirs();
		}
					
		while (iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				file_name = multipartFile.getOriginalFilename();
				fileExtension = file_name.substring(file_name.lastIndexOf("."));
				file_rename = UUID.randomUUID().toString().replaceAll("-", "") + fileExtension;
				file_size = multipartFile.getSize();
				vo.setFile_name(file_name);
				vo.setFile_rename(file_rename);
				vo.setFile_size(file_size);
				file = new File(root_path + attach_path + file_name);
				System.out.println("root_path" + root_path);
				multipartFile.transferTo(file);
				vo.setFile(multipartFile);
			}
		}
	}
}
