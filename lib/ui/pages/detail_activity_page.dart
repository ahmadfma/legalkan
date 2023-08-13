import 'package:flutter/material.dart';
import 'package:legalkan/common/dimensions.dart';
import 'package:legalkan/common/styles.dart';
import 'package:legalkan/core/models/activity_type.dart';
import 'package:legalkan/core/models/my_activity.dart';
import 'package:legalkan/locator.dart';
import 'package:legalkan/ui/pages/activity_subject_page.dart';
import 'package:legalkan/ui/pages/document_page.dart';
import 'package:legalkan/ui/pages/update_final_status_activity_page.dart';
import 'package:legalkan/ui/widgets/dialogs/custom_dialog.dart';
import 'package:legalkan/ui/widgets/dialogs/dialog_update_satus.dart';
import 'package:legalkan/ui/widgets/menu_tile.dart';
import 'package:legalkan/utils/date_helper.dart';
import 'package:legalkan/utils/enum.dart';

class DetailActivityPage extends StatefulWidget {
  static const route = "/detail-activity";

  final MyActivity myActivity;

  const DetailActivityPage({
    Key? key,
    required this.myActivity,
  }) : super(key: key);

  @override
  State<DetailActivityPage> createState() => _DetailActivityPageState();
}

class _DetailActivityPageState extends State<DetailActivityPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          "Detail Kegiatan",
          style: appbarTitleStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: defaultMarginSize, vertical: bigMarginSize),
              padding: const EdgeInsets.all(defaultMarginSize),
              width: double.infinity,
              decoration: whiteCardDecoration,
              child: Column(
                children: [
                  Image.network(
                    dummyActivityTypes
                        .firstWhere((element) => element.type == widget.myActivity.type)
                        .imageUrl
                        .toString(),
                    height: 80,
                  ),
                  const SizedBox(
                    height: defaultMarginSize,
                  ),
                  topBarItem(
                    size,
                    "Jenis Kegiatan",
                    dummyActivityTypes
                        .firstWhere((element) => element.type == widget.myActivity.type)
                        .name ?? "-",
                  ),
                  const SizedBox(
                    height: mediumMarginSize,
                  ),
                  topBarItem(size, "Mitra", widget.myActivity.mitra ?? "-"),
                  const SizedBox(
                    height: mediumMarginSize,
                  ),
                  topBarItem(size, "Pelaksanaan", "${parseDate(widget.myActivity.startDate)} - ${parseDate(widget.myActivity.endDate)}"),
                  const SizedBox(
                    height: mediumMarginSize,
                  ),
                  topBarItem(size, "Dosen Pembimbing", "Ais Prayogi"),
                  const SizedBox(
                    height: mediumMarginSize,
                  ),
                  topBarItem(
                      size,
                      "Status",
                      ActivityStatus.values
                          .firstWhere((element) => element.status == widget.myActivity.status!).name,
                      isForStatus: true),
                ],
              ),
            ),

            MenuTile(
              iconAsset: 'assets/images/notes.png',
              title: 'Dokumen',
              subTitle: 'Anda belum meminta dokumen',
              onTap: () {
                Navigator.of(context).pushNamed(DocumentPage.route);
              },
            ),

            MenuTile(
              iconAsset: 'assets/images/list.png',
              title: 'Matakuliah Penyetaraan',
              subTitle: 'Anda belum memilih matakuliah',
              onTap: () {
                Navigator.of(context).pushNamed(ActivitySubjectPage.route);
              },
            ),

            MenuTile(
              iconAsset: 'assets/images/status.png',
              title: 'Update Status',
              subTitle: 'Update status kegiatan anda',
              onTap: () async {
                if(widget.myActivity.status == ActivityStatus.diterima.status) {
                  Navigator.of(context).pushNamed(UpdateFinalStatusActivityPage.route);
                } else {
                  final result = await showDialog<String>(
                    context: context,
                    builder: (context) {
                      return const CustomDialog(
                        contents: DialogUpdateActivityStatus(),
                      );
                    },
                  );
                  debugPrint("UPDATE STATUS : $result");
                }
              },
            ),

          ],
        ),
      ),
    );
  }

  Widget topBarItem(Size size, String key, String value, {bool isForStatus = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: size.width * 0.35,
          child: Text(
            key,
            style: myTextTheme.bodyMedium,
          ),
        ),
        Text(
          ":",
          style: myTextTheme.bodyMedium,
        ),
        const SizedBox(
          width: mediumMarginSize,
        ),
        Expanded(
          child: Text(
            value,
            style: myTextTheme.labelLarge?.copyWith(color: isForStatus ? getValueColor(value) : blackText),
          ),
        )
      ],
    );
  }

  Color getValueColor(String status) {
    try {
      if (status == ActivityStatus.seleksiAdministratif.name || status == ActivityStatus.berakhir.name) {
        return blue;
      } else if (status == ActivityStatus.tidakMemenuhi.name ||
          status == ActivityStatus.ditolak.name) {
        return primaryColor;
      } else {
        return green;
      }
    } catch (e) {
      return blackText;
    }
  }
}
