package com.codingdojo.playlist.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.playlist.models.Playlist;
import com.codingdojo.playlist.services.PlaylistService;


@Controller
public class PlaylistController {
	private final PlaylistService playlistService;
	
	public PlaylistController(PlaylistService playlistService) {
		this.playlistService = playlistService;
	}
	
	@RequestMapping("/")
	public String lookify() {
		return "lookify.jsp";
	}
	
	@RequestMapping("/dashboard")
	public String dashboard(Model model)  {
		model.addAttribute("playlist", playlistService.allPlaylists());
		return "dashboard.jsp";
	}
	
	@RequestMapping(value="/search", method=RequestMethod.POST)
	public String songsByArtist(Model model, @RequestParam(value="artist", required=false) String artist) {
		if(artist == null) {
			model.addAttribute("playlist", playlistService.allPlaylists());
			return "dashboard.jsp";
		}
		else {
			model.addAttribute("playlist", playlistService.findSong(artist));
			return "displayArtSong.jsp";
		}	
	}
	
	
	@RequestMapping("/songs/new")
	public String newSong(Model model) {
		model.addAttribute("song", new Playlist());
		return "newSong.jsp";
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String createPlaylist(@Valid @ModelAttribute("song") Playlist playlist, BindingResult result) {
		if(result.hasErrors()) {
			return "newSong.jsp";
		}
		else {
			playlistService.createPlaylist(playlist);
			return "redirect:/dashboard";
		}
	}
	
	@RequestMapping(value="/search/topTen", method=RequestMethod.GET)
	public String findTopTen(Model model) {
		List<Playlist> songs = playlistService.findSongs();
		model.addAttribute("playlist", songs);
		return "topTen.jsp";
	}
	
	
	@RequestMapping(value="/songs/{id}", method=RequestMethod.GET)
	public String displayPlaylist(Model model, @PathVariable("id") Long id) {
		Playlist play = playlistService.findPlaylist(id);
		model.addAttribute("playlist", play);
		return "displaySong.jsp";
	}
	
	@RequestMapping("/{id}/edit")
	public String editPlaylist(@PathVariable("id") Long id, Model model) {
		Playlist play = playlistService.findPlaylist(id);
		model.addAttribute("playlist", play);
		return "editPlay.jsp";
	}
	
	@RequestMapping(value="/{id}/update", method=RequestMethod.POST)
	public String update(@Valid @ModelAttribute("playlist") Playlist play, BindingResult result) {
		if(result.hasErrors()) {
			return "editPlay.jsp";
		}
		else {
			playlistService.updatePlaylist(play);
			return "redirect:/playlists";
		}
	}
	
	@RequestMapping("/{id}/delete")
	public String delete(@PathVariable("id") Long id) {
		playlistService.deletePlaylist(id);
		return "redirect:/dashboard";
	}
}
