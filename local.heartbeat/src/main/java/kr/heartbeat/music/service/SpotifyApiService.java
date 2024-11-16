package kr.heartbeat.music.service;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Base64;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import com.wrapper.spotify.SpotifyApi;
import com.wrapper.spotify.exceptions.SpotifyWebApiException;
import com.wrapper.spotify.model_objects.specification.Track;
import com.wrapper.spotify.requests.data.tracks.GetTrackRequest;

import kr.heartbeat.vo.SongVO;

public class SpotifyApiService {

    private final String clientId = "05eadbd57baa45d48cf857b90cdaa648";
    private final String clientSecret = "0435a4d2ca9e4d2c9405ba5b5639f0f7";
    private String accessToken;

    public void authenticate() {
        String url = "https://accounts.spotify.com/api/token";
        RestTemplate restTemplate = new RestTemplate();
        String credentials = clientId + ":" + clientSecret;
        String encodedCredentials = Base64.getEncoder().encodeToString(credentials.getBytes());

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Basic " + encodedCredentials);
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
        body.add("grant_type", "client_credentials");

        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(body, headers);
        ResponseEntity<String> response = restTemplate.postForEntity(url, request, String.class);

        JSONObject json = new JSONObject(response.getBody());
        this.accessToken = json.getString("access_token");
    }

    public JSONArray searchSongs(String hashtag) {
        try {
            String url = "https://api.spotify.com/v1/search?q=" + hashtag + "&type=track&limit=10";
            RestTemplate restTemplate = new RestTemplate();

            HttpHeaders headers = new HttpHeaders();
            headers.set("Authorization", "Bearer " + this.accessToken);

            HttpEntity<String> entity = new HttpEntity<>(headers);
            ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);

            JSONObject json = new JSONObject(response.getBody());
            return json.getJSONObject("tracks").getJSONArray("items");
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Spotify API 호출 실패: " + e.getMessage());
        }
    }
    
    public SongVO getSongFromSpotify(String spotify_id) throws IOException, SpotifyWebApiException, URISyntaxException {
    	SpotifyApi spotifyApi = new SpotifyApi.Builder()
                .setClientId(clientId)
                .setClientSecret(clientSecret)
                .setRedirectUri(URI.create("localhost:8080/callback"))
                .build();

        // Spotify에서 곡 정보 가져오기
        GetTrackRequest getTrackRequest = spotifyApi.getTrack(spotify_id).build();
        
        Track track = null;
        
        try {
            track = getTrackRequest.execute(); // Spotify API 호출
        } catch (SpotifyWebApiException e) {
            // 예외 처리: Spotify API 호출 실패
            System.err.println("Spotify API 호출 중 오류 발생: " + e.getMessage());
            throw e; // 예외 던지기
        } catch (IOException e) {
            // 예외 처리: 네트워크 관련 오류
            System.err.println("네트워크 오류 발생: " + e.getMessage());
            throw e; // 예외 던지기
        }

        // 받은 데이터를 SongVO로 매핑
        SongVO songVO = new SongVO();
        songVO.setSpotify_id(track.getId());  // spotifyId -> spotify_id
        songVO.setTitle(track.getName());
        songVO.setArtist(track.getArtists()[0].getName());
        songVO.setAlbum(track.getAlbum().getName());
        songVO.setHashtag("#exampleHashtag");

        return songVO;
    }
}