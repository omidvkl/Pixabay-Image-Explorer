// import 'package:flutter/material.dart';
// import 'package:chewie/chewie.dart';
// import 'package:video_player/video_player.dart';
//
// class VideoWidget extends StatefulWidget {
//   final String videoUrl;
//
//   const VideoWidget({Key? key, required this.videoUrl}) : super(key: key);
//
//   @override
//   _VideoWidgetState createState() => _VideoWidgetState();
// }
//
// class _VideoWidgetState extends State<VideoWidget> {
//   late VideoPlayerController _videoPlayerController;
//   ChewieController? _chewieController;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializePlayer();
//   }
//
//   Future<void> _initializePlayer() async {
//     _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
//     await _videoPlayerController.initialize();
//     _chewieController = ChewieController(
//       videoPlayerController: _videoPlayerController,
//       autoPlay: true,
//       looping: true,
//       // اینجا می‌توانید سایر تنظیمات مورد نظر خود را اضافه کنید
//     );
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _chewieController != null &&
//         _chewieController!.videoPlayerController.value.isInitialized
//         ? Chewie(
//       controller: _chewieController!,
//     )
//         : const Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         CircularProgressIndicator(),
//         SizedBox(height: 20),
//         Text('در حال بارگذاری ویدیو...'),
//       ],
//     );
//   }
//
//   @override
//   void dispose() {
//     _videoPlayerController.dispose();
//     _chewieController?.dispose();
//     super.dispose();
//   }
// }
