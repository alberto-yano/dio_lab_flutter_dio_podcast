import 'package:dio_lab_flutter_dio_podcast/src/repositories/category_repository.dart';
import 'package:dio_lab_flutter_dio_podcast/src/util/custom_color.dart';
import 'package:dio_lab_flutter_dio_podcast/src/widgets/category_button.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryRepository categoryRepository;

  const CategoryWidget({super.key, required this.categoryRepository});

  @override
  Widget build(BuildContext context) {
    List<CategoryButtonWidget> categories = categoryRepository
        .findAllCagegories()
        .map((element) => CategoryButtonWidget(
              color: CustomColor.pink700,
              text: element.name,
              url: element.url,
            ))
        .toList();
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 2),
      height: 35,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: categories,
      ),
    );
  }
}
