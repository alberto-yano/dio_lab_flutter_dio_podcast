import 'dart:developer';

import 'package:dio_lab_flutter_dio_podcast/src/widgets/feed_list_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SmallPlayer extends StatefulWidget {
  const SmallPlayer({super.key});

  @override
  State<SmallPlayer> createState() => _SmallPlayerState();
}

class _SmallPlayerState extends State<SmallPlayer> {
  FeedListStore store = Modular.get<FeedListStore>();
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = MyYoutubePlayerController(
      initialVideoId:
          store.state.entry!.firstWhere((e) => e.isPlaying).ytVideoId!,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
        captionLanguage: 'pt',
        showLiveFullscreenButton: false,
      ),
    );
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: ScopedBuilder(
        store: store,
        onState: (context, state) {
          return YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
              onReady: () {
                log("Player Ready");
              },
              onEnded: (data) {
                int index = store.state.entry!
                    .indexOf(store.state.entry!.firstWhere((e) => e.isPlaying));
                store.tocar(index);
                if (index < store.state.entry!.length - 1) {
                  playNext(index);
                }
              },
            ),
            builder: (context, player) => player,
          );
        },
      ),
    );
  }

  Future<void> playNext(int index) async {
    return Future.delayed(
      const Duration(seconds: 1),
      () => store.tocar(index + 1),
    );
  }
}

class MyYoutubePlayerController extends YoutubePlayerController {
  MyYoutubePlayerController({
    required super.initialVideoId,
    flags = const YoutubePlayerFlags(),
  }) : super();

  @override
  void toggleFullScreenMode() {}
}
