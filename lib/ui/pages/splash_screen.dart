import 'package:flutter/material.dart';
import 'package:legalkan/locator.dart';
import 'package:legalkan/ui/pages/login_page.dart';
import 'package:legalkan/ui/pages/user_main_pages/user_main_page.dart';
import 'package:legalkan/utils/custom_navigator.dart';
import '../../common/dimensions.dart';
import '../../common/styles.dart';

class SplashScreen extends StatefulWidget {
  static const route = '/splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      locator<NavigationCustom>().navigateReplace(LoginPage.route);
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultMarginSize, ),
                child: Column(
                  children: [
                    const SizedBox(height: 80,),
                    Image.asset('assets/images/logo.png', height: 80, fit: BoxFit.cover, ),
                    const SizedBox(height: bigMarginSize,),
                    Text("One Stop Solution Business legal and Mobile Consulting using\nGenerative AI", textAlign: TextAlign.center, style: myTextTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Image.asset('assets/images/splash_image.png'),
              )
            ],
          ),
        )
      ),
    );
  }
}
