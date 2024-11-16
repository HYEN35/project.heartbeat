package kr.heartbeat.music.service;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wrapper.spotify.SpotifyApi;
import com.wrapper.spotify.model_objects.specification.Track;
import com.wrapper.spotify.requests.data.tracks.GetTrackRequest;

import kr.heartbeat.music.persistence.SongPersistence;
import kr.heartbeat.vo.SongVO;

@Service
public class SpotifyService {

    private final SpotifyApi spotifyApi;
    private final SongPersistence songPersistence;

    @Autowired
    public SpotifyService(SpotifyApi spotifyApi, SongPersistence songPersistence) {
        this.spotifyApi = spotifyApi;
        this.songPersistence = songPersistence;
    }
    
    //노래 정보를 DB에 저장
    public void saveTrackToDB(String trackId) throws Exception {
        //Spotify API를 통해 트랙 정보 요청
        GetTrackRequest getTrackRequest = spotifyApi.getTrack(trackId).build();
        Track track = getTrackRequest.execute();

        // 가져온 정보를 SongVO 객체로 변환
        SongVO song = new SongVO();
        song.setSpotify_id(track.getId());
        song.setTitle(track.getName());
        song.setArtist(track.getArtists()[0].getName());  // 첫 번째 아티스트 이름
        song.setAlbum(track.getAlbum().getName());
        song.setHashtag("#someHashtag");  // 해시태그 설정 (예시)
        song.setCreated_at(Timestamp.valueOf(LocalDateTime.now()));  // 현재 시간 저장

        // DB에 저장
        songPersistence.saveSong(song);
    }
}
