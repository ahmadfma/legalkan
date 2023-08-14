import 'package:flutter/material.dart';
import 'package:legalkan/common/styles.dart';

class RecommendationOutputPage extends StatelessWidget {

  static const route = "/recommendation-output-page";

  const RecommendationOutputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rekomendasi kami", style: appbarTitleStyle,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
