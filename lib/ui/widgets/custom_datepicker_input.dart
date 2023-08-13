import 'package:flutter/material.dart';

import '../../common/dimensions.dart';
import '../../common/styles.dart';

class CustomDatePickerInput extends StatelessWidget {
  final DateTime? selectedDate;
  final TextEditingController textEditingController;
  final String hint;
  final Function(DateTime selectedDate) onChanged;

  const CustomDatePickerInput({
    Key? key,
    required this.selectedDate,
    required this.textEditingController,
    required this.hint,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: greyStroke, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: mediumMarginSize, vertical: extraSmallMarginSize),
      child: InkWell(
        onTap: () => _selectDate(context),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: myTextTheme.labelLarge?.copyWith(color: greyText3),
                  border: InputBorder.none,
                  labelStyle: myTextTheme.labelLarge,
                ),
                enabled: false,
                style: myTextTheme.labelLarge,
              ),
            ),
            const Icon(Icons.date_range, color: blue,)
          ],
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(), // Refer step 1
      firstDate: DateTime(1945),
      lastDate: DateTime(DateTime.now().year + 5),

    );
    if(picked != null) onChanged(picked);
  }

}
