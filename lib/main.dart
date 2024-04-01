import 'package:flutter/material.dart';
import 'login_page.dart';
import 'registeration_page.dart';
import 'welcomepage.dart';
import 'package:firebase_core/firebase_core.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyBgbwhwN85mA95eAT4eX5kOrUodBeaxx_I',
        appId: '1:172562615941:android:32694c39e32ec6be4f23ec',
        messagingSenderId: '172562615941',
        projectId: 'netflixclone-878c5')
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // set to false to remove debug banner
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: NetflixLoginPage.id,
      routes: {
        NetflixLoginPage.id:(context)=>NetflixLoginPage(),
        Registeration_page.id:(context)=>Registeration_page(),
        WelcomePage.id:(context)=>WelcomePage(),
      },
    );
  }
}
