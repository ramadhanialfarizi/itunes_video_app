import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itunes_video_app/core/utils/routes.dart';
import 'package:itunes_video_app/features/authentication/view_model/signin_provider.dart';
import 'package:itunes_video_app/features/authentication/view_model/signup_provider.dart';
import 'package:itunes_video_app/features/home/view_model/find_music_provider.dart';
import 'package:itunes_video_app/features/home/view_model/my_music_provider.dart';
import 'package:itunes_video_app/features/home/view_model/video_controller_provider.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SigninProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignupProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FindMusicProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => VideoControllerProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MyMusicProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          //primarySwatch: Colors.blue,
          useMaterial3: true),
      initialRoute: '/',
      onGenerateRoute: AppRoutes().routes,
    );
  }
}
