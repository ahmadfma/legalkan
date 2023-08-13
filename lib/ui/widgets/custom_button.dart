import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:legalkan/common/styles.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final ButtonStyle? buttonStyle;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final Widget? child;
  final bool? showLoading;
  final bool? enabled;
  final double loadingBarSize;

  const CustomButton({
    Key? key,
    this.text,
    required this.onPressed,
    this.height = 50,
    this.loadingBarSize = 25,
    this.width,
    this.textStyle,
    this.buttonStyle,
    this.borderRadius,
    this.padding,
    this.child,
    this.showLoading,
    this.enabled
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: width ?? size.width,
      height: height,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: ElevatedButton(
          style: getButtonStyle(),
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: getChild()
          ),
          onPressed: () {
            if(showLoading != true && (enabled == null || enabled == true)) {
              onPressed();
            } else {
              debugPrint("Cant do action because loading is active or disabled");
            }
          },
        ),
      ),
    );
  }

  Widget getChild() {
    if(child != null) return child!;
    if(showLoading == true) {
      return Center(
        child: SizedBox(height: loadingBarSize, width: loadingBarSize, child: const CircularProgressIndicator(color: Colors.white,))
      );
    }

    return Text(
      text ?? "-",
      style: textStyle ?? myTextTheme.labelLarge?.copyWith(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
    );
  }

  ButtonStyle? getButtonStyle() {
    if(enabled == false) {
      return ElevatedButton.styleFrom(
          backgroundColor: grey02
      );
    }
    return buttonStyle;
  }

}
