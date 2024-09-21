import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({
    super.key,
    required this.play,
    required this.ktoplbarheigh,
    required this.url,
  });
  final bool play;
  final bool ktoplbarheigh;
  final String url;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late double _aspectRatio = 16 / 9;
  late VideoPlayerController _controller;
  @override
  void initState() {
    var uri = Uri.parse(widget.url);
    _controller = VideoPlayerController.networkUrl(uri)
      ..initialize().then((_) {
        setState(() {
          // Obtener el tamaño del video
          double videoWidth = _controller.value.size.width;
          double videoHeight = _controller.value.size.height;

          // Calcular el aspect ratio del video
          double aspectRatio = videoWidth / videoHeight;

          // Actualizar el aspect ratio del widget AspectRatio
          _aspectRatio = aspectRatio;
          if (widget.play) _controller.play();
          _controller.setLooping(true);
        });
      });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant VideoPlayerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.play != oldWidget.play) {
      widget.play ? _controller.play() : _controller.pause();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _aspectRatio == (16 / 9)
            ? AspectRatio(aspectRatio: _aspectRatio, child: VideoPlayer(_controller))
            : Padding(
                padding: widget.ktoplbarheigh
                    ? const EdgeInsets.only(top: kTextTabBarHeight)
                    : EdgeInsets.zero,
                child: VideoPlayer(_controller),
              ),
        Container(
          color: Colors.black.withOpacity(0.4),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                _controller.play();
              }
            });
          },
          icon: Icon(
            Icons.play_circle,
            size: 80,
            color: _controller.value.isPlaying ? Colors.transparent : Colors.grey.withOpacity(0.1),
          ),
        )
      ],
    ); // Muestra un indicador de carga mientras se inicializa el controlador de video
  }
}
