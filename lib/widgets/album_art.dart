import 'package:flutter/material.dart';
import 'package:flutter_shazam/utils/palette.dart';

class AlbumArt extends StatelessWidget {
  final bool isFooter;
  const AlbumArt({Key? key, required this.isFooter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: isFooter ? 60 : 100,
          height: isFooter ? 60 : 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(isFooter ? 5 : 10),
              border: Border.all(width: 3, color: primary)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(isFooter ? 4 : 8),
            child: Image.asset(
              'assets/albums/iaw.png',
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          height: isFooter ? 25 : 30,
          width: isFooter ? 25 : 30,
          child: Image.asset(
            'assets/images/spotify.png',
          ),
        ),
        if (!isFooter)
          Padding(
            padding: const EdgeInsets.all(25),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: primary, borderRadius: BorderRadius.circular(20)),
              child: Icon(
                Icons.play_arrow,
                color: white,
              ),
            ),
          )
      ],
    );
  }
}
