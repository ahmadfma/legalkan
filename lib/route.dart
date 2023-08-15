import 'package:flutter/material.dart';
import 'package:legalkan/core/models/document.dart';
import 'package:legalkan/ui/pages/activity_subject_page.dart';
import 'package:legalkan/ui/pages/add_activity_subject_page.dart';
import 'package:legalkan/ui/pages/change_photo_page.dart';
import 'package:legalkan/ui/pages/create_document_page.dart';
import 'package:legalkan/ui/pages/detail_activity_page.dart';
import 'package:legalkan/ui/pages/detail_profile_page.dart';
import 'package:legalkan/ui/pages/document_page.dart';
import 'package:legalkan/ui/pages/information_center_page.dart';
import 'package:legalkan/ui/pages/login_page.dart';
import 'package:legalkan/ui/pages/mahasiswa_bimbingan_activity_page.dart';
import 'package:legalkan/ui/pages/recommendation_output_page.dart';
import 'package:legalkan/ui/pages/review_output_page.dart';
import 'package:legalkan/ui/pages/splash_screen.dart';
import 'package:legalkan/ui/pages/user_main_pages/user_main_page.dart';
import 'package:legalkan/ui/pages/user_main_pages/pages/legal_recommendation_page.dart';
import 'package:legalkan/ui/pages/registration_page.dart';
import 'package:legalkan/ui/pages/update_final_status_activity_page.dart';

import 'core/models/my_activity.dart';

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
    case DetailActivityPage.route:
      final activity = settings.arguments as MyActivity;
      return MaterialPageRoute(builder: (context) => DetailActivityPage(myActivity: activity));
    case DocumentPage.route:
      final displayOnly = settings.arguments as bool?;
      return MaterialPageRoute(builder: (context) => DocumentPage(displayOnly: displayOnly ?? false,),);
    case CreateDocumentPage.route:
      return MaterialPageRoute(builder: (context) => const CreateDocumentPage(),);
    case ActivitySubjectPage.route:
      return MaterialPageRoute(builder: (context) => const ActivitySubjectPage(),);
    case AddActivitySubjectPage.route:
      return MaterialPageRoute(builder: (context) => const AddActivitySubjectPage(),);
    case LoginPage.route:
      return MaterialPageRoute(builder: (context) => const LoginPage(),);
    case LegalRecommendationPage.route:
      return MaterialPageRoute(builder: (context) => const LegalRecommendationPage(),);
    case InformationCenterPage.route:
      return MaterialPageRoute(builder: (context) => const InformationCenterPage(),);
    case UpdateFinalStatusActivityPage.route:
      return MaterialPageRoute(builder: (context) => const UpdateFinalStatusActivityPage(),);
    case ChangePhotoPage.route:
      return MaterialPageRoute(builder: (context) => const ChangePhotoPage(),);
    case DetailProfilePage.route:
      return MaterialPageRoute(builder: (context) => const DetailProfilePage(),);
    case MahasiswaBimbinganActivityPage.route:
      return MaterialPageRoute(builder: (context) => const MahasiswaBimbinganActivityPage(),);

    default:
      throw('Unknown Routes');
  }
}