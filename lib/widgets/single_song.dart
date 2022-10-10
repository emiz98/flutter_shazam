import 'package:flutter/material.dart';
import 'package:flutter_shazam/utils/palette.dart';
import 'package:flutter_shazam/widgets/album_art.dart';

class SingleSong extends StatelessWidget {
  const SingleSong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AlbumArt(isFooter: false),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "I Ain't Worried",
                style: TextStyle(color: white, fontSize: 20),
              ),
              Text(
                "Song by OneRepublic",
                style: TextStyle(color: white.withOpacity(0.5), fontSize: 15),
              )
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            height: 50,
            width: 35,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: primary,
            ),
            child: Icon(
              Icons.more_vert,
              color: white,
            ),
          )
        ],
      ),
    );
  }
}
