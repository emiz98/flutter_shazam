import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shazam/utils/palette.dart';
import 'package:flutter_shazam/utils/utils.dart';
import 'package:flutter_shazam/widgets/album_art.dart';

class Player extends StatefulWidget {
  const Player({Key? key}) : super(key: key);

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  bool isPlaying = false;
  final audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    setAudio();
    super.initState();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });

    audioPlayer.onDurationChanged.listen((newPosition) {
      setState(() {
        duration = newPosition;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future setAudio() async {
    final player = AudioCache(prefix: 'assets/mp3/');
    final url = await player.load('wannabe.mp3');
    await audioPlayer.setUrl(url.path, isLocal: true);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(app_padding),
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AlbumArt(isFooter: true),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "I Ain't Worried",
                    style: TextStyle(color: white, fontSize: 20),
                  ),
                  Text(
                    "Song by OneRepublic",
                    style:
                        TextStyle(color: white.withOpacity(0.5), fontSize: 15),
                  ),
                ],
              ),
              SizedBox(
                width: 60,
              ),
              GestureDetector(
                onTap: () async {
                  if (isPlaying) {
                    await audioPlayer.pause();
                    setState(() {
                      isPlaying = false;
                    });
                  } else {
                    await audioPlayer.resume();
                    setState(() {
                      isPlaying = true;
                    });
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: primary, borderRadius: BorderRadius.circular(20)),
                  child: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: white,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 5,
          width: getNormalizedLength(position, duration, context),
          color: primary,
        )
      ],
    );
  }
}
