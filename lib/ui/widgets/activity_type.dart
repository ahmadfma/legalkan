import 'package:flutter/material.dart';
import 'package:legalkan/common/dimensions.dart';
import 'package:legalkan/common/styles.dart';
import 'package:legalkan/core/models/activity_type.dart';

class ActivityTypeWidget extends StatelessWidget {
  final ActivityType activityType;

  const ActivityTypeWidget(this.activityType, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(activityType.imageUrl != null) Image.network(activityType.imageUrl!, height: 60,),
          const SizedBox(height: smallMarginSize,),
          Text(activityType.name ?? "-", style: myTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis),
          const SizedBox(height: verySmallMarginSize,),
          Text(activityType.description ?? "-", style: myTextTheme.bodyMedium?.copyWith(color: greyText2, height: 1.5), maxLines: 4, overflow: TextOverflow.ellipsis),
          const SizedBox(height: mediumMarginSize,),
          Container(
            height: 1,
            width: double.infinity,
            color: lightBlue,
          ),
          const SizedBox(height: mediumMarginSize,),
          InkWell(
            onTap: () {
              //TODO : MOVE TO SOURCE LINK
            },
            child: FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Tentang Program", style: myTextTheme.bodyMedium?.copyWith(color: blue, fontWeight: FontWeight.w600),),
                  const Icon(Icons.keyboard_arrow_right_rounded, color: blue,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
