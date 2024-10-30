import 'package:dio_lab_flutter_dio_podcast/src/models/category_model.dart';

class CategoryRepository {
  List<CategoryModel> findAllCagegories() {
    var result = <CategoryModel>[];
    result.add(
      CategoryModel(
          name: 'Recentes',
          url:
              'https://www.youtube.com/feeds/videos.xml?channel_id=UCMxqhdELkftE8DuBZiwdPfg'),
    );
    result.add(
      CategoryModel(
          name: 'Mobile',
          url:
              'https://www.youtube.com/feeds/videos.xml?playlist_id=PLPFhNx6dMDJpjnHK7o7vTZPrJnfsOoR7R'),
    );
    result.add(
      CategoryModel(
          name: 'Web3',
          url:
              'https://www.youtube.com/feeds/videos.xml?playlist_id=PLPFhNx6dMDJpaLzS2t5ZjHdwQKgOQKETH'),
    );
    result.add(
      CategoryModel(
          name: 'Cloud & DevOps',
          url:
              'https://www.youtube.com/feeds/videos.xml?playlist_id=PLPFhNx6dMDJrwypBn9GMKwMgCebgWlwCW'),
    );
    result.add(
      CategoryModel(
          name: 'Back-end',
          url:
              'https://www.youtube.com/feeds/videos.xml?playlist_id=PLPFhNx6dMDJoggzYkKG-LnhIay__GfS7C'),
    );
    result.add(
      CategoryModel(
          name: 'Front-end',
          url:
              'https://www.youtube.com/feeds/videos.xml?playlist_id=PLPFhNx6dMDJobdQQ2qY2FCOLwBR_X0Vsn'),
    );
    return result;
  }
}
