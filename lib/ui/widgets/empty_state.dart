import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:legalkan/common/dimensions.dart';
import 'package:legalkan/common/styles.dart';

class EmptyState extends StatelessWidget {

  final String? message;
  final double? paddingWidth;
  final double? marginHeight;
  final double? lottieWidth;

  const EmptyState({
    Key? key,
    this.message,
    this.marginHeight,
    this.paddingWidth,
    this.lottieWidth
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: whiteCardDecoration,
      padding: EdgeInsets.only(left: size.width * (paddingWidth ?? 0.12), right: size.width * (paddingWidth ?? 0.12), bottom: bigMarginSize),
      margin: EdgeInsets.only(bottom: size.height * (marginHeight ?? 0.14)),
      child: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Lottie.asset('assets/lottie/not-found.json', width: lottieWidth ?? 200),
          if(message != null) Text(message.toString(), style: myTextTheme.labelLarge?.copyWith(color: greyText3),)
        ],
      ),
    );
  }
}
