import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_shazam/screens/playlist_screen.dart';
import 'package:flutter_shazam/utils/palette.dart';

class Header extends StatelessWidget {
  final bool isBackEnabled;
  const Header({Key? key, required this.isBackEnabled}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isBackEnabled
            ? GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(25)),
                    child: const Icon(
                      Icons.arrow_back,
                      color: white,
                    )),
              )
            : GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlaylistScreen()),
                ),
                child: Icon(
                  Icons.library_music,
                  size: 40,
                  color: primary,
                ),
              ),
        Icon(
          Icons.search,
          size: 40,
          color: primary,
        )
      ],
    );
  }
}
