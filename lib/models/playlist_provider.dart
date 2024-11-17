import 'package:flutter/material.dart';
import 'package:music_player/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  //playlist of songs
  final List<Song> _playlist = [
    //song 1
    Song(
      songName: "Ek Zindagi",
      artistName: "Tanishkaa Sanghvi",
      albumArtImagePath: "lib/assets/images/song1.webp",
      audioPath: "lib/assets/audio/audio.mp3",
    ),

    //song 2
    Song(
      songName: "Nachan Nu Jee Karda",
      artistName: "Romy",
      albumArtImagePath: "lib/assets/images/song2.webp",
      audioPath: "lib/assets/audio/audio2.mp3",
    ),

    //song 3
    Song(
      songName: "Tu Hasil Karunga",
      artistName: "Stebin Ben",
      albumArtImagePath: "lib/assets/images/song3.webp",
      audioPath: "lib/assets/audio/audio3.mp3",
    ),
  ];

  //current playing song index
  int? _currentSongIndex;

  //G E T T E R S
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
}
