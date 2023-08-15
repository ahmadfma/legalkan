import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:legalkan/ui/pages/splash_screen.dart';
import 'package:legalkan/ui/widgets/default_user_image.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../common/styles.dart';
import '../../common/dimensions.dart';
import '../widgets/profile_menu.dart';
import 'detail_profile_page.dart';

class SettingPage extends StatefulWidget {
  static const route = "/setting-page";

  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  XFile? selectedProfileImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Setting",
          style: myTextTheme.titleLarge?.copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultMarginSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    child: Image.asset('assets/images/me.jpg', fit: BoxFit.cover, height: 120, width: 120,),),
                ),
                const SizedBox(
                  height: defaultMarginSize,
                ),
                Text(
                  "Ahmad Fathanah M.Adil",
                  style: myTextTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                const SizedBox(height: 4,),
                Text(
                  "ahmadfathanah05@gmail.com",
                  style: myTextTheme.titleSmall?.copyWith(fontSize: 14, color: greyText3),
                ),
              ],
            ),
            const SizedBox(
              height: defaultMarginSize,
            ),
            ProfileMenu(
              icons: Icons.image_outlined,
              text: "Ganti Foto",
              onClick: () {
                //Navigator.of(context).pushNamed(ChangePhotoPage.route);
                pickPhoto();
              },
            ),
            ProfileMenu(
              icons: Icons.account_circle_outlined,
              text: "Profile",
              onClick: () {
                Navigator.of(context).pushNamed(DetailProfilePage.route);
              },
            ),
            ProfileMenu(
              icons: Icons.mail_outline_rounded,
              text: "Hubungi Kami",
              onClick: () {
                launchEmail();
              },
            ),
            ProfileMenu(
              icons: Icons.logout,
              text: "Logout",
              onClick: () {
                Navigator.of(context).pushNamedAndRemoveUntil(SplashScreen.route, (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }

  void pickPhoto() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedProfileImage = image;
      });
    }
  }

  void launchEmail() async {
    final uri = Uri(
        scheme: 'mailto',
        path: 'unhas.merdeka@gmail.com',
        queryParameters: {
          'subject': 'From Mobile App',
          'body': 'Default body'
        }
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      showSnackBar("Terjadi kesalahan saat memuat email");
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}