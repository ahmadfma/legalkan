import 'package:flutter/material.dart';
import 'package:legalkan/common/dimensions.dart';
import 'package:legalkan/common/styles.dart';

class FeatureCardWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color backgroundColor;
  final Color iconBackgroundColor;
  final Color? backgroundImageColor;
  final String backgroundImagePath;
  final String iconImagePath;

  const FeatureCardWidget({
    required this.title,
    required this.subTitle,
    required this.backgroundColor,
    required this.iconBackgroundColor,
    required this.backgroundImagePath,
    this.backgroundImageColor,
    required this.iconImagePath,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: defaultMarginSize),
      width: 160,
      height: 260,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(12))
      ),
      child: Stack(
        children: [
          Image.asset(backgroundImagePath, fit: BoxFit.cover, width: 160, color: backgroundImageColor ?? Colors.white.withOpacity(0.5), colorBlendMode: BlendMode.modulate, scale: 0.6,),
          Positioned(
            bottom: mediumMarginSize,
            left: mediumMarginSize,
            right: mediumMarginSize,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 90,
                  decoration: BoxDecoration(
                    color: iconBackgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(12))
                  ),
                  child: Center(
                    child: Image.asset(iconImagePath, fit: BoxFit.cover, height: 60, width: 60,),
                  ),
                ),
                const SizedBox(height: 30,),
                Text(title, style: myTextTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                const SizedBox(height: smallMarginSize,),
                Text(subTitle, style: myTextTheme.bodySmall?.copyWith(color: Colors.white, fontSize: 12), )
              ],
            ),
          )
        ],
      ),
    );
  }
}
