package kr.heartbeat.music.config;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.wrapper.spotify.model_objects.credentials.ClientCredentials;
import com.wrapper.spotify.model_objects.specification.AlbumSimplified;
import com.wrapper.spotify.model_objects.specification.Paging;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.springframework.stereotype.Component;

import com.wrapper.spotify.SpotifyApi;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;


@Component
public class SpotifyAPI {

	private static final String CLIENT_ID = "05eadbd57baa45d48cf857b90cdaa648";
    private static final String CLIENT_SECRET = "0435a4d2ca9e4d2c9405ba5b5639f0f7";
    private static final String REDIRECT_URI = "http://localhost:8080/callback";
    private static final String TOKEN_URL = "https://accounts.spotify.com/api/token";
    
    private SpotifyApi spotifyApi;
        
    private static String accessToken = null;
    
    public SpotifyAPI() {
    	
        this.spotifyApi = new SpotifyApi.Builder()
                .setClientId(CLIENT_ID)
                .setClientSecret(CLIENT_SECRET)
                .build();
    }
    
    public void connect() {
        System.out.println("Spotify API connected");
    }
    
    // ClientCredentials 흐름을 사용하여 액세스 토큰을 얻는 메소드
    public static String getAccessToken() {
        if (accessToken == null) {
            try {
                // ClientCredentials 방식으로 인증
                SpotifyApi spotifyApi = new SpotifyApi.Builder()
                        .setClientId(CLIENT_ID)
                        .setClientSecret(CLIENT_SECRET)
                        .build();

                // 클라이언트 자격 증명을 사용하여 액세스 토큰 얻기
                ClientCredentials credentials = spotifyApi.clientCredentials().build().execute();
                accessToken = credentials.getAccessToken();
                System.out.println("Access Token: " + accessToken);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return accessToken;
    }

    // 앨범 검색
    public Paging<AlbumSimplified> getAlbumsFromSpotify(String query) {
        try {
            // Spotify API에 인증된 토큰을 사용하여 요청
            spotifyApi.setAccessToken(getAccessToken());

            Paging<AlbumSimplified> albums = spotifyApi.searchAlbums(query).build().execute();
            if (albums != null) {
                return albums;
            } else {
                System.out.println("No albums found.");
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // 곡 검색
    public JsonObject searchTrack(String query) throws IOException {
        String accessToken = getAccessToken();
        String encodedQuery = URLEncoder.encode(query, StandardCharsets.UTF_8);
        OkHttpClient client = new OkHttpClient();

        Request request = new Request.Builder()
                .url("https://api.spotify.com/v1/search?q=" + encodedQuery + "&type=track&limit=1")
                .addHeader("Authorization", "Bearer " + accessToken)
                .build();

        try (Response response = client.newCall(request).execute()) {
            if (!response.isSuccessful()) throw new IOException("Unexpected code " + response);

            return JsonParser.parseString(response.body().string()).getAsJsonObject();
        }

    }
}