import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final double borderRadius;
  final EdgeInsets contentPadding;
  final Widget contents;

  const CustomDialog({
    Key? key,
    required this.contents,
    this.borderRadius = 14.0,
    this.contentPadding = const EdgeInsets.symmetric(
      vertical: 24,
      horizontal: 24,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      insetAnimationDuration: const Duration(milliseconds: 700),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Container(
        constraints: const BoxConstraints(
          maxHeight: 600,
        ),
        padding: contentPadding,
        child: SingleChildScrollView(
          child: contents,
        ),
      ),
    );
  }
}
