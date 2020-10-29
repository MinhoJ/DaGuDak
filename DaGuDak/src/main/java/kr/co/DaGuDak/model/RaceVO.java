package kr.co.DaGuDak.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RaceVO {
	
	private int race_no;
	private Date race_date;
	private int first_horse;
	private int second_horse;
	private int third_horse;
	private int fourth_horse;
	private int fifth_horse;
	private int winner;

	
}
