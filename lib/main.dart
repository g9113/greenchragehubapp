import 'package:get/get.dart';
import 'package:greenchargehub/auth/mobile.dart';
import 'package:greenchargehub/home_page.dart';
import 'package:flutter/material.dart';
import 'package:greenchargehub/welcome.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer_pro/sizer.dart';
import 'package:firebase_core/firebase_core.dart';

import 'auth/controller.dart';
import 'firebase_options.dart';

Widget defaulthome = WelcomeScreen();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool? logged = prefs.getBool("islogged");
  if(logged==true){
    defaulthome = HomePage();
  }


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => OnBoardNotifier()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        title: 'greenchargehub',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home:
            defaulthome, // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
