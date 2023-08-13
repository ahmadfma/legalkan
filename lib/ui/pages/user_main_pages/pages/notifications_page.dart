import 'package:flutter/material.dart';
import 'package:legalkan/common/styles.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications", style: myTextTheme.titleLarge?.copyWith(color: Colors.white),),
        centerTitle: true,
      ),
    );
  }
}
