import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_learning_app/export.dart';
import 'package:online_learning_app/screens/user/video/user_video_list.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// Creates [YoutubePlayerDemoApp] widget.
class VideoPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Youtube Player Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          color: Colors.blueAccent,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            fontSize: 20,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.blueAccent,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

/// Homepage
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  final List<String> _ids = [
    'nPt8bK2gbaU',
    'gQDByCdjUXw',
    'iLnmTe5Q2Qw',
    '_WoCV4c6XOE',
    'KmzdUe0RSJo',
    '6jZDSSZZxjQ',
    'p2lYr3vM_1w',
    '7QUtEmBT_-w',
    '34_PXCzGw1M',
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _ids.first,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
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
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: YoutubePlayerBuilder(
        onEnterFullScreen: () {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ]);
        },
        onExitFullScreen: () {
          // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
          SystemChrome.setPreferredOrientations(DeviceOrientation.values);
        },
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueAccent,
          topActions: <Widget>[
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                _controller.metadata.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
                size: 25.0,
              ),
              onPressed: () {},
            ),
          ],
          onReady: () {
            _isPlayerReady = true;
          },
          onEnded: (data) {
            _controller.load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
            _showSnackBar('Next Video Started!');
          },
        ),
        builder: (context, player) => Scaffold(
          body: ListView(
            children: [
              player,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _space,
                    _text('Title', _videoMetaData.title),
                    _space,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.skip_previous),
                          onPressed: _isPlayerReady ? () => _controller.load(_ids[(_ids.indexOf(_controller.metadata.videoId) - 1) % _ids.length]) : null,
                        ),
                        IconButton(
                          icon: Icon(
                            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                          ),
                          onPressed: _isPlayerReady
                              ? () {
                                  _controller.value.isPlaying ? _controller.pause() : _controller.play();
                                  setState(() {});
                                }
                              : null,
                        ),
                        IconButton(
                          icon: Icon(_muted ? Icons.volume_off : Icons.volume_up),
                          onPressed: _isPlayerReady
                              ? () {
                                  _muted ? _controller.unMute() : _controller.mute();
                                  setState(() {
                                    _muted = !_muted;
                                  });
                                }
                              : null,
                        ),
                        FullScreenButton(
                          controller: _controller,
                          color: Colors.blueAccent,
                        ),
                        IconButton(
                          icon: const Icon(Icons.skip_next),
                          onPressed: _isPlayerReady ? () => _controller.load(_ids[(_ids.indexOf(_controller.metadata.videoId) + 1) % _ids.length]) : null,
                        ),
                      ],
                    ),
                    _space,
                    Row(
                      children: <Widget>[
                        const Text(
                          "Volume",
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        Expanded(
                          child: Slider(
                            inactiveColor: Colors.transparent,
                            value: _volume,
                            min: 0.0,
                            max: 100.0,
                            divisions: 10,
                            label: '${(_volume).round()}',
                            onChanged: _isPlayerReady
                                ? (value) {
                                    setState(() {
                                      _volume = value;
                                    });
                                    _controller.setVolume(_volume.round());
                                  }
                                : null,
                          ),
                        ),
                      ],
                    ),
                    _space,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _text(String title, String value) {
    return RichText(
      text: TextSpan(
        style: blackTextStyle.copyWith(
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: value,
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStateColor(PlayerState state) {
    switch (state) {
      case PlayerState.unknown:
        return Colors.grey[700]!;
      case PlayerState.unStarted:
        return Colors.pink;
      case PlayerState.ended:
        return Colors.red;
      case PlayerState.playing:
        return Colors.blueAccent;
      case PlayerState.paused:
        return Colors.orange;
      case PlayerState.buffering:
        return Colors.yellow;
      case PlayerState.cued:
        return Colors.blue[900]!;
      default:
        return Colors.blue;
    }
  }

  Widget get _space => const SizedBox(height: 10);

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}
