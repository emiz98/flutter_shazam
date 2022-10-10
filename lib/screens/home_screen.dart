// ignore_for_file: sort_child_properties_last
import 'dart:developer';

import 'package:acr_cloud_sdk/acr_cloud_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shazam/models/DeezerModel.dart';
import 'package:flutter_shazam/screens/recognize_screen.dart';
import 'package:flutter_shazam/services/DeezerService.dart';
import 'package:flutter_shazam/utils/palette.dart';
import 'package:flutter_shazam/widgets/header.dart';
import 'dart:math' as math;
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 2))
        ..repeat();

  bool isEnabled = false;
  final AcrCloudSdk arc = AcrCloudSdk();
  SongService songService = new SongService();
  late DeezerModel recognizedSong;

  @override
  void initState() {
    initACR();
    super.initState();
  }

  Future<void> initACR() async {
    try {
      arc
        ..init(
          host: 'identify-eu-west-1.acrcloud.com',
          accessKey: '',
          accessSecret: '',
          setLog: true,
        )
        ..songModelStream.listen(searchSong);
    } catch (e) {
      print(e.toString());
    }
  }

  void searchSong(SongModel song) async {
    final metaData = song.metadata;

    if (metaData != null) {
      final trackID =
          await metaData.music![0].externalMetadata!.deezer!.track!.id;
      if (trackID != null) {
        recognizedSong = await songService.getTrack(trackID);
        inspect(await songService.getTrack(trackID));
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => RecognizedScreen(
        //             deezerModel: recognizedSong,
        //           )),
        // );
      }
    }
  }

  Future<void> startRecognizing() async {
    isEnabled = true;
    try {
      bool started = await arc.start();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: dark,
        body: Padding(
          padding: const EdgeInsets.all(app_padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Header(isBackEnabled: false),
              Column(
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (_, child) {
                      return Transform.rotate(
                        angle: isEnabled ? _controller.value * 2 * math.pi : 0,
                        child: child,
                      );
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Lottie.asset('assets/images/visualizer.json'),
                        GestureDetector(
                          onTap: () {
                            startRecognizing();
                          },
                          child: Image.asset(
                            'assets/images/logo.png',
                            scale: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    isEnabled ? "Listening..." : "Touch to Shazam",
                    style: TextStyle(color: white, fontSize: 20),
                  )
                ],
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
