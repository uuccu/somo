import 'package:agile_frontend/routing/bottom_bar_routing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'page/intro_page.dart';
import 'page/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('en', 'US'), Locale('km', 'kmer')],
      title: 'SOMO',
      theme: ThemeData(useMaterial3: true, fontFamily: 'apple'),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: () async {
          // await initializeDateFormatting();
          // await dotenv.load(fileName: 'asset/config/.env');
          // var userInfoKey = dotenv.env['USER_INFO']!;
          // var userInfo = await storage.read(key: userInfoKey);
          // if (userInfo != null) {
          //   return userInfo;
          // }

          WidgetsFlutterBinding.ensureInitialized();
          await Firebase.initializeApp();

          Duration duration = const Duration(seconds: 1);
          // await Future.delayed(duration, () {
          //   Get.offAll(LoginPage());
          // });
          return "";
        }(),
        builder: (context, snapshot) {
          return AnimatedSwitcher(
              duration: const Duration(milliseconds: 1000),
              child: _splashLoadingWidget(snapshot));
        },
      ),
    );
  }
}

Widget _splashLoadingWidget(AsyncSnapshot snapshot) {
  if (snapshot.hasError) {
    return Text("Error1: ${snapshot.error}");
  } else if (snapshot.hasData) {
    var userInfo = snapshot.data;
    if (userInfo != "") {
      // already logged in (token exists)
      return BottomBarRoutingPage();
    } else {
      // not logged in (token does not exist)
      return LoginPage();
    }
  } else {
    // loading
    return const IntroPage();
  }
}
