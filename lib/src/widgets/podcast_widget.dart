import 'package:dio_lab_flutter_dio_podcast/src/widgets/feed_list_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PodcastWidget extends StatelessWidget {
  final int index;
  final String img;
  final String title;
  final String description;
  final Color color;
  final Icon icon;
  final Function()? click;

  const PodcastWidget({
    super.key,
    required this.index,
    required this.img,
    required this.title,
    required this.description,
    required this.color,
    required this.icon,
    this.click,
  });

  @override
  Widget build(BuildContext context) {
    FeedListStore store = Modular.get<FeedListStore>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(img),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 15),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(width: 20),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                store.tocar(index);
              },
              child: icon,
            ),
          ),
        ],
      ),
    );
  }
}
