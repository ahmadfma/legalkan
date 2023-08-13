import 'package:flutter/material.dart';

import '../../common/dimensions.dart';
import '../../common/styles.dart';

class CustomDropdownButton extends StatelessWidget {

  final Function(String value) onChanged;
  final String? selectedValue;
  final List<String> items;
  final String? hint;
  final bool isCardMode;

  const CustomDropdownButton({
    Key? key,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
    this.hint = "",
    this.isCardMode = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isCardMode
          ? whiteCardDecoration
          : BoxDecoration(
        border: Border.all(color: greyStroke, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: mediumMarginSize, vertical: extraSmallMarginSize),
      child: DropdownButton(
        value: selectedValue,
        isExpanded: true,
        icon: const Icon(Icons.keyboard_arrow_down),
        hint: hint != null ? Text(hint!, style: myTextTheme.labelLarge?.copyWith(color: greyText3),) : null,
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items, style: myTextTheme.labelLarge?.copyWith(),),
          );
        }).toList(),
        onChanged: (value) => onChanged(value!.toString()),
        underline: const SizedBox(),
      ),
    );
  }
}
