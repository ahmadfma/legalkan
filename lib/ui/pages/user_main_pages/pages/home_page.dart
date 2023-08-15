import 'package:flutter/material.dart';
import 'package:legalkan/common/dimensions.dart';
import 'package:legalkan/ui/pages/setting_page.dart';
import 'package:legalkan/ui/widgets/article_widget_horizontal.dart';
import 'package:legalkan/ui/widgets/feauture_card_widget.dart';
import '../../../../common/styles.dart';
import '../../../../core/models/document.dart';
import '../../../widgets/menu_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topBar(context),
              const SizedBox(height: defaultMarginSize,),
              featureCard(context),
              const SizedBox(height: veryBigMarginSize,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: backgroundColor2,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))
                ),
                child: Column(
                  children: [
                    const SizedBox(height: mediumMarginSize,),
                    Container(
                      height: 3,
                      width: 80,
                      color: greyBackground,
                    ),
                    const SizedBox(height: veryBigMarginSize,),
                    documentLegal(context),
                    const SizedBox(height: mediumMarginSize,),
                    articles(context),
                    const SizedBox(height: veryBigMarginSize,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget topBar(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
/*      const SizedBox(height: defaultMarginSize,),
      Padding(padding: EdgeInsets.only(left: defaultMarginSize), child: Image.asset("assets/images/logo.png", height: 40,),),*/
      Padding(
        padding: const EdgeInsets.only(left: defaultMarginSize, right: defaultMarginSize, top: defaultMarginSize),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              child: Image.asset("assets/images/me.jpg", fit: BoxFit.cover, height: 60, width: 60,),),
            const SizedBox(width: mediumMarginSize,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ahmad Fathanah M.Adil", style: myTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600, fontSize: 14),),
                  Text("ahmadfathanah05@gmail.com", style: myTextTheme.bodyMedium?.copyWith(fontSize: 12),),
                  const SizedBox(height: 2,),
                  Text("Makassar, Sulawesi Selatan", style: myTextTheme.bodyMedium?.copyWith(fontSize: 12, color: Colors.grey),)
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(SettingPage.route);
              },
              child: Icon(Icons.settings, color: primaryColor,),
            )
          ],
        ),
      ),
    ],
  );
}

Widget featureCard(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    padding: EdgeInsets.symmetric(horizontal: defaultMarginSize),
    child: Row(
      children: [
        FeatureCardWidget(
          title: "Rekomendasi",
          backgroundColor: secondaryColor,
          backgroundImagePath: "assets/images/feature_image_background.png",
          iconImagePath: "assets/images/rekomendasi.png",
          subTitle: "ketahui daftar dokumen yang anda butuhkan",
          iconBackgroundColor: orange,
        ),
        FeatureCardWidget(
          title: "Review",
          backgroundColor: green2,
          backgroundImagePath: "assets/images/feature_image_background2.png",
          iconImagePath: "assets/images/review.png",
          subTitle: "Ketahui keamanan dokumen yang anda miliki",
          iconBackgroundColor: primaryColor,
        ),
        FeatureCardWidget(
          title: "Consultant",
          backgroundColor: orange,
          backgroundImagePath: "assets/images/feature_image_background3.png",
          iconImagePath: "assets/images/assistant.png",
          subTitle: "Dapatkan konsultan yang sesuai untuk bisnis anda",
          backgroundImageColor: Colors.white.withOpacity(1),
          iconBackgroundColor: secondaryColor,
        ),
        FeatureCardWidget(
          title: "Assistant",
          backgroundColor: blue,
          backgroundImagePath: "assets/images/feature_image_background3.png",
          iconImagePath: "assets/images/consultant.png",
          subTitle: "Dapatkan informasi legal yang sesuai dan tepat",
          backgroundImageColor: Colors.white.withOpacity(0.6),
          iconBackgroundColor: green2,
        ),
      ],
    ),
  );
}

Widget documentLegal(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(
          left: defaultMarginSize,
          right: defaultMarginSize,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Ketetapan Pemerintah",
              style: myTextTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            Text(
              "Selengkapnya",
              style: myTextTheme.bodySmall?.copyWith(fontSize: 12, fontWeight: FontWeight.w600, color: blue),
            ),
          ],
        ),
      ),
      const SizedBox(height: defaultMarginSize,),
      ...dummyDocuments
          .map((e) => MenuTile(
        iconAsset: 'assets/images/pdf.png',
        title: e.name ?? "-",
        subTitle: "Tahun 2023",
        isDocument: true,
        isMine: false,
        documentStatus: e.status,
        onTap: () {},
      )).toList()
    ],
  );
}

Widget articles(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(
          left: defaultMarginSize,
          right: defaultMarginSize,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Artikel",
              style: myTextTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            Text(
              "Selengkapnya",
              style: myTextTheme.bodySmall?.copyWith(fontSize: 12, fontWeight: FontWeight.w600, color: blue),
            ),
          ],
        ),
      ),
      const SizedBox(height: defaultMarginSize,),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: defaultMarginSize),
        child: Row(
          children: [
            ArticleWidgetHorizontal(imageUrl: '', title: '', desc: '', createdAt: ''),
            ArticleWidgetHorizontal(imageUrl: '', title: '', desc: '', createdAt: ''),
            ArticleWidgetHorizontal(imageUrl: '', title: '', desc: '', createdAt: ''),
          ],
        ),
      )
    ],
  );
}