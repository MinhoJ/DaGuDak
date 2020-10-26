package kr.co.DaGuDak.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class CommentVO {
	private int rno;
	private int bno;
	private String commenttext;
	private String commenter;
	private String userName;
	private Date regdate;
	private Date updatedate;
}
