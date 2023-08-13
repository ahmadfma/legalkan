import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../common/styles.dart';

class DefaultUserImage extends StatelessWidget {
  final double size;
  final double iconSize;
  const DefaultUserImage({
    Key? key,
    this.size = 80.0,
    this.iconSize = 45.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
      child: Center(
        child: Image.asset(
          "assets/images/user.png",
          width: iconSize,
          height: iconSize,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
