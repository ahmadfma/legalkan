import 'package:flutter/material.dart';
import 'package:legalkan/common/dimensions.dart';
import 'package:legalkan/common/styles.dart';
import 'package:legalkan/core/models/my_notification.dart';
import 'package:legalkan/utils/date_helper.dart';

class NotificationWidget extends StatelessWidget {
  final MyNotification notification;

  const NotificationWidget({
    Key? key,
    required this.notification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: whiteCardDecoration,
      margin: const EdgeInsets.only(left: defaultMarginSize, right: defaultMarginSize, top: defaultMarginSize),
      padding: const EdgeInsets.all(defaultMarginSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              if(!notification.isRead)
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: blue
                  ),
                ),
              if(!notification.isRead) const SizedBox(width: smallMarginSize,),
              Text(parseDateTime(DateTime.parse(notification.createdAt).toLocal(), pattern: 'dd MMM yyyy, HH:mm a'), style: myTextTheme.bodySmall?.copyWith(fontSize: 12, color: greyText3),)
            ],
          ),
          const SizedBox(height: mediumMarginSize,),
          Text(notification.title, style: myTextTheme.titleLarge?.copyWith(fontSize: 16),),
          const SizedBox(height: verySmallMarginSize,),
          Text(notification.message, style: myTextTheme.bodyMedium?.copyWith(color: greyText2),)
        ],
      ),
    );
  }
}