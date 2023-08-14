import 'package:flutter/material.dart';
import 'package:legalkan/common/dimensions.dart';
import 'package:legalkan/common/styles.dart';

class ArticleCard extends StatelessWidget {
  final String title;
  final String author;
  final String content;
  final String imageUrl;

  ArticleCard({
    required this.title,
    required this.author,
    required this.content,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultMarginSize, right: defaultMarginSize,bottom: defaultMarginSize),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(defaultMarginSize), topRight: Radius.circular(defaultMarginSize)),
            child: Image.network(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: myTextTheme.bodyLarge?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  'By $author',
                  style: myTextTheme.bodyMedium?.copyWith(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(height: 8.0),
                Text(
                  content,
                  style: myTextTheme.bodyMedium?.copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}