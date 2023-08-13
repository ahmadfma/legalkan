import 'package:flutter/material.dart';
import '../../common/styles.dart';

class ChangePhotoPage extends StatelessWidget {
  static const route = '/change-photo';

  const ChangePhotoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ganti Foto", style: appbarTitleStyle,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
