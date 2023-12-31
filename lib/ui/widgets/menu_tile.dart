import 'package:flutter/material.dart';
import 'package:legalkan/common/dimensions.dart';
import 'package:legalkan/common/styles.dart';
import 'package:legalkan/utils/enum.dart';

class MenuTile extends StatelessWidget {
  final String iconAsset;
  final String title;
  final String? subTitle;
  final bool isLock;
  final bool isDocument;
  final int? documentStatus;
  final bool? isMine;
  final VoidCallback onTap;
  final bool? showLoading;

  const MenuTile({
    Key? key,
    required this.iconAsset,
    required this.title,
    this.subTitle,
    required this.onTap,
    this.isLock = false,
    this.isDocument = false,
    this.isMine = true,
    this.documentStatus,
    this.showLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(!isLock && (showLoading == null || showLoading == false)) {
          onTap();
        } else {
          debugPrint("cant do action");
        }
      },
      child: Container(
        decoration: whiteCardDecoration.copyWith(color: isLock ? greyBackground : Colors.white),
        margin: const EdgeInsets.only(left: defaultMarginSize, right: defaultMarginSize, bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: mediumMarginSize, vertical: mediumMarginSize),
        width: double.infinity,
        child: Row(
          children: [
            if(showLoading == true) Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              height: 26,
              width: 26,
              child: const CircularProgressIndicator(color: blue),
            ),
            if(showLoading == null || showLoading == false) Image.asset(iconAsset, height: 34),
            const SizedBox(width: mediumMarginSize,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, style: myTextTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, fontSize: 12),),
                  getSubtitle()
                ],
              ),
            ),
            getIcon()
          ],
        ),
      ),
    );
  }

  Widget getSubtitle() {
    if(showLoading != true && subTitle != null) {
      if(isMine == true) return Column(
        children: [
          if(!isDocument || documentStatus == DocumentStatus.sedangDiproses.status) Text(subTitle!, style: myTextTheme.displayMedium?.copyWith(fontSize: 12, letterSpacing: 0.25),),
          if(isDocument && documentStatus == DocumentStatus.diterima.status) Text(subTitle!, style: myTextTheme.displayMedium?.copyWith(fontSize: 12, letterSpacing: 0.25, color: green, fontWeight: FontWeight.w500),),
        ],
      );
      else return Column(
        children: [
          const SizedBox(height: extraSmallMarginSize,),
          Text(subTitle!, style: myTextTheme.displayLarge?.copyWith(fontSize: 12, letterSpacing: 0.25),),
        ],
      );
    }
    return const SizedBox.shrink();
  }

  Widget getIcon() {
    if(isMine == false) return const Icon(Icons.keyboard_arrow_right, color: blue, size: 24,);
    if(!isLock && !isDocument) return const Icon(Icons.keyboard_arrow_right, color: blue, size: 24,);
    if(isDocument && documentStatus == DocumentStatus.diterima.status) return const Icon(Icons.keyboard_arrow_right, color: blue, size: 24,);
    if(isLock) return const Padding(
      padding: EdgeInsets.only(right: extraSmallMarginSize),
      child: Icon(Icons.lock_outline_rounded, color: blackText, size: 26, ),
    );
    return const SizedBox.shrink();
  }

}
