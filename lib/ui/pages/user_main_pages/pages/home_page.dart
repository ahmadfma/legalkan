import 'package:flexible_grid_view/flexible_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:legalkan/common/dimensions.dart';
import 'package:legalkan/core/models/activity_type.dart';
import 'package:legalkan/core/models/testimoni.dart';
import 'package:legalkan/ui/pages/document_page.dart';
import 'package:legalkan/ui/pages/information_center_page.dart';
import 'package:legalkan/ui/pages/registration_page.dart';
import 'package:legalkan/ui/widgets/activity_type.dart';
import 'package:legalkan/ui/widgets/article_widget.dart';
import 'package:legalkan/ui/widgets/default_user_image.dart';
import 'package:legalkan/ui/widgets/home_topbar_menu.dart';
import 'package:legalkan/ui/widgets/testimoni.dart';
import '../../../../common/styles.dart';
import '../../../../core/models/document.dart';
import '../../../widgets/menu_tile.dart';
import '../../detail_profile_page.dart';
import 'legal_recommendation_page.dart';

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
              documentType(context),
              article(context),
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
      SizedBox(height: size.height * 0.2,), //stack height
      SizedBox(
        height:  size.height * 0.23,
        width: double.infinity,
        child: ClipRRect(
          child: Container(
            color: primaryColor,
          )
        ),
      ),
      Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: defaultMarginSize, right: defaultMarginSize, top: defaultMarginSize),
              child: Row(
                children: [
                  const DefaultUserImage(iconSize: 25, size: 50,),
                  const SizedBox(width: smallMarginSize,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ahmad Fathanah M.Adil", style: myTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600, color: Colors.white),),
                        Text("ahmadfathanah05@gmail.com", style: myTextTheme.bodyMedium?.copyWith(color: Colors.white, fontSize: 12),)
                      ],
                    ),
                  ),
                  Icon(Icons.settings, color: Colors.white,)
                ],
              ),
            ),
            const SizedBox(height: semiBigMarginSize,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultMarginSize),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeTopBarMenu(
                    onTap: () {
                      Navigator.of(context).pushNamed(LegalRecommendationPage.route);
                    },
                    title: 'Rekomendasi',
                    imageAsset: 'assets/images/biography.png',
                  ),
                  HomeTopBarMenu(
                    onTap: () {
                      Navigator.of(context).pushNamed(DocumentPage.route, arguments: true);
                    },
                    title: 'Review',
                    imageAsset: 'assets/images/notes.png',
                  ),
                  HomeTopBarMenu(
                    onTap: () {
                      Navigator.of(context).pushNamed(InformationCenterPage.route);
                    },
                    title: 'Consultant',
                    imageAsset: 'assets/images/warning.png',
                  ),
                  HomeTopBarMenu(
                    onTap: () {
                      Navigator.of(context).pushNamed(DetailProfilePage.route);
                    },
                    title: 'Assistant',
                    imageAsset: 'assets/images/activity.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    ],
  );
}

Widget documentType(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: defaultMarginSize, top: defaultMarginSize, right: defaultMarginSize),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Dokumen Pemerintah", style: myTextTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600, fontSize: 14),),
            Text("Selengkapnya", style: myTextTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600, fontSize: 12, color: blue),),
          ],
        ),
      ),
      const SizedBox(height: defaultMarginSize,),
      SingleChildScrollView(
        child: Column(
          children: [
            ...dummyDocuments
                .map((e) => MenuTile(
              iconAsset: 'assets/images/pdf.png',
              title: e.name ?? "-",
              subTitle: e.status == 0 ? "Sedang diproses" : "Diterima",
              isDocument: true,
              documentStatus: e.status,
              onTap: () {},
            ))
                .toList()
          ],
        ),
      ),
    ],
  );
}

Widget article(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: defaultMarginSize, right: defaultMarginSize),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Artikel", style: myTextTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600, fontSize: 14),),
            Text("Selengkapnya", style: myTextTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600, fontSize: 12, color: blue),),
          ],
        ),
      ),
      const SizedBox(height: defaultMarginSize,),
      SingleChildScrollView(
        child: Column(
          children: [
            ArticleCard(
                title: "asldnasldknasld",
                author: "Ahmad Fathanah",
                content: "asdjkasnd akjsd asdlas dlasdjal skdjla skdjla s dljaslkdlaskjd laksjldasd",
                imageUrl: 'https://akcdn.detik.net.id/visual/2019/10/23/fe56d74a-2bcf-4129-bf03-c63a2eb0c0a6_169.jpeg?w=715&q=90'
            ),
            ArticleCard(
                title: "asldnasldknasld",
                author: "Ahmad Fathanah",
                content: "asdjkasnd akjsd asdlas dlasdjal skdjla skdjla s dljaslkdlaskjd laksjldasd",
                imageUrl: 'https://akcdn.detik.net.id/visual/2019/10/23/fe56d74a-2bcf-4129-bf03-c63a2eb0c0a6_169.jpeg?w=715&q=90'
            ),
            ArticleCard(
                title: "asldnasldknasld",
                author: "Ahmad Fathanah",
                content: "asdjkasnd akjsd asdlas dlasdjal skdjla skdjla s dljaslkdlaskjd laksjldasd",
                imageUrl: 'https://akcdn.detik.net.id/visual/2019/10/23/fe56d74a-2bcf-4129-bf03-c63a2eb0c0a6_169.jpeg?w=715&q=90'
            )
          ],
        ),
      ),
    ],
  );
}