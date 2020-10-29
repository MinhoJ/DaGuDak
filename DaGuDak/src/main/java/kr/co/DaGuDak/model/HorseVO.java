package kr.co.DaGuDak.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class HorseVO {
	private int horse_no;
	private String horse_name;
	private String kind;
	private int age;
	private int weight;
	private String gender;
	private int[] speed;
	private int max_speed;
	private int win_count;
	private int total_games;
}