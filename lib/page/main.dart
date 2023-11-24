import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'intro_page.dart';
import 'login_page.dart';
import 'my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('en', 'US'), Locale('km', 'kmer')],
      title: 'SOMO',
      theme: ThemeData(useMaterial3: true),
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
          Duration duration = const Duration(seconds: 3);
          await Future.delayed(duration, () {
            Get.offAll(LoginPage());
          });
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
    return Text("Error: ${snapshot.error}");
  } else if (snapshot.hasData) {
    var userInfo = snapshot.data;
    if (userInfo != "") {
      return const MyHomePage();
    } else {
      return LoginPage();
    }
  } else {
    return const IntroPage();
  }
}
