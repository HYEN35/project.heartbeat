package kr.heartbeat.music.controller;
import kr.heartbeat.music.persistence.MusicPersistence;
import kr.heartbeat.music.service.HashtagRequest;
import kr.heartbeat.music.service.HashtagService;
import kr.heartbeat.music.service.MusicService;
import kr.heartbeat.vo.HashtagVO;
import kr.heartbeat.vo.MusicVO;
import kr.heartbeat.vo.PlaylistDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class MusicController {
	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private HashtagService hashtagService;

	@Autowired
	private MusicService musicService;

	@Autowired
	private MusicPersistence musicPersistence;

	// 해시태그에 맞는 음악 리스트를 가져오는 메서드
	/*@RequestMapping("/music/playlist")
	public String findMusic(Model model) {
		model.addAttribute("musicList", musicService.findAllMusic());
		return "heartbeat/playlist";
	}*/

	/*@GetMapping("/music/playlist")
	@ResponseBody
	public List<PlaylistDTO> allPlaylist() {
		List<PlaylistDTO> musicList = musicService.findAllMusicAjax();
		return musicList;
	}*/

	/*@GetMapping("/music/playlist")
	@ResponseBody
	public String allPlaylist(@RequestParam("hashtags[]") String[] hashtags, Model model) {
		System.out.println("*************태그확인하기************");
		System.out.println("*************Selected Hashtags: " + Arrays.asList(hashtags));

		List<PlaylistDTO> musicList = musicService.findAllMusicAjax(Arrays.asList(hashtags));
		model.addAttribute("musicList", musicList);

		return "heartbeat/playlist";
	}*/

	@GetMapping("/music/playlist")
	@ResponseBody
	public List<PlaylistDTO> allPlaylist(@RequestParam(value = "hashtags[]", required = false) String hashtags) {
		System.out.println("************* 선택된 해시태그 값 : " + hashtags);

		if (hashtags == null || hashtags.isEmpty()) {
			System.out.println("********** 선택된 해시태그가 없습니다 **********");
			return new ArrayList<>();
		}

		//List<PlaylistDTO> musicList = musicService.findAllMusicAjax(hashtags);
		//return musicList;
		List<String> hashtagList = Arrays.asList(hashtags.split(","));
		List<PlaylistDTO> musicList = musicService.findAllMusicAjax(hashtagList);

		System.out.println("Hashtag List: " + hashtagList);

		return musicList;
	}
}
