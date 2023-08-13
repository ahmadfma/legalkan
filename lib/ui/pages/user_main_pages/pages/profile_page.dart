import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:legalkan/common/dimensions.dart';
import 'package:legalkan/ui/pages/detail_profile_page.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../common/styles.dart';
import '../../../widgets/profile_menu.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  XFile? selectedProfileImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
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
                    child: selectedProfileImage != null
                        ? ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(100)),
                            child: Image.file(File(selectedProfileImage!.path), fit: BoxFit.cover, height: 120, width: 120,),)
                        : Container(
                            width: 120,
                            height: 120,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: backgroundColor),
                            child: Center(
                              child: Image.asset(
                                "assets/images/user.png",
                                width: 55,
                                height: 55,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )),
                const SizedBox(
                  height: defaultMarginSize,
                ),
                Text(
                  "Ahmad Fathanah M.Adil",
                  style: myTextTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                const SizedBox(
                  height: smallMarginSize,
                ),
                Text(
                  "D121191048",
                  style: myTextTheme.titleSmall
                      ?.copyWith(fontSize: 14, color: greyText3),
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
                //TODO: logout
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