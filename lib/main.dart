import 'package:agile_frontend/page/home_information.dart';
import 'package:agile_frontend/page/my_home_page.dart';
import 'package:agile_frontend/service/agent_data_provider_service.dart';
import 'package:agile_frontend/service/agent_data_review_provider_service.dart';
import 'package:agile_frontend/service/bottom_bar_provider.dart';
import 'package:agile_frontend/service/house_data_provider_service.dart';
import 'package:agile_frontend/service/house_review_data_provider_service.dart';
import 'package:agile_frontend/service/user_data_provider_service.dart';
import 'package:agile_frontend/util/db/firebase_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'page/intro_page.dart';

void main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => (HouseDataProviderService())),
      ChangeNotifierProvider(create: (context) => (AgentDataProviderService())),
      ChangeNotifierProvider(
          create: (context) => (HouseReviewDataProviderService())),
      ChangeNotifierProvider(
          create: (context) => (AgentReviewDataProviderService())),
      ChangeNotifierProvider(create: (context) => (UserDataProviderService())),
      ChangeNotifierProvider(create: (context) => (BottomBarProvider())),
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
            await initFireStore.initAgentAndHouseData();
          }

          querySnapshot = await firestore.collection('user').get();
          if (querySnapshot.docs.isEmpty) {
            await initFireStore.initUserData();
          }

          querySnapshot = await firestore.collection('house_review').get();
          if (querySnapshot.docs.isEmpty) {
            await initFireStore.initHouseReviewData();
          }

          querySnapshot = await firestore.collection('agent_review').get();
          if (querySnapshot.docs.isEmpty) {
            await initFireStore.initAgentReviewData();
          }

          var houseDataProviderService =
              context.read<HouseDataProviderService>();
          var agentDataProviderService =
              context.read<AgentDataProviderService>();

          var houseReviewDataProviderService =
              context.read<HouseReviewDataProviderService>();
          var agentReviewDataProviderService =
              context.read<AgentReviewDataProviderService>();
          var userDataProviderService = context.read<UserDataProviderService>();

          await houseDataProviderService.loadHouseData();

          await agentDataProviderService.loadAgentData();

          await houseReviewDataProviderService.loadHouseReviewData();

          await agentReviewDataProviderService.loadAgentReviewData();

          await userDataProviderService.loadUserData();

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
      return const MyHomePage();
    } else {
      // not logged in (token does not exist)
      return HomeInformation();
    }
  } else {
    // loading
    return const IntroPage();
  }
}
