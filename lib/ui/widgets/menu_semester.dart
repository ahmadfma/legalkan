import 'package:flutter/material.dart';
import 'package:legalkan/ui/widgets/matakuliah_choice.dart';
import '../../common/dimensions.dart';
import '../../common/styles.dart';
import '../../core/models/matakuliah.dart';

class MenuSemester extends StatefulWidget {
  final int semester;
  final List<Matakuliah> matakuliah;

  const MenuSemester({
    Key? key,
    required this.semester,
    required this.matakuliah,
  }) : super(key: key);

  @override
  State<MenuSemester> createState() => _MenuSemesterState();
}

class _MenuSemesterState extends State<MenuSemester> {
  int counter = 0;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 5),
      decoration: whiteCardDecoration,
      curve: Curves.elasticInOut,
      width: double.infinity,
      padding: const EdgeInsets.all(defaultMarginSize),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Row(
              children: [
                Expanded(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    direction: Axis.horizontal,
                    children: [
                      Text("Paket Semester ${widget.semester}", style: myTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700, fontSize: 16),),
                      const SizedBox(width: mediumMarginSize,),
                      if(counter != 0) Text("($counter dipilih)", style: myTextTheme.labelLarge?.copyWith(color: greyText2, fontSize: 12),)
                    ],
                  ),
                ),
                Icon(isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down, color: blue, size: 32,)
              ],
            ),
          ),
          if(isExpanded)
            Column(
              children: [
                ...widget.matakuliah.map((e) {
                  return MataKuliahChoice(
                    matakuliah: e,
                    onChange: (isSelected) {
                      setState(() {
                        if(isSelected) {
                          counter++;
                        } else {
                          counter--;
                        }
                      });
                    },
                  );
                }).toList()
              ],
            )
        ],
      ),
    );
  }
}