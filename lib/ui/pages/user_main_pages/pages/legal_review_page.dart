import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legalkan/common/styles.dart';
import 'package:legalkan/ui/pages/review_output_page.dart';
import 'package:legalkan/ui/widgets/custom_button.dart';

import '../../../../common/dimensions.dart';
import '../../../../core/models/document.dart';
import '../../../widgets/menu_tile.dart';

class LegalReviewPage extends StatelessWidget {
  const LegalReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultMarginSize),
                child: SvgPicture.asset("assets/icons/upload.svg", color: green2, height: 100),
              ),
              const SizedBox(height: bigMarginSize,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultMarginSize),
                child: Text("Gak usah khawatir soal keamanan dokumenmu !", style: myTextTheme.titleLarge?.copyWith(fontSize: 22), textAlign: TextAlign.center),
              ),
              const SizedBox(height: 8,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultMarginSize),
                child: Text("Kami bisa memeriksa keamanan dokumenmu sesuai peraturan yang berlaku di indonesia", style: myTextTheme.bodyMedium?.copyWith(fontSize: 14),),
              ),
              const SizedBox(height: veryBigMarginSize,),
              InkWell(
                onTap: () {

                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: primaryColor
                  ),
                  padding: EdgeInsets.symmetric(horizontal: defaultMarginSize, vertical: mediumMarginSize),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Image.asset('assets/images/pdf.png', height: 20,),
                      const SizedBox(width: smallMarginSize,),
                      Text("Mulai upload", style: myTextTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12),)
                    ],
                  )
                ),
              ),
              const SizedBox(height: veryBigMarginSize,),
              Container(
                decoration: whiteCardDecoration.copyWith(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(35))
                ),
                width: double.infinity,
                height: 500,
                padding: EdgeInsets.symmetric(vertical: defaultMarginSize),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: defaultMarginSize),
                      child: Text("Daftar dokumen", style: myTextTheme.titleLarge?.copyWith(fontSize: 14, fontWeight: FontWeight.bold),),
                    ),
                    const SizedBox(height: defaultMarginSize,),
                    ...dummyDocuments
                        .map((e) => MenuTile(
                      iconAsset: 'assets/images/pdf.png',
                      title: e.name ?? "-",
                      subTitle: e.status == 0 ? "Sedang diproses" : "Selesai",
                      isDocument: true,
                      documentStatus: e.status,
                      onTap: () {
                        Navigator.of(context).pushNamed(ReviewOutputPage.route, arguments: e);
                      },
                    )).toList()
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
