package kr.co.DaGuDak.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.DaGuDak.dao.RaceDAO;

@Service
public class RaceServiceImpl implements RaceService{

	@Inject
	RaceDAO dao;
}
