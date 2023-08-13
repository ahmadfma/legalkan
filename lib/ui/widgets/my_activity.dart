import 'package:flutter/material.dart';
import 'package:legalkan/ui/pages/detail_activity_page.dart';
import 'package:legalkan/utils/date_helper.dart';
import 'package:legalkan/utils/enum.dart';

import '../../common/dimensions.dart';
import '../../common/styles.dart';
import '../../core/models/my_activity.dart';
import 'default_user_image.dart';

class MyActivityWidget extends StatelessWidget {
  final MyActivity myActivity;

  const MyActivityWidget({Key? key, required this.myActivity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(DetailActivityPage.route, arguments: myActivity);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: grey02.withOpacity(0.35),
                  spreadRadius: 1,
                  blurRadius: 2
              )
            ]
        ),
        padding: const EdgeInsets.all(defaultMarginSize),
        margin: const EdgeInsets.only(left: defaultMarginSize, right: defaultMarginSize, top: defaultMarginSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(myActivity.userData != null) topBar(),
            if(myActivity.userData != null) const SizedBox(height: defaultMarginSize,),
            Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Wrap(
                 direction: Axis.horizontal,
                 children: [
                   Image.asset("assets/images/book.png", width: 18,),
                   const SizedBox(width: mediumMarginSize,),
                   Text(ActivityType.values.firstWhere((element) => element.type == myActivity.type).name, style: myTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),)
                 ],
               ),
               Container(
                 decoration: BoxDecoration(
                   color: getStatusColor(),
                   borderRadius: const BorderRadius.all(Radius.circular(6))
                 ),
                 padding: const EdgeInsets.symmetric(vertical: 6, horizontal: defaultMarginSize),
                 child: Text(ActivityStatus.values.firstWhere((element) => element.status == myActivity.status).name, style: myTextTheme.bodyMedium?.copyWith(fontSize: 12,),),
               )
             ],
           ),
            const SizedBox(height: mediumMarginSize,),
            Text(myActivity.mitra ?? "-", style: myTextTheme.bodyMedium,),
            const SizedBox(height: mediumMarginSize,),
            Text("${parseDate(myActivity.startDate!)} - ${parseDate(myActivity.endDate!)}", style: myTextTheme.bodySmall?.copyWith(color: greyText3),)
          ],
        ),
      ),
    );
  }

  Color getStatusColor() {
    if(myActivity.status == ActivityStatus.seleksiAdministratif.status || myActivity.status == ActivityStatus.berakhir.status) {
      return lightBlue;
    }
    else if(myActivity.status == ActivityStatus.tidakMemenuhi.status || myActivity.status == ActivityStatus.ditolak.status) {
      return lightRed;
    }
    else {
      return lightGreen;
    }
  }

  Widget topBar() {
    return Row(
      children: [
        const DefaultUserImage(size: 60, iconSize: 30),
        const SizedBox(width: defaultMarginSize,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${myActivity.userData?.name}", style: myTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600, fontSize: 16),),
            const SizedBox(height: verySmallMarginSize,),
            Text("${myActivity.userData?.username}", style: myTextTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400, fontSize: 14, color: greyText3),),
          ],
        )
      ],
    );
  }

}
