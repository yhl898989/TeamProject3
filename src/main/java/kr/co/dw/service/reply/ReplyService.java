package kr.co.dw.service.reply;

import java.util.List;
import java.util.Map;

import kr.co.dw.domain.ReplyDTO;

public interface ReplyService {

	void insert(Map<String, Object> map);

	List<ReplyDTO> list(int qno);

	void delete(Map<String, Object> map);//rno

	void update(Map<String, Object> map);

	void deleteByQno(int qno);//여러 개

}