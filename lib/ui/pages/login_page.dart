import 'package:flutter/material.dart';
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(left: defaultMarginSize, right: defaultMarginSize, bottom: extraBixMarginSize),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.1,),
                    Wrap(
                      direction: Axis.horizontal,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Image.asset("assets/images/logo_unhas.png", height: 60,),
                        const SizedBox(width: 30,),
                        const Icon(Icons.close, color: lightRed,),
                        const SizedBox(width: 30,),
                        Image.asset('assets/images/logo_kampus_merdeka.png',height: 60,)
                      ],
                    ),
                    const SizedBox(height: 30,),
                    Text("Universitas Hasanuddin", style: myTextTheme.titleLarge?.copyWith(fontSize: 18, fontWeight: FontWeight.w700),),
                    Text.rich(
                        TextSpan(
                            children: [
                              TextSpan(
                                  text: "Kampus ",
                                  style: myTextTheme.titleLarge?.copyWith(fontSize: 14, fontWeight: FontWeight.w700, color: primaryColor)
                              ),
                              TextSpan(
                                  text: "Merdeka",
                                  style: myTextTheme.titleLarge?.copyWith(fontSize: 14, fontWeight: FontWeight.w700, color: blue)
                              )
                            ]
                        )
                    ),
                    const SizedBox(height: 50,),
                    CustomTextField(
                      hint: 'Username',
                      label: 'Masukkan NIM anda',
                      boxDecoration: BoxDecoration(
                        border: Border.all(color: lightBlue2, width: 1),
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        color:  lightBlue4
                      ),
                      onChanged: (value) {

                      },
                    ),
                    const SizedBox(height: bigMarginSize,),
                    CustomTextField(
                      hint: 'Password',
                      isObscureText: true,
                      label: 'Masukkan password anda',
                      boxDecoration: BoxDecoration(
                          border: Border.all(color: lightBlue2, width: 1),
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          color:  lightBlue4
                      ),
                      onChanged: (value) {

                      },
                    ),
                    const SizedBox(height: superBigMarginSize
                      ,),
                    CustomButton(
                      onPressed: () {
                        locator<NavigationCustom>().navigateReplace(UserMainPage.routeName);
                        //Navigator.of(context).pushNamedAndRemoveUntil(MainPage.routeName, ModalRoute.withName('/'));
                      },
                      text: 'Masuk',
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
                  child: Text("Butuh Bantuan ? ", style: myTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700, color: blue),),
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
