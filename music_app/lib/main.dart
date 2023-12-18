import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:music_app/Pages/demo_page.dart';
import 'package:music_app/Pages/song_page.dart';
import 'package:music_app/Pages/splash_screen.dart';
import 'package:music_app/config/theme.dart';
import 'package:music_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Listen Me',
        theme: darkTheme,
        home: SongPage()
        //home: SplashScreen()
        //home: DemoPage(),
        );
  }
}
