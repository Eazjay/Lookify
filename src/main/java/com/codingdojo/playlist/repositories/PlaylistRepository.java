package com.codingdojo.playlist.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.playlist.models.Playlist;

@Repository
public interface PlaylistRepository extends CrudRepository<Playlist, Long>{
	List<Playlist> findAll();
	
	List<Playlist> findByArtistContaining(String search);
	
	Long countByTitleContaining(String search);
	
	Long deleteByTitleStartingWith(String search);
	
	@Query(value = "SELECT * FROM playlists ORDER BY rating DESC LIMIT 10", nativeQuery = true)
    List<Playlist> top10Songs();
}