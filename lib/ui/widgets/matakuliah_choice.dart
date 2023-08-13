import 'package:flutter/material.dart';
import 'package:legalkan/core/models/matakuliah.dart';

import '../../common/dimensions.dart';
import '../../common/styles.dart';

class MataKuliahChoice extends StatefulWidget {
  final Matakuliah matakuliah;
  final Function(bool isSelected) onChange;

  const MataKuliahChoice({
    Key? key,
    required this.matakuliah,
    required this.onChange,
  }) : super(key: key);

  @override
  State<MataKuliahChoice> createState() => _MataKuliahChoiceState();
}

class _MataKuliahChoiceState extends State<MataKuliahChoice> {

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: whiteCardDecoration,
      padding: const EdgeInsets.symmetric(horizontal: mediumMarginSize, vertical: smallMarginSize),
      margin: const EdgeInsets.only(top: defaultMarginSize),
      child: Row(
        children: [
          Checkbox(
            value: isSelected,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4)
            ),
            activeColor: blue,
            onChanged: (value) {
              setState(() {
                if(value != null) isSelected = value;
                widget.onChange(isSelected);
              });
            },
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.matakuliah.namaResmi ?? "-", style: myTextTheme.bodyMedium,),
                const SizedBox(height: extraSmallMarginSize,),
                Text("3 SKS", style: myTextTheme.labelLarge?.copyWith(fontSize: 12, color: greyText3),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
