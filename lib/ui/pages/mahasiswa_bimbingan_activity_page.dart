import 'package:flutter/material.dart';
import 'package:legalkan/common/dimensions.dart';
import 'package:legalkan/common/styles.dart';
import 'package:legalkan/core/models/my_activity.dart';
import 'package:legalkan/ui/widgets/my_activity.dart';

class MahasiswaBimbinganActivityPage extends StatelessWidget {
  static const route = '/mahasiswa-bimbingan-activity';

  const MahasiswaBimbinganActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Activity", style: appbarTitleStyle,),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(bottom: bigMarginSize),
        itemBuilder: (context, index) => MyActivityWidget(myActivity: dummyMyActivities[index]),
        itemCount: dummyMyActivities.length,
      ),
    );
  }
}
