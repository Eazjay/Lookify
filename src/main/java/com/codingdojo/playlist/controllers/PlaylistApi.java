package com.codingdojo.playlist.controllers;

import java.util.List;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.codingdojo.playlist.models.Playlist;
import com.codingdojo.playlist.services.PlaylistService;

@RestController
public class PlaylistApi {
	
	private final PlaylistService playlistService;
	
	public PlaylistApi(PlaylistService playlistService) {
		this.playlistService = playlistService;
	}
	
	@RequestMapping("/api/playlists")
	public List<Playlist> index(){
		return playlistService.allPlaylists();
	}
	
	@RequestMapping(value="/api/playlists/create", method=RequestMethod.POST)
	public Playlist create(@RequestParam(value="title") String title,
						@RequestParam(value="artist") String artist,
						@RequestParam(value="rating") int rating) {
		Playlist play = new Playlist(title, artist, rating);
		return playlistService.createPlaylist(play);
	}
	
	@RequestMapping("/api/playlists/{id}")
	public Playlist show(@PathVariable("id") Long id) {
		Playlist play = playlistService.findPlaylist(id);
		return play;
	}
	
	@RequestMapping("/api/playlists/{id}/delete")
	public String delete(@PathVariable("id") Long id) {
		playlistService.deletePlaylist(id);
		return "Playlist deleted successfully";
	}
	
	@RequestMapping(value="/api/playlists/{id}/update", method=RequestMethod.PUT)
	public Playlist update(@RequestParam(value="title") String title,
						@RequestParam(value="artist") String artist,
						@RequestParam(value="rating") int rating,
						@PathVariable("id") Long id) {
		Playlist play = playlistService.findPlaylist(id);
		play.setTitle(title);
		play.setArtist(artist);
		play.setRating(rating);
		return playlistService.updatePlaylist(play);
	}
}
