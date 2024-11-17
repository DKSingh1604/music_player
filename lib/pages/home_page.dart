// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:music_player/components/my_drawer.dart';
import 'package:music_player/models/playlist_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: Text(" P L A Y L I S T"),
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        drawer: MyDrawer(),
        body: Consumer<PlaylistProvider>(
            builder: (context, value, child) => ListView.builder(
                  itemBuilder: (context, index) => ListTile(),
                )));
  }
}
