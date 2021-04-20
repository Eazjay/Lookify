package com.codingdojo.playlist.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.playlist.models.Playlist;
import com.codingdojo.playlist.repositories.PlaylistRepository;

@Service
public class PlaylistService {
	private final PlaylistRepository playlistRepository;
	
	public PlaylistService(PlaylistRepository playlistRepository) {
		this.playlistRepository = playlistRepository;
	}
	
	public List<Playlist> allPlaylists(){
		return playlistRepository.findAll();
	}
	
	public List<Playlist> findSong(String artist) {
		List<Playlist> song = playlistRepository.findByArtistContaining(artist);
		return song;
	}
	
	public List<Playlist> findSongs() {
		return playlistRepository.top10Songs();
	}
	
	
	public Playlist createPlaylist(Playlist play) {
		return playlistRepository.save(play);
	}
	
	public Playlist findPlaylist(Long id) {
		Optional<Playlist> optionalPlay = playlistRepository.findById(id);
		if(optionalPlay.isPresent()) {
			return optionalPlay.get();
		}
		else {
			return null;
		}
	}
	
	public void deletePlaylist(Long id) {
		Playlist play = findPlaylist(id);
		playlistRepository.delete(play);
	}
	
	public Playlist updatePlaylist(Playlist play) {
		return playlistRepository.save(play);
	}
}
