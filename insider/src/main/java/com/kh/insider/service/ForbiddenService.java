package com.kh.insider.service;

import java.util.List;

import com.kh.insider.vo.BoardListVO;

public interface ForbiddenService {
	String getForbiddenRegex();
	List<BoardListVO> changeForbiddenWords(List<BoardListVO> boardList);
}
