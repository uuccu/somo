import 'package:agile_frontend/firebase_options.dart';
import 'package:agile_frontend/routing/bottom_bar_routing_page.dart';
import 'package:agile_frontend/service/agent_data_provider_service.dart';
import 'package:agile_frontend/service/house_data_provider_service.dart';
import 'package:agile_frontend/util/db/firebase_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'page/intro_page.dart';
import 'page/login_page.dart';

void main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => (HouseDataProviderService())),
      ChangeNotifierProvider(create: (context) => (AgentDataProviderService())),
    ],
    child: const MyApp(),
  ));
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
          WidgetsFlutterBinding
              .ensureInitialized(); // this line is upper than others

          await Firebase.initializeApp(
              // options: DefaultFirebaseOptions.currentPlatform,// if you want deploy to web, you should use this line
              );

          InitFireStore initFireStore = InitFireStore();
          final FirebaseFirestore firestore = FirebaseFirestore.instance;
          QuerySnapshot querySnapshot =
              await firestore.collection('agent').get();
          if (querySnapshot.docs.isEmpty) {
            await initFireStore.initData();
          }

          var houseDataProviderService =
              context.read<HouseDataProviderService>();
          var agentDataProviderService =
              context.read<AgentDataProviderService>();

          await houseDataProviderService.loadHouseData();

          await agentDataProviderService.loadAgentData();

          return "";
        }(),
        builder: (context, snapshot) {
          if (snapshot.data == null) return const IntroPage();

          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 1000),
            child: _splashLoadingWidget(snapshot),
          );
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
