import 'package:dio/dio.dart';
import 'package:dio_lab_flutter_dio_podcast/src/util/xml_2_json_transformer.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../models/feed_model.dart';

class FeedListStore extends Store<FeedModel> {
  FeedListStore() : super(FeedModel());

  Future<void> loadFeed(String url) async {
    execute(
      () async {
        FeedModel feed = await _getDio().get(url).then(
          (res) {
            return FeedModel.fromJson(res.data['feed']);
          },
        );
        feed.isReady = true;
        return feed;
      },
    );
  }

  void tocar(int index) {
    execute(() async {
      bool estado = state.entry![index].isPlaying;
      for (var e in state.entry!) {
        e.isPlaying = false;
      }
      state.entry![index].isPlaying = !estado;
      state.isPlaying = !estado;
      return state;
    });
  }

  Dio _getDio() {
    var dio = Dio();
    dio.transformer = Xml2JsonTransformer();
    return dio;
  }
}
