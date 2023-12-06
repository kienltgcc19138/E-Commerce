import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_ecommerce/constant/theme.dart';
import 'package:youtube_ecommerce/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:youtube_ecommerce/firebase_helper/firebase_options/firebase_options.dart';
import 'package:youtube_ecommerce/provider/app_provider.dart';
import 'package:youtube_ecommerce/screens/auth_ui/welcome/welcome.dart';
import 'package:youtube_ecommerce/screens/custom_bottom_bar/custom_bottom_bar.dart';
import 'package:youtube_ecommerce/screens/home/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseConfig.platformOptions,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Youtube Ecommerce',
          theme: themeData,
          home: StreamBuilder(
            stream: FirebaseAuthHelper.instance.getAuthChange,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const CustomBottomBar();
              }
              return const Welcome();
            },
          )),
    );
  }
}
