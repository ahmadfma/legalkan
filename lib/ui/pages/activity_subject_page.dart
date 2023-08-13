import 'package:flutter/material.dart';
import 'package:legalkan/common/dimensions.dart';
import 'package:legalkan/common/styles.dart';
import 'package:legalkan/core/models/activity_penyetaraan.dart';
import 'package:legalkan/core/models/matakuliah.dart';
import 'package:legalkan/ui/pages/add_activity_subject_page.dart';
import 'package:legalkan/ui/widgets/menu_tile.dart';

import '../../utils/enum.dart';
import '../widgets/custom_button.dart';

final dummyActivityPenyetaraan = ActivityPenyetaraan(
  id: '6403583498647e657fb96c3b',
  activityId: 'adasd',
  jumlahMataKuliah: 2,
  jumlahSks: 4,
  mataKuliah: [
    '14',
    '14'
  ]
);

class ActivitySubjectPage extends StatelessWidget {
  static const route = "/activity-subject";

  const ActivitySubjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Mata Kuliah", style: appbarTitleStyle,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: whiteCardDecoration,
              padding: const EdgeInsets.all(defaultMarginSize),
              margin: const EdgeInsets.all(defaultMarginSize),
              child: Column(
                children: [
                  topBarItem(size, "Jumlah Mata Kuliah", "3"),
                  const SizedBox(height: defaultMarginSize,),
                  topBarItem(size, "Jumlah SKS", "3"),
                  const SizedBox(height: defaultMarginSize,),
                  topBarItem(size, "Status", "Disetujui"),
                ],
              ),
            ),
            ...?dummyActivityPenyetaraan.mataKuliah?.map((e) {
              final matakuliah = dummyMataKuliah.firstWhere((element) => element.id == int.parse(e));
              return MenuTile(
                iconAsset: 'assets/images/list.png',
                title: matakuliah.namaResmi ?? "-",
                subTitle: '3 SKS',
                onTap: () {},
              );
            }).toList()
          ],
        ),
      ),
      bottomSheet: Container(
        decoration: whiteCardDecoration.copyWith(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))
        ),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: semiBigMarginSize),
        child: CustomButton(
          child: const Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Icon(Icons.add),
              SizedBox(width: mediumMarginSize,),
              Text("Tambah SKS")
            ],
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(AddActivitySubjectPage.route);
          },
        ),
      ),
    );
  }

  Widget topBarItem(Size size, String key, String value, {bool isForStatus = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: size.width * 0.35,
          child: Text(
            key,
            style: myTextTheme.bodyMedium,
          ),
        ),
        Text(
          ":",
          style: myTextTheme.bodyMedium,
        ),
        const SizedBox(
          width: mediumMarginSize,
        ),
        Expanded(
          child: Text(
            value,
            style: myTextTheme.labelLarge?.copyWith(color: isForStatus ? getValueColor(value) : blackText),
          ),
        )
      ],
    );
  }

  Color getValueColor(String status) {
    try {
      if (status == ActivityStatus.seleksiAdministratif.name || status == ActivityStatus.berakhir.name) {
        return blue;
      } else if (status == ActivityStatus.tidakMemenuhi.name ||
          status == ActivityStatus.ditolak.name) {
        return primaryColor;
      } else {
        return green;
      }
    } catch (e) {
      return blackText;
    }
  }

}
