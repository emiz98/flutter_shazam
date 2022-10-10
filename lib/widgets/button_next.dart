import 'package:flutter/material.dart';
import 'package:flutter_shazam/utils/palette.dart';

class ButtonNext extends StatelessWidget {
  const ButtonNext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: primary, borderRadius: BorderRadius.circular(25)),
        child: const Icon(
          Icons.arrow_forward,
          color: white,
        ));
  }
}
