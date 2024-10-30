import 'package:dio_lab_flutter_dio_podcast/src/widgets/botton_navigator.dart';
import 'package:dio_lab_flutter_dio_podcast/src/widgets/category.dart';
import 'package:dio_lab_flutter_dio_podcast/src/widgets/feed_list_store.dart';
import 'package:dio_lab_flutter_dio_podcast/src/widgets/feed_list_widget.dart';
import 'package:dio_lab_flutter_dio_podcast/src/widgets/header.dart';
import 'package:dio_lab_flutter_dio_podcast/src/widgets/small_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FeedListStore store = Modular.get<FeedListStore>();
  CategoryWidget categoryWidget = Modular.get<CategoryWidget>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScopedBuilder(
          store: store,
          onState: (context, state) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Header(),
                  const SizedBox(height: 10),
                  categoryWidget,
                  const SizedBox(height: 10),
                  const FeedListWidget(),
                  store.state.isPlaying
                      ? const SmallPlayer()
                      : const SizedBox(
                          height: 40,
                        ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: const BottonNavigator(),
      ),
    );
  }
}
