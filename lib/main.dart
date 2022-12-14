import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'feauters/Adder/presentation/pages/homePage.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(apiKey: "AIzaSyAYO-cf1NMENaChLOB9KdnM2avxnoBaku4", appId: "1:1077724521511:android:8e7b5bb6fcbfe435b19a02", messagingSenderId: "", projectId: "flutterproject-339bb"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
