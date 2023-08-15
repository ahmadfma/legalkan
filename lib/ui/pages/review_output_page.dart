import 'package:flutter/material.dart';
import 'package:legalkan/common/dimensions.dart';
import 'package:legalkan/common/styles.dart';
import 'package:legalkan/core/models/document.dart';
import '../widgets/menu_tile.dart';

class ReviewOutputPage extends StatelessWidget {
  final Document document;

  static const route = "/review-output-page";

  const ReviewOutputPage({
    required this.document,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Hasil review", style: appbarTitleStyle,),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: defaultMarginSize),
        child: Column(
          children: [
            MenuTile(
              iconAsset: 'assets/images/pdf.png',
              title: document.name ?? "-",
              subTitle: "Selesai",
              isDocument: true,
              documentStatus: document.status,
              onTap: () {

              },
            ),
            Container(
              decoration: whiteCardDecoration,
              padding: EdgeInsets.all(defaultMarginSize),
              margin: EdgeInsets.only(left: defaultMarginSize, right: defaultMarginSize, bottom: defaultMarginSize),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Review Summary", style: myTextTheme.bodyLarge?.copyWith(fontSize: 14, fontWeight: FontWeight.w600),),
                  const SizedBox(height: defaultMarginSize,),
                  Text(" Prices for goods and services in the agreement are not fixed.\n- The supplier does not provide a warranty for goods and services.\n- The agreement does not include confidentiality clauses for protecting sensitive information.", style: myTextTheme.displaySmall?.copyWith(fontSize: 14),)
                ],
              ),
            ),
            ...dummyReviewOutputPoint.map((e) => ExpandableWidget(title: e.title, content: e.content)).toList()
           ],
        ),
      ),
    );
  }
}

class ExpandableWidget extends StatefulWidget {
  final String title;
  final String content;

  const ExpandableWidget({required this.title, required this.content, super.key});

  @override
  State<ExpandableWidget> createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: whiteCardDecoration,
      padding: EdgeInsets.all(defaultMarginSize),
      margin: EdgeInsets.only(left: defaultMarginSize, right: defaultMarginSize, bottom: defaultMarginSize),
      width: double.infinity,
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
                Expanded(child: Text(widget.title, style: myTextTheme.bodyLarge?.copyWith(fontSize: 14, fontWeight: FontWeight.w600),)),
                Icon(isExpanded ? Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_up_rounded, size: 26, color: primaryColor,)
              ],
            ),
          ),
          if(isExpanded) const SizedBox(height: defaultMarginSize,),
          if(isExpanded) Text(widget.content, style: myTextTheme.displaySmall?.copyWith(fontSize: 14),)
        ],
      ),
    );
  }
}

class ReviewOutputPoint {
  final String title;
  final String content;

  ReviewOutputPoint({
    required this.title,
    required this.content,
  });

}

final dummyReviewOutputPoint = [
  ReviewOutputPoint(
    title: 'Apa jenis izin yang diperlukan untuk membuka restoran ayam di Indonesia?',
    content: 'Anda memerlukan Surat Izin Usaha Perdagangan (SIUP) dan Tanda Daftar Perusahaan (TDP) sebagai dasar. Selain itu, Anda juga memerlukan izin dari Dinas Kesehatan setempat untuk memastikan standar kesehatan dan kebersihan terpenuhi.'
  ),
  ReviewOutputPoint(
      title: 'Apakah saya perlu mendapatkan sertifikasi Halal untuk restoran ayam saya?',
      content: 'Ya, jika Anda ingin menyatakan bahwa produk Anda halal, Anda harus mendapatkan sertifikasi dari Majelis Ulama Indonesia (MUI).'
  ),
  ReviewOutputPoint(
      title: 'Bagaimana proses mendapatkan izin lingkungan?',
      content: 'Anda harus mengajukan Analisis Mengenai Dampak Lingkungan (AMDAL) atau UKL-UPL (Upaya Pengelolaan Lingkungan dan Upaya Pemantauan Lingkungan) ke kantor lingkungan setempat.'
  ),
  ReviewOutputPoint(
      title: 'Apakah saya perlu izin khusus untuk memasang signage atau papan nama restoran?',
      content: 'Ya, Anda memerlukan izin pemasangan reklame dari pemerintah daerah setempat.'
  ),
  ReviewOutputPoint(
      title: 'Bagaimana dengan izin tempat usaha?',
      content: 'Anda memerlukan Surat Izin Tempat Usaha (SITU) yang dikeluarkan oleh pemerintah daerah setempat.'
  ),
  ReviewOutputPoint(
      title: 'Apakah ada batasan mengenai lokasi pembukaan restoran ayam?',
      content: 'Lokasi restoran harus sesuai dengan Rencana Tata Ruang Wilayah (RTRW) setempat. Anda harus memastikan bahwa lokasi yang Anda pilih sesuai dengan zonasi yang ditentukan oleh pemerintah daerah.'
  ),
  ReviewOutputPoint(
      title: 'Apakah saya perlu asuransi untuk restoran saya?',
      content: 'Meskipun tidak wajib, sangat disarankan untuk memiliki asuransi yang melindungi aset bisnis Anda dan tanggung jawab terhadap konsumen.'
  ),
];

