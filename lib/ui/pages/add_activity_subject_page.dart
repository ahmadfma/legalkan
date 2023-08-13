import 'package:flutter/material.dart';
import 'package:legalkan/common/dimensions.dart';
import 'package:legalkan/common/styles.dart';
import 'package:legalkan/core/models/matakuliah.dart';
import 'package:legalkan/utils/extensions.dart';

import '../widgets/custom_button.dart';
import '../widgets/menu_semester.dart';

class AddActivitySubjectPage extends StatelessWidget {

  static const route = "/add-activity-subject";

  const AddActivitySubjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Daftar Matakuliah", style: appbarTitleStyle,),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: defaultMarginSize, right: defaultMarginSize, top: defaultMarginSize),
        child: Column(
          children: [
            ...groupMataKuliah().keys.map((semester) {
              if(semester != null) {
                return Container(
                  margin: const EdgeInsets.only(bottom: defaultMarginSize),
                  child: MenuSemester(
                    semester: semester,
                    matakuliah: groupMataKuliah()[semester]!,
                  ),
                );
              }
              return const SizedBox.shrink();
            }).toList(),
            const SizedBox(height: 200,),
          ],
        ),
      ),
      bottomSheet: Container(
        decoration: whiteCardDecoration.copyWith(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))
        ),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: semiBigMarginSize),
        child: CustomButton(
          text: 'Simpan',
          onPressed: () {},
        ),
      ),
    );
  }
}

Map<int?, List<Matakuliah>> groupMataKuliah() {
  return dummyMataKuliah.groupBy((item) => item.semester);
}