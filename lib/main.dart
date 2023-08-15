import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:legalkan/locator.dart';
import 'package:legalkan/route.dart';
import 'package:legalkan/service/firebase_service.dart';
import 'package:legalkan/service/notification_service.dart';
import 'package:legalkan/ui/pages/login_page.dart';
import 'package:legalkan/ui/pages/splash_screen.dart';
import 'package:legalkan/ui/pages/user_main_pages/user_main_page.dart';
import 'package:legalkan/utils/custom_navigator.dart';
import 'common/styles.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await initFirebase();
  await NotificationService().init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: primaryColor
  ));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      debugPrint("FIREBASE ON MESSAGE : $message");
      debugPrint("FIREBASE ON MESSAGE DATA : ${message.data}");
      await NotificationService.showNotification(message.data);
    });
    Future.delayed(Duration.zero, () {
      getFCMToken().then((value) {
        debugPrint("FCM TOKEN : $value");
      });
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Legalkan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: primaryColor,
          onPrimary: Colors.white,
          secondary: secondaryColor,
        ),
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: myTextTheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: blue,
            foregroundColor: Colors.white,
            textStyle: myTextTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        ),
      ),
      navigatorKey: locator<NavigationCustom>().navigatorKey,
      home: const SplashScreen(),
      onGenerateRoute: routeGenerators,
    );
  }
}