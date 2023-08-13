import 'package:flutter/material.dart';
import 'package:legalkan/common/dimensions.dart';
import 'package:legalkan/common/styles.dart';
import 'package:legalkan/core/models/document.dart';
import 'package:legalkan/ui/pages/create_document_page.dart';
import 'package:legalkan/ui/widgets/custom_button.dart';
import 'package:legalkan/ui/widgets/menu_tile.dart';

class DocumentPage extends StatelessWidget {
  static const route = "/document-page";

  final bool displayOnly;

  const DocumentPage({Key? key, required this.displayOnly}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          "Dokumen",
          style: appbarTitleStyle,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: bigMarginSize),
        child: Column(
          children: [
            ...dummyDocuments
                .map((e) => MenuTile(
                      iconAsset: 'assets/images/notes.png',
                      title: e.name ?? "-",
                      subTitle: e.status == 0 ? "Sedang diproses" : "Diterima",
                      isDocument: true,
                      documentStatus: e.status,
                      onTap: () {},
                    ))
                .toList()
          ],
        ),
      ),
      bottomSheet: displayOnly
          ? null
          : Container(
              decoration: whiteCardDecoration.copyWith(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: semiBigMarginSize),
              child: CustomButton(
                text: 'Tambahkan Dokumen',
                onPressed: () => Navigator.of(context).pushNamed(CreateDocumentPage.route),
              ),
            ),
    );
  }
}
