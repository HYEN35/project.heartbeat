package kr.heartbeat.music.service;

import com.wrapper.spotify.SpotifyApi;
import com.wrapper.spotify.SpotifyHttpManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SpotifyConfig {

    private static final String CLIENT_ID = "05eadbd57baa45d48cf857b90cdaa648";
    private static final String CLIENT_SECRET = "0435a4d2ca9e4d2c9405ba5b5639f0f7";
    private static final String REDIRECT_URI = "localhost:8080/callback";

    @Bean
    public SpotifyApi spotifyApi() {
        return new SpotifyApi.Builder()
                .setClientId(CLIENT_ID)
                .setClientSecret(CLIENT_SECRET)
                .setRedirectUri(SpotifyHttpManager.makeUri(REDIRECT_URI))
                .build();
    }
}