import 'package:flutter/material.dart';
import 'package:legalkan/common/dimensions.dart';
import 'package:legalkan/common/styles.dart';
import 'package:legalkan/ui/widgets/custom_button.dart';

class RecommendationOutputPage extends StatelessWidget {

  static const route = "/recommendation-output-page";

  const RecommendationOutputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Rekomendasi kami", style: appbarTitleStyle,),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: defaultMarginSize),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: defaultMarginSize, right: defaultMarginSize, top: defaultMarginSize),
              child: Text(
                "Halo, berdasarkan form yang anda inputkan. berikut rekomendasi daftar dokumen yang anda butuhkan !",
                style: myTextTheme.bodyMedium?.copyWith(),
              ),
            ),
            ...dummyRecommendationData.map((e) => RecommendationDocumentWidget(data: e)).toList()
          ],
        ),
      ),
    );
  }
}

class RecommendationDocumentWidget extends StatelessWidget {
  final RecommendationFileData data;

  const RecommendationDocumentWidget({
    required this.data,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultMarginSize, right: defaultMarginSize, top: defaultMarginSize),
      padding: EdgeInsets.all(defaultMarginSize),
      width: double.infinity,
      decoration: whiteCardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Image.asset('assets/images/pdf.png', width: 40, height: 40,),
              const SizedBox(width: smallMarginSize,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.fileName, style: myTextTheme.bodyMedium?.copyWith(fontSize: 14, fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Icon(Icons.more_vert_rounded, color: primaryColor.withOpacity(0.4),)
            ],
          ),
          const SizedBox(height: defaultMarginSize,),
          Text(data.desc, style: myTextTheme.bodyMedium?.copyWith(),),
          const SizedBox(height: smallMarginSize,),
          CustomButton(
            text: "Konfirmasi",
            textStyle: myTextTheme.labelLarge?.copyWith(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
            height: 30,
            width: 120,
            onPressed: () {

            },
          )
        ],
      ),
    );
  }
}

class RecommendationFileData {
  final String fileUrl;
  final String fileName;
  final String desc;

  RecommendationFileData(this.fileUrl, this.fileName, this.desc);
}

final dummyRecommendationData = [
  RecommendationFileData('', 'Surat Perizinan Usaha', 'Seperti yang disebutkan sebelumnya, SIUP atau surat izin usaha perdagangan adalah sebuah dokumen yang menjadi bukti sebuah perusahaan untuk melakukan kegiatan usaha perdagangan. SIUP terbagi menjadi empat yaitu SIUP mikro, SIUP kecil, SIUP menengah, dan SIUP besar.'),
  RecommendationFileData('', 'Surat Perizinan Usaha', 'Seperti yang disebutkan sebelumnya, SIUP atau surat izin usaha perdagangan adalah sebuah dokumen yang menjadi bukti sebuah perusahaan untuk melakukan kegiatan usaha perdagangan. SIUP terbagi menjadi empat yaitu SIUP mikro, SIUP kecil, SIUP menengah, dan SIUP besar.'),
  RecommendationFileData('', 'Surat Perizinan Usaha', 'Seperti yang disebutkan sebelumnya, SIUP atau surat izin usaha perdagangan adalah sebuah dokumen yang menjadi bukti sebuah perusahaan untuk melakukan kegiatan usaha perdagangan. SIUP terbagi menjadi empat yaitu SIUP mikro, SIUP kecil, SIUP menengah, dan SIUP besar.'),
];
