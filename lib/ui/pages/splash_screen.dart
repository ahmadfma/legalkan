import 'package:flutter/material.dart';
import 'package:legalkan/locator.dart';
import 'package:legalkan/ui/pages/login_page.dart';
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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Image.asset("assets/images/logo_unhas.png", height: 80,),
                const SizedBox(width: 26,),
                Image.asset('assets/images/logo_kampus_merdeka.png',height: 80,)
              ],
            ),
            const SizedBox(height: 50,),
            Text("Universitas Hasanuddin", style: myTextTheme.titleLarge?.copyWith(fontSize: 22, fontWeight: FontWeight.w700),),
            Text.rich(
                TextSpan(
                    children: [
                      TextSpan(
                          text: "Kampus ",
                          style: myTextTheme.titleLarge?.copyWith(fontSize: 18, fontWeight: FontWeight.w700, color: primaryColor)
                      ),
                      TextSpan(
                          text: "Merdeka",
                          style: myTextTheme.titleLarge?.copyWith(fontSize: 18, fontWeight: FontWeight.w700, color: blue)
                      )
                    ]
                )
            ),
            const SizedBox(height: 50,),
            const CircularProgressIndicator(),
            const SizedBox(height: defaultMarginSize,),
            Text("Please wait...", style: myTextTheme.bodySmall?.copyWith(),)
          ],
        ),
      ),
    );
  }
}
