import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legalkan/common/dimensions.dart';
import 'package:legalkan/common/styles.dart';
import 'package:legalkan/locator.dart';
import 'package:legalkan/ui/pages/user_main_pages/user_main_page.dart';
import 'package:legalkan/ui/widgets/custom_button.dart';
import 'package:legalkan/ui/widgets/custom_textfield.dart';
import 'package:legalkan/utils/custom_navigator.dart';

class LoginPage extends StatelessWidget {

  static const route = "/login-page";

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(left: defaultMarginSize, right: defaultMarginSize, bottom: extraBixMarginSize),
                child: Column(
                  children: [
                    const SizedBox(height: 50,),
                    Image.asset('assets/images/logo.png', height: 100,),
                    const SizedBox(height: 50,),
                    CustomTextField(
                      hint: 'Username',
                      boxDecoration: BoxDecoration(
                        border: Border.all(color: greyBackground, width: 1),
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        color:  backgroundColor
                      ),
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: defaultMarginSize,),
                    CustomTextField(
                      hint: 'Password',
                      isObscureText: true,
                      boxDecoration: BoxDecoration(
                          border: Border.all(color: greyBackground, width: 1),
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          color:  backgroundColor
                      ),
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: bigMarginSize,),
                    SizedBox(
                      width: double.infinity,
                      child: Text("Lupa Sandi ?", style: myTextTheme.bodyMedium?.copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: blue), textAlign: TextAlign.end),
                    ),
                    const SizedBox(height: bigMarginSize,),
                    CustomButton(
                      textStyle: myTextTheme.labelLarge?.copyWith(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),
                      onPressed: () {
                        locator<NavigationCustom>().navigateReplace(UserMainPage.routeName);
                      },
                      text: 'Masuk',
                    ),
                    const SizedBox(height: superBigMarginSize,),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: greyBackground,
                          ),
                        ),
                        const SizedBox(width: smallMarginSize,),
                        Text("Atau masuk dengan", style: myTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500, color: Colors.grey[600]),),
                        const SizedBox(width: smallMarginSize,),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: greyBackground,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: bigMarginSize,),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: smallMarginSize),
                            decoration: BoxDecoration(
                              border: Border.all(color: greyBackground, width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(4))
                            ),
                            child: Center(
                              child: SvgPicture.asset('assets/icons/facebook_ic.svg', height: 25),
                            ),
                          ),
                        ),
                        const SizedBox(width: defaultMarginSize,),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: smallMarginSize),
                            decoration: BoxDecoration(
                                border: Border.all(color: greyBackground, width: 1),
                                borderRadius: BorderRadius.all(Radius.circular(4))
                            ),
                            child: Center(
                              child: SvgPicture.asset('assets/icons/google_ic.svg', height: 25),
                            ),
                          ),
                        ),
                        const SizedBox(width: defaultMarginSize,),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: smallMarginSize),
                            decoration: BoxDecoration(
                                border: Border.all(color: greyBackground, width: 1),
                                borderRadius: BorderRadius.all(Radius.circular(4))
                            ),
                            child: Center(
                              child: SvgPicture.asset('assets/icons/cib_apple.svg', height: 25),
                            ),
                          ),
                        ),

                      ],
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 1,
                  color: lightBlue4,
                ),
                const SizedBox(height: defaultMarginSize,),
                InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Belum tersedia saat ini")));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Belum memiliki akun ? "),
                      const SizedBox(width: smallMarginSize,),
                      Text("Daftar Sekarang", style: myTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700, color: blue),),
                    ],
                  ),
                ),
                const SizedBox(height: defaultMarginSize,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
