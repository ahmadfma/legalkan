import 'package:flutter/material.dart';
import 'package:legalkan/common/dimensions.dart';
import '../../common/styles.dart';

class HomeTopBarMenu extends StatelessWidget {
  final String title;
  final String imageAsset;
  final VoidCallback onTap;
  const HomeTopBarMenu({Key? key, required this.title, required this.imageAsset, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => onTap(),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)
            ),
            child: Center(
              child: Image.asset(imageAsset, height: 45,),
            ),
          ),
        ),
        const SizedBox(height: smallMarginSize,),
        Text(title, style: myTextTheme.bodyMedium?.copyWith(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700),)
      ],
    );
  }
}
