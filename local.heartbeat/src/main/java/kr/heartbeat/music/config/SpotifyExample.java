package kr.heartbeat.music.config;

import com.wrapper.spotify.model_objects.specification.ArtistSimplified;
import com.wrapper.spotify.model_objects.specification.Track;

import java.util.List;

public class SpotifyExample {
	public static void main(String[] args) {
		// Spotify에서 트랙 데이터 가져오기 (예: `track` 객체)
		Track track = getTrackFromSpotify(); // 임의의 메서드로 트랙 가져오기

		if (track != null) {
			List<ArtistSimplified> artists = List.of(track.getArtists());
			if (artists != null && !artists.isEmpty()) {
				String artistName = artists.get(0).getName();
				System.out.println("첫 번째 아티스트 이름: " + artistName);
			} else {
				System.out.println("아티스트 정보가 없습니다.");
			}
		} else {
			System.out.println("트랙 정보가 없습니다.");
		}
	}

	private static Track getTrackFromSpotify() {
		// Spotify API에서 데이터를 가져오는 로직 추가
		return null; // 예시용 반환 값
	}
}
