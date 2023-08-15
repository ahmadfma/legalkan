import 'package:flutter/material.dart';
import 'package:legalkan/common/dimensions.dart';
import 'package:legalkan/common/styles.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final String? label;
  final bool isCardMode;
  final EdgeInsets padding;
  final TextEditingController? textEditingController;
  final BoxDecoration? boxDecoration;
  final bool isReadOnly;
  final bool isObscureText;
  final Function(String value) onChanged;

  const CustomTextField({
    Key? key,
    required this.hint,
    required this.onChanged,
    this.label,
    this.isCardMode = false,
    this.isReadOnly = false,
    this.isObscureText = false,
    this.padding = const EdgeInsets.symmetric(horizontal: mediumMarginSize, vertical: 2),
    this.textEditingController,
    this.boxDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(label != null) Text(label!, style: myTextTheme.bodyMedium,),
        if(label != null) const SizedBox(height: mediumMarginSize,),
        Container(
          decoration: getDecoration(),
          padding: padding,
          child: _textField(),
        )
      ],
    );
  }

  Widget _textField() {
    return TextField(
      controller: textEditingController,
      readOnly: isReadOnly,
      obscureText: isObscureText,

      decoration: InputDecoration(
          hintText: hint,
          hintStyle: myTextTheme.labelMedium?.copyWith(color: greyText3),
          border: InputBorder.none,
          labelStyle: myTextTheme.labelMedium
      ),
      style: myTextTheme.labelLarge,
      onChanged: (value) => onChanged(value),
    );
  }

  BoxDecoration getDecoration() {
    if(boxDecoration != null) {
      return boxDecoration!;
    }
    if(isCardMode) {
      return whiteCardDecoration;
    }
    return BoxDecoration(
      border: Border.all(color: greyStroke, width: 1),
      borderRadius: const BorderRadius.all(Radius.circular(12)),
    );
  }
}
