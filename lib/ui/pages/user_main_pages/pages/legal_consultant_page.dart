import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:legalkan/common/dimensions.dart';
import 'package:legalkan/ui/pages/detail_profile_page.dart';
import 'package:legalkan/ui/pages/lawyer_consult_page.dart';
import 'package:legalkan/ui/pages/splash_screen.dart';
import 'package:legalkan/ui/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../common/styles.dart';
import '../../../../locator.dart';
import '../../../../utils/custom_navigator.dart';
import '../../../widgets/profile_menu.dart';

class LegalConsultantPage extends StatefulWidget {
  const LegalConsultantPage({Key? key}) : super(key: key);

  @override
  State<LegalConsultantPage> createState() => _LegalConsultantPageState();
}

class _LegalConsultantPageState extends State<LegalConsultantPage> {
  XFile? selectedProfileImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Rekomendasi pengacara",
          style:appbarTitleStyle?.copyWith(color: Colors.white, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultMarginSize),
        child: Column(
          children: [
            ...dummyLawyer.map((e) => ListLawyerWidget(lawyer: e)).toList()
          ],
        ),
      ),
    );
  }

}

class ListLawyerWidget extends StatelessWidget {
  final Lawyer lawyer;
  
  const ListLawyerWidget({
    required this.lawyer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: defaultMarginSize),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                child: Image.network(lawyer.photoUrl, height: 100, width: 80, fit: BoxFit.cover,),
              ),
              const SizedBox(width: smallMarginSize,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(lawyer.name, style: myTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),),
                    const SizedBox(height: 2,),
                    Text(lawyer.jobTitle, style: myTextTheme.bodyMedium?.copyWith(fontSize: 12, color: Colors.grey)),
                    const SizedBox(height: 4,),
                    Wrap(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(2)),
                            color: greyBackground,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(Icons.work, size: 12, color: Colors.grey[600],),
                              const SizedBox(width: 4,),
                              Text("${lawyer.experienceYear} tahun", style: myTextTheme.bodyMedium?.copyWith(fontSize: 11),)
                            ],
                          ),
                        ),
                        const SizedBox(width: 6,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(2)),
                            color: greyBackground,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(Icons.star, size: 12, color: Colors.grey[600],),
                              const SizedBox(width: 4,),
                              Text("4.5", style: myTextTheme.bodyMedium?.copyWith(fontSize: 11),)
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Rp35.000",  style: myTextTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500, fontSize: 14),),
                        CustomButton(
                          text: "Hubungi",
                          textStyle: myTextTheme.labelLarge?.copyWith(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                          width: 100,
                          height: 28,
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          onPressed: () {
                            Navigator.of(context).pushNamed(LawyerConsultPage.route, arguments: lawyer);
                          },
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: mediumMarginSize,),
          Container(
            color: Colors.grey[200],
            width: double.infinity,
            height: 1,
          )
        ],
      ),
    );
  }
}

class Lawyer {
  final String name;
  final String photoUrl;
  final String jobTitle;
  final int experienceYear;
  final int rate;

  Lawyer({
    required this.name,
    required this.experienceYear,
    required this.jobTitle,
    required this.photoUrl,
    required this.rate,
  });

}

final dummyLawyer = [
  Lawyer(
    name: "Dr. Ahmad Fathanah S.H., M.H.",
    photoUrl: 'https://thumbs.dreamstime.com/b/lawyer-reading-law-library-university-48943498.jpg',
    jobTitle: "Konsultan Bisnis",
    experienceYear: 5,
    rate: 100000
  ),
  Lawyer(
      name: "Dr. Ahmad Fathanah S.H., M.H.",
      photoUrl: 'https://thumbs.dreamstime.com/b/lawyer-reading-law-library-university-48943498.jpg',
      jobTitle: "Konsultan Bisnis",
      experienceYear: 5,
      rate: 100000
  ),
  Lawyer(
      name: "Dr. Ahmad Fathanah S.H., M.H.",
      photoUrl: 'https://thumbs.dreamstime.com/b/lawyer-reading-law-library-university-48943498.jpg',
      jobTitle: "Konsultan Bisnis",
      experienceYear: 5,
      rate: 100000
  ),
  Lawyer(
      name: "Dr. Ahmad Fathanah S.H., M.H.",
      photoUrl: 'https://thumbs.dreamstime.com/b/lawyer-reading-law-library-university-48943498.jpg',
      jobTitle: "Konsultan Bisnis",
      experienceYear: 5,
      rate: 100000
  ),
  Lawyer(
      name: "Dr. Ahmad Fathanah S.H., M.H.",
      photoUrl: 'https://thumbs.dreamstime.com/b/lawyer-reading-law-library-university-48943498.jpg',
      jobTitle: "Konsultan Bisnis",
      experienceYear: 5,
      rate: 100000
  ),
  Lawyer(
      name: "Dr. Ahmad Fathanah S.H., M.H.",
      photoUrl: 'https://thumbs.dreamstime.com/b/lawyer-reading-law-library-university-48943498.jpg',
      jobTitle: "Konsultan Bisnis",
      experienceYear: 5,
      rate: 100000
  ),
  Lawyer(
      name: "Dr. Ahmad Fathanah S.H., M.H.",
      photoUrl: 'https://thumbs.dreamstime.com/b/lawyer-reading-law-library-university-48943498.jpg',
      jobTitle: "Konsultan Bisnis",
      experienceYear: 5,
      rate: 100000
  ),
  Lawyer(
      name: "Dr. Ahmad Fathanah S.H., M.H.",
      photoUrl: 'https://thumbs.dreamstime.com/b/lawyer-reading-law-library-university-48943498.jpg',
      jobTitle: "Konsultan Bisnis",
      experienceYear: 5,
      rate: 100000
  )
  ,  Lawyer(
      name: "Dr. Ahmad Fathanah S.H., M.H.",
      photoUrl: 'https://thumbs.dreamstime.com/b/lawyer-reading-law-library-university-48943498.jpg',
      jobTitle: "Konsultan Bisnis",
      experienceYear: 5,
      rate: 100000
  )
];
