import 'package:flutter/material.dart';
import 'package:flutter_shazam/screens/introduction_screens.dart';
import 'package:flutter_shazam/utils/palette.dart';
import 'package:hive_flutter/hive_flutter.dart';

late Box box;
Future<void> main() async {
  await Hive.initFlutter();
  box = await Hive.openBox('box');
  // Hive.registerAdapter(MyObjectAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shazam',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: dark,
      ),
      home: const IntroductionScreens(),
    );
  }
}
