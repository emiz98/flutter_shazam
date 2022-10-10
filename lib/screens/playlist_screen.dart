// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shazam/utils/palette.dart';
import 'package:flutter_shazam/widgets/header.dart';
import 'package:flutter_shazam/widgets/player.dart';
import 'package:flutter_shazam/widgets/single_song.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({Key? key}) : super(key: key);

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(app_padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(isBackEnabled: true),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "My Playlist",
                  style: TextStyle(
                      color: white, fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                SingleSong(),
                SingleSong(),
                SingleSong(),
              ],
            ),
          ),
          Player()
        ],
      )),
    );
  }
}
