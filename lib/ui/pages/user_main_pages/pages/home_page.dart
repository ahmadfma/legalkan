import 'package:flexible_grid_view/flexible_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:legalkan/common/dimensions.dart';
import 'package:legalkan/core/models/activity_type.dart';
import 'package:legalkan/core/models/testimoni.dart';
import 'package:legalkan/ui/pages/document_page.dart';
import 'package:legalkan/ui/pages/information_center_page.dart';
import 'package:legalkan/ui/pages/registration_page.dart';
import 'package:legalkan/ui/widgets/activity_type.dart';
import 'package:legalkan/ui/widgets/default_user_image.dart';
import 'package:legalkan/ui/widgets/home_topbar_menu.dart';
import 'package:legalkan/ui/widgets/testimoni.dart';
import '../../../../common/styles.dart';
import '../../detail_profile_page.dart';
import 'activity_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topBar(context),
              activityType(context),
              testimoni(context),
              const SizedBox(height: 50,),
              bottomImage(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget topBar(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return Stack(
    children: [
      SizedBox(height: size.height * 0.7,), //stack height
      SizedBox(
        height:  size.height * 0.6,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(80)),
          child: Image.asset("assets/images/home_appbar_background.png", fit: BoxFit.cover),
        ),
      ),
      Positioned(
        top: 16,
        left: 16,
        child: Image.asset("assets/images/logo_unhas.png", width: 50,),
      ),
      Positioned(
        top: 26,
        left: 0,
        right: 0,
        child: Column(
          children: [
            Text("Beranda", style: myTextTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),),
            const SizedBox(height: veryBigMarginSize,),
            const DefaultUserImage(),
            const SizedBox(height: defaultMarginSize,),
            Text("Ahmad Fathanah M.Adil", style: myTextTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w600),),
            const SizedBox(height: smallMarginSize,),
            Text("D121191048", style: myTextTheme.titleSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w400),),
            const SizedBox(height: smallMarginSize,),
            Text("Teknik Informatika", style: myTextTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w500),),
            const SizedBox(height: 34,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultMarginSize),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeTopBarMenu(
                    onTap: () {
                      Navigator.of(context).pushNamed(ActivityPage.route);
                    },
                    title: 'Kegiatan Saya',
                    imageAsset: 'assets/images/biography.png',
                  ),
                  HomeTopBarMenu(
                    onTap: () {
                      Navigator.of(context).pushNamed(DocumentPage.route, arguments: true);
                    },
                    title: 'Dokumen Saya',
                    imageAsset: 'assets/images/notes.png',
                  ),
                  HomeTopBarMenu(
                    onTap: () {
                      Navigator.of(context).pushNamed(InformationCenterPage.route);
                    },
                    title: 'Pusat Informasi',
                    imageAsset: 'assets/images/warning.png',
                  ),
                  HomeTopBarMenu(
                    onTap: () {
                      Navigator.of(context).pushNamed(DetailProfilePage.route);
                    },
                    title: 'Profile',
                    imageAsset: 'assets/images/activity.png',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 34,),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(horizontal: defaultMarginSize),
              elevation: 3,
              child: Container(
                width: double.infinity,
                height: size.height * 0.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Kampus Merdeka", style: myTextTheme.bodyLarge?.copyWith(color: blue, fontWeight: FontWeight.w900, fontSize: 18),),
                          const SizedBox(height: smallMarginSize,),
                          Container(
                            constraints: BoxConstraints(
                                maxWidth: size.width * 0.7
                            ),
                            child: Text("Daftar dirimu di program kampus merdeka untuk mendapatkan pengalaman lebih", style: myTextTheme.bodySmall?.copyWith(color: greyText3, fontWeight: FontWeight.w500, height: 1.5),),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: -40,
                      right: -5,
                      child: Image.asset('assets/images/champions2.png', width: 140,),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 14,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RegistrationPage.route);
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 46),
                          child: Text("Daftar"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    ],
  );
}

Widget activityType(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: defaultMarginSize, right: defaultMarginSize, top: bigMarginSize),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Jenis Kegiatan", style: myTextTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),),
        const SizedBox(height: defaultMarginSize,),
        FlexibleGridView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          axisCount: GridLayoutEnum.twoElementsInRow,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: [
            ...dummyActivityTypes.map((e) => ActivityTypeWidget(e)).toList()
          ],
        ),
      ],
    ),
  );
}

Widget testimoni(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: defaultMarginSize, right: defaultMarginSize, top: bigMarginSize),
        child: Text("Testimoni", style: myTextTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(right: defaultMarginSize),
        child: Row(
          children: [
            ...dummyTestimoni.map((e) => TestimoniWidget(testimoni: e)).toList()
          ],
        ),
      )
    ],
  );
}

Widget bottomImage(BuildContext context) {
  return Stack(
    children: [
      Image.asset('assets/images/champions.png', width: double.infinity,),
      Positioned(
        bottom: 16,
        right: 0,
        left: 0,
        child: Center(child: Text("Keep On Fighting Till The End", style: myTextTheme.bodySmall?.copyWith(color: Colors.white, fontSize: 10),),),
      )
    ],
  );
}