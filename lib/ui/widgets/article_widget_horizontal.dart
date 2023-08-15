import 'package:flutter/material.dart';
import 'package:legalkan/common/dimensions.dart';
import 'package:legalkan/common/styles.dart';
import 'package:legalkan/utils/date_helper.dart';

class ArticleWidgetHorizontal extends StatelessWidget {

  final String imageUrl;
  final String title;
  final String desc;
  final String createdAt;

  const ArticleWidgetHorizontal({
    required this.imageUrl,
    required this.title,
    required this.desc,
    required this.createdAt,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,

      margin: EdgeInsets.only(right: defaultMarginSize),
      padding: EdgeInsets.all(smallMarginSize),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: Image.asset('assets/images/lawyer_dummy.jpg', height: 120, fit: BoxFit.cover, width: double.infinity,),
          ),
          const SizedBox(height: 8,),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.horizontal,
            children: [
              Icon(Icons.access_time, color: greyStroke, size: 20),
              const SizedBox(width: 6,),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Text(parseDate("2023-01-05 10:01:14"), style: myTextTheme.bodySmall?.copyWith(fontSize: 12, color: Colors.grey),),
              ),
            ],
          ),
          const SizedBox(height: 8,),
          Text("Pelanggaran hak cipta yang telah dilakukan oleh", style: myTextTheme.bodySmall?.copyWith(fontSize: 14, fontWeight: FontWeight.w600), maxLines: 2,),
          const SizedBox(height: 6,),
          Text("Dalam proses demokrasi sebenarnya itu biasa saja dan saya sangat menghormati sikap masing-masing partai. Pasti beliau-beliau juga sudah memberikan keputusan, sudah punya catatan-catatan", style: myTextTheme.bodySmall?.copyWith(fontSize: 12, color: Colors.grey[600]), maxLines: 3,)
        ],
      ),
    );
  }
}
