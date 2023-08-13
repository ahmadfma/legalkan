import 'package:flutter/material.dart';
import 'package:legalkan/common/styles.dart';
import 'package:legalkan/core/models/my_activity.dart';
import 'package:legalkan/ui/widgets/my_activity.dart';

class ActivityPage extends StatelessWidget {
  static const route = '/activity-page';

  const ActivityPage({Key? key}) : super(key: key);

  TabBar get _tabBar => TabBar(
    indicatorColor: primaryColor,
    labelStyle: myTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
    unselectedLabelStyle: myTextTheme.bodyMedium,
    labelColor: blackText,
    tabs: const [
      Tab(
        text: "Status Pendaftaran",
      ),
      Tab(
        text: "Kegiatan Aktif",
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: Text("Kegiatanku", style: myTextTheme.titleLarge?.copyWith(color: Colors.white),),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: Material(
              color: Colors.white,
              child: _tabBar,
            ),
          )
        ),
        body: const TabBarView(
          children: [
            ActivityContentPage(isActive: false),
            ActivityContentPage(isActive: true),
          ],
        ),
      ),
    );
  }
}

class ActivityContentPage extends StatelessWidget {
  final bool isActive;
  const ActivityContentPage({Key? key, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => MyActivityWidget(myActivity: dummyMyActivities[index]),
      itemCount: dummyMyActivities.length,
    );
  }
}

