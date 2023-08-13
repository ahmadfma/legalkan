import 'package:flutter/material.dart';
import 'package:legalkan/common/styles.dart';
import 'package:legalkan/ui/widgets/empty_state.dart';

class InformationCenterPage extends StatelessWidget {
  static const route = "/information-center";
  const InformationCenterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Information Center", style: appbarTitleStyle,),
      ),
      body: const Center(child: EmptyState(message: 'Belum ada informasi'),),
    );
  }
}
