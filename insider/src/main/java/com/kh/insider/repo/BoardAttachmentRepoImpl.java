package com.kh.insider.repo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.insider.dto.BoardAttachmentDto;
import com.kh.insider.vo.BoardAttachVO;
import com.kh.insider.vo.PaginationVO;
import com.kh.insider.vo.SearchVO;

@Repository
public class BoardAttachmentRepoImpl implements BoardAttachmentRepo{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(BoardAttachmentDto boardAttachmentDto) {
		int sequence = sqlSession.selectOne("board_attachment.sequence");
		boardAttachmentDto.setBoardNo(sequence);
		
		sqlSession.insert("board_attachment.insert", boardAttachmentDto);
	}

	@Override
	public void delete(int boardNo) {
		sqlSession.delete("board_attachment.delete", boardNo);		
	}
	
//	@Override
//	public void insert(BoardAttachVO vo) {
//		boardAttachmentRepo.insert(vo);
//	}
//
//	@Override
//	public List<BoardAttachVO> selectList(PaginationVO paging) {
//		return boardAttachmentRepo.selectList(paging);
//	}
//
//	@Override
//	public BoardAttachVO selectOne(int boardNo) {
//		return boardAttachmentRepo.selectOne(boardNo);
//	}
//
//	@Override
//	public void delete(int boardNo) {
//		boardAttachmentRepo.delete(boardNo);
//	}


}
