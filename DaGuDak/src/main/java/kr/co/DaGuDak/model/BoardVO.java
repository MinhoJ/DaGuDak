package kr.co.DaGuDak.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class BoardVO {
	private int bno;
	private int bid;
	private int reply;
	private String title;
	private String content;
	private String writer;
	private String password;
	private Date regdate;
	private int viewcnt;
	private int recnt; //이거 뭐야
	private String file_name;
	private String file_rename;
	private long file_size;
	private MultipartFile file;
}
