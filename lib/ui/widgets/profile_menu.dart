import 'package:flutter/material.dart';

import '../../common/dimensions.dart';
import '../../common/styles.dart';

class ProfileMenu extends StatelessWidget {
  final IconData icons;
  final String text;
  final VoidCallback onClick;

  const ProfileMenu({
    Key? key,
    required this.icons,
    required this.text,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: Container(
        margin: const EdgeInsets.only(top: bigMarginSize),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  icons,
                  color: blackText,
                ),
                const SizedBox(
                  width: defaultMarginSize,
                ),
                Text(
                  text,
                  style: myTextTheme.titleSmall?.copyWith(fontSize: 16),
                )
              ],
            ),
            const SizedBox(
              height: mediumMarginSize,
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: greyBackground,
            )
          ],
        ),
      ),
    );
  }
}