import 'package:dio_lab_flutter_dio_podcast/src/pages/home_page.dart';
import 'package:dio_lab_flutter_dio_podcast/src/repositories/category_repository.dart';
import 'package:dio_lab_flutter_dio_podcast/src/widgets/category.dart';
import 'package:dio_lab_flutter_dio_podcast/src/widgets/category_button.dart';
import 'package:dio_lab_flutter_dio_podcast/src/widgets/feed_list_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(FeedListStore.new);
    i.addSingleton(CategoryRepository.new);
    i.add(CategoryWidget.new);
    i.add(CategoryButtonWidget.new);
    i.add(HomePage.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => Modular.get<HomePage>());
  }
}
