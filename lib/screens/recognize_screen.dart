import 'package:flutter/material.dart';
import 'package:flutter_shazam/models/DeezerModel.dart';
import 'package:flutter_shazam/widgets/header.dart';
import 'package:flutter_shazam/utils/palette.dart';
import 'package:flutter_shazam/widgets/player.dart';

class RecognizedScreen extends StatefulWidget {
  final DeezerModel deezerModel;
  const RecognizedScreen({Key? key, required this.deezerModel})
      : super(key: key);

  @override
  State<RecognizedScreen> createState() => _RecognizedScreenState();
}

class _RecognizedScreenState extends State<RecognizedScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: dark,
            body: Column(
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
                          "Song Recognized",
                          style: TextStyle(
                              color: white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(app_padding),
                    child: Column(
                      children: [
                        Stack(children: [
                          Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 3, color: primary)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/albums/iaw.png',
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              'assets/images/spotify.png',
                            ),
                          ),
                        ]),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              "I Ain't Worried",
                              style: TextStyle(color: white, fontSize: 20),
                            ),
                            Text(
                              "Song by OneRepublic",
                              style: TextStyle(
                                  color: white.withOpacity(0.5), fontSize: 15),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        OutlinedButton.icon(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              minimumSize: Size.fromHeight(50),
                              side: BorderSide(width: 3.0, color: primary),
                              textStyle: TextStyle(
                                  color: white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            label: Text(
                              'Open with deezer',
                              style: TextStyle(color: white),
                            ),
                            icon: Icon(
                              Icons.share,
                              color: white,
                            ),
                            onPressed: () {}),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                minimumSize: Size.fromHeight(50),
                                textStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                                primary: primary),
                            label: Text("Play Sample"),
                            icon: Icon(Icons.play_arrow),
                            onPressed: () {})
                      ],
                    ),
                  ),
                  Player()
                ])));
  }
}
