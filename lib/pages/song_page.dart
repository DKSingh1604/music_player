// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:music_player/components/neu_box.dart';
import 'package:music_player/models/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatefulWidget {
  const SongPage({super.key});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  //State variable to track if the icon is selected
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {
        //get the playlist
        final playlist = value.playlist;

        //get the current song
        final currentSong = playlist[value.currentSongIndex ?? 0];

        //return scaffold UI
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //app bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //back button
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios),
                        ),

                        //title
                        Text("P L A Y L I S T"),

                        //menu button
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.menu),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: NeuBox(
                      child: Column(
                        children: [
                          //image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(17),
                            child: Image.asset(
                              currentSong.albumArtImagePath,
                            ),
                          ),

                          SizedBox(height: 20),

                          //song and artist name
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //song and artist name
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentSong.songName,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    currentSong.artistName,
                                  )
                                ],
                              ),

                              //heart icon
                              // IconButton(
                              //   splashColor: Colors.red,
                              //   splashRadius: 200,
                              //   onPressed: () {
                              //     setState(() {
                              //       isFavorite = !isFavorite;
                              //     });
                              //   },
                              //   icon: Icon(
                              //     isFavorite
                              //         ? Icons.favorite
                              //         : Icons.favorite_border,
                              //   ),
                              //   color: isFavorite ? Colors.red : Colors.grey,
                              //   iconSize: 35,
                              // ),

                              //heart animation
                              GestureDetector(
                                child: Lottie.asset(
                                    'assets/animations/like.json',
                                    width: 70,
                                    height: 70),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  //song duration progress - seek
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 30.0, left: 30, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //start time
                        Text(value.currentDuration.toString()),

                        //shuffle icon
                        // Icon(Icons.shuffle),

                        //repeat icon
                        // Icon(Icons.repeat),

                        //end time
                        Text(value.totalDuration.toString()),
                      ],
                    ),
                  ),

                  //S L I D E R
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 5)),
                      child: Slider(
                        activeColor:
                            Theme.of(context).colorScheme.inversePrimary,
                        min: 0,
                        max: value.totalDuration.inSeconds.toDouble(),
                        value: value.currentDuration.inSeconds.toDouble(),
                        onChanged: (double double) {
                          //during when the user is dragging the slider
                        },
                        onChangeEnd: (double double) {
                          //sliding is finished, got the position where its left
                          value.seek(Duration(seconds: double.toInt()));
                        },
                      ),
                    ),
                  ),

                  //shuffle and repeat buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //shuffle icon
                        Icon(Icons.shuffle),

                        //repeat icon
                        Icon(Icons.repeat),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  //playback controls
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      children: [
                        //skip previous
                        Expanded(
                          child: GestureDetector(
                            onTap: value.playPreviousSong,
                            child: NeuBox(
                              child: Icon(Icons.skip_previous),
                            ),
                          ),
                        ),

                        SizedBox(width: 20),

                        //play/pause
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: value.pauseOrResume,
                            child: NeuBox(
                              child: Icon(value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow),
                            ),
                          ),
                        ),

                        SizedBox(width: 20),

                        //next
                        Expanded(
                          child: GestureDetector(
                            onTap: value.playNextSong,
                            child: NeuBox(
                              child: Icon(Icons.skip_next),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
