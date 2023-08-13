import 'package:flutter/material.dart';
import 'package:legalkan/core/models/testimoni.dart';
import '../../common/dimensions.dart';
import '../../common/styles.dart';

class TestimoniWidget extends StatelessWidget {
  final Testimoni testimoni;

  const TestimoniWidget({Key? key, required this.testimoni}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 250
      ),
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
      margin: const EdgeInsets.only(left: defaultMarginSize, top: defaultMarginSize, bottom: defaultMarginSize),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            child: Image.network(testimoni.photoUrl!, width: 80, height: 80, fit: BoxFit.cover,),
          ),
          const SizedBox(height: mediumMarginSize,),
          Text(testimoni.name ?? "-", style: myTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),),
          const SizedBox(height: mediumMarginSize,),
          Text(
            testimoni.description ?? "-",
            style: myTextTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic, color: greyText2),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
