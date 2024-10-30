import 'package:dio_lab_flutter_dio_podcast/src/repositories/category_repository.dart';
import 'package:dio_lab_flutter_dio_podcast/src/util/custom_color.dart';
import 'package:dio_lab_flutter_dio_podcast/src/widgets/feed_list_store.dart';
import 'package:dio_lab_flutter_dio_podcast/src/widgets/podcast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class FeedListWidget extends StatefulWidget {
  const FeedListWidget({super.key});

  @override
  State<FeedListWidget> createState() => _FeedListWidgetState();
}

class _FeedListWidgetState extends State<FeedListWidget> {
  FeedListStore store = Modular.get<FeedListStore>();
  late Disposer _disposer;

  @override
  void initState() {
    super.initState();
    store
        .loadFeed(Modular.get<CategoryRepository>().findAllCagegories()[0].url);
    _disposer = store.observer(
      onLoading: (loading) => print('Loading: $loading'),
      onState: (state) => print('Estado: $state'),
      onError: (error) => print(error),
    );
  }

  @override
  void dispose() {
    _disposer();
    store.destroy();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder(
      store: store,
      onLoading: (context) => SizedBox(
        height: store.state.isPlaying
            ? MediaQuery.of(context).size.height * 0.45
            : MediaQuery.of(context).size.height * 0.70,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      onState: (context, state) {
        return SizedBox(
          height: store.state.isPlaying
              ? MediaQuery.of(context).size.height * 0.45
              : MediaQuery.of(context).size.height * 0.70,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: store.state.entry?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return PodcastWidget(
                  index: index,
                  img: store.state.entry?[index].mediaGroup?.mediaThumbnail
                          ?.sUrl ??
                      "",
                  title: store.state.entry?[index].title ?? "",
                  description:
                      store.state.entry?[index].mediaGroup?.mediaDescription ??
                          "",
                  color: store.state.entry![index].isPlaying
                      ? CustomColor.pink700
                      : CustomColor.gray700,
                  icon: Icon(
                    store.state.entry![index].isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.white,
                  ));
            },
          ),
        );
      },
    );
  }
}
