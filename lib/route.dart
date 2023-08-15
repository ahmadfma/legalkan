import 'package:flutter/material.dart';
import 'package:legalkan/core/models/document.dart';
import 'package:legalkan/ui/pages/detail_profile_page.dart';
import 'package:legalkan/ui/pages/lawyer_consult_page.dart';
import 'package:legalkan/ui/pages/login_page.dart';
import 'package:legalkan/ui/pages/recommendation_output_page.dart';
import 'package:legalkan/ui/pages/review_output_page.dart';
import 'package:legalkan/ui/pages/setting_page.dart';
import 'package:legalkan/ui/pages/splash_screen.dart';
import 'package:legalkan/ui/pages/user_main_pages/pages/legal_consultant_page.dart';
import 'package:legalkan/ui/pages/user_main_pages/user_main_page.dart';
import 'package:legalkan/ui/pages/user_main_pages/pages/legal_recommendation_page.dart';
import 'package:legalkan/ui/pages/registration_page.dart';

Route<dynamic> routeGenerators(settings) {
  switch(settings.name) {
    case UserMainPage.routeName:
      return MaterialPageRoute(builder: (context) => const UserMainPage());
    case SplashScreen.route:
      return MaterialPageRoute(builder: (context) => const SplashScreen(),);
    case RecommendationOutputPage.route:
      return MaterialPageRoute(builder: (context) => const RecommendationOutputPage(),);
    case ReviewOutputPage.route:
      final document = settings.arguments as Document;
      return MaterialPageRoute(builder: (context) => ReviewOutputPage(document: document),);
    case RegistrationPage.route:
      return MaterialPageRoute(builder: (context) => const RegistrationPage());
    case LoginPage.route:
      return MaterialPageRoute(builder: (context) => const LoginPage(),);
    case LegalRecommendationPage.route:
      return MaterialPageRoute(builder: (context) => const LegalRecommendationPage(),);
    case DetailProfilePage.route:
      return MaterialPageRoute(builder: (context) => const DetailProfilePage(),);
    case LawyerConsultPage.route:
      final lawyer = settings.arguments as Lawyer;
      return MaterialPageRoute(builder: (context) => LawyerConsultPage(lawyer: lawyer),);
    case SettingPage.route:
      return MaterialPageRoute(builder: (context) => const SettingPage(),);

    default:
      throw('Unknown Routes');
  }
}