import 'package:flutter/material.dart';

getNormalizedLength(Duration current, Duration end, BuildContext context) {
  double windowSize = MediaQuery.of(context).size.width;
  double value = (current.inMicroseconds / end.inMicroseconds) * windowSize + 1;

  if (value < windowSize && value > 0) {
    return value;
  } else {
    return 0.0;
  }
}
