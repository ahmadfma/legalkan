import 'package:flutter/material.dart';
import 'package:legalkan/common/dimensions.dart';
import 'package:legalkan/common/styles.dart';
import 'package:legalkan/core/models/my_activity.dart';
import 'package:legalkan/ui/pages/recommendation_output_page.dart';
import 'package:legalkan/ui/widgets/custom_button.dart';
import 'package:legalkan/ui/widgets/custom_textfield.dart';

class LegalRecommendationPage extends StatelessWidget {
  static const route = '/legal-recommendation-page';

  const LegalRecommendationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(defaultMarginSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Biarkan kami membantu persoalan legalmu !", style: myTextTheme.titleLarge?.copyWith(fontSize: 24, fontWeight: FontWeight.w600),),
              const SizedBox(height: 8,),
              Text("Kami bisa memberikan daftar dokumen yang kamu butuhkan", style: myTextTheme.bodyMedium?.copyWith(fontSize: 14),),
              const SizedBox(height: defaultMarginSize,),
              CustomTextField(
                hint: 'Nama Usaha',
                onChanged: (value) {},
                isCardMode: true,
              ),
              const SizedBox(height: defaultMarginSize,),
              CustomTextField(
                hint: 'Deskripsi Usaha',
                onChanged: (value) {},
                isCardMode: true,
              ),
              const SizedBox(height: defaultMarginSize,),
              CustomTextField(
                hint: 'Total Karyawan',
                onChanged: (value) {},
                isCardMode: true,
              ),
              const SizedBox(height: defaultMarginSize,),
              CustomTextField(
                hint: 'Lokasi',
                onChanged: (value) {},
                isCardMode: true,
              ),
              const SizedBox(height: defaultMarginSize,),
              CustomTextField(
                hint: 'Jenis Kegiatan',
                onChanged: (value) {},
                isCardMode: true,
              ),
              const SizedBox(height: defaultMarginSize,),
              CustomTextField(
                hint: 'Pendapatan',
                onChanged: (value) {},
                isCardMode: true,
              ),
              const SizedBox(height: defaultMarginSize,),
              CustomTextField(
                hint: 'Modal Awal',
                onChanged: (value) {},
                isCardMode: true,
              ),
              const SizedBox(height: defaultMarginSize,),
              CustomButton(
                textStyle: myTextTheme.labelLarge?.copyWith(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                text: "Submit",
                onPressed: () {
                  Navigator.of(context).pushNamed(RecommendationOutputPage.route);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
