import 'package:dio_lab_flutter_dio_podcast/src/widgets/feed_list_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CategoryButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final String url;

  const CategoryButtonWidget({
    super.key,
    required this.text,
    required this.color,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    final store = Modular.get<FeedListStore>();
    return GestureDetector(
      onTap: () {
        store.loadFeed(url);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          height: 30,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: color),
          child: Center(
            child: Text(
              text.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
