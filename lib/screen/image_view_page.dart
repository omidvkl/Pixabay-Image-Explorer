import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:path_provider/path_provider.dart';

import '../api/pixabay_api.dart';
import '../model/image_model.dart';

class ImageViewPage extends StatefulWidget {
  // final String imageUrl;
  // final String tags;
  // final int likes;
  // final List<ImageHit> images;
  final ImageHit image;

  ImageViewPage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  State<ImageViewPage> createState() => _ImageViewPageState();
}

class _ImageViewPageState extends State<ImageViewPage> {
  List<ImageHit> relatedImages = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadRelatedImages();
  }

  void _loadRelatedImages() async {
    final service = PixabayService(Dio());
    try {
      final response = await service.searchImages(
        "21029731-65e3762ee2eff846b6dd11fcc",
        widget.image.tags ?? '',
        "en",
        "photo",
        "all",
        "nature",
        0,
        0,
        "",
        false,
        false,
        "popular",
        1,
        20,
        "",
        false,
      );
      setState(() {
        relatedImages = response.hits;
        isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.image.tags ?? ''),
      ),
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(widget.image.largeImageURL ?? ''),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const Icon(
                        CupertinoIcons.heart,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text('Likes: ${widget.image.likes ?? 0}'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        CupertinoIcons.down_arrow,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text('Download: ${widget.image.downloads ?? 0}'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text('Related Free Images',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              ),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: relatedImages.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), // این خط باعث می‌شود که StaggeredGridView خودش اسکرول نشود
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    relatedImages[index].previewURL ?? '',
                    fit: BoxFit.cover,
                  );
                },
                staggeredTileBuilder: (int index) =>
                    StaggeredTile.count(2, index.isEven ? 2 : 3),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showDownloadOptions(context, widget.image),
        child: const Icon(Icons.download),
      ),
    );
  }

  void _showDownloadOptions(BuildContext context, ImageHit image) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('دانلود با کیفیت بالا'),
                onTap: () => _downloadImage(image.largeImageURL),
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('دانلود با کیفیت متوسط'),
                onTap: () => _downloadImage(image.webformatURL),
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('دانلود با کیفیت پایین'),
                onTap: () => _downloadImage(image.previewURL),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _downloadImage(String? url) async {
    if (url != null && url.isNotEmpty) {
      // تعیین مسیر ذخیره‌سازی
      final directory = await getApplicationDocumentsDirectory();
      final savedDir = directory?.path;

      // بررسی که savedDir null نباشد
      if (savedDir != null) {
        final taskId = await FlutterDownloader.enqueue(
          url: url,
          savedDir: savedDir,
          showNotification: true,
          // نمایش پیشرفت دانلود در نوار وضعیت (برای اندروید)
          openFileFromNotification:
              true, // باز کردن فایل دانلود شده با کلیک بر روی اعلان (برای اندروید)
        );
        // انجام اقدامات لازم با taskId
      }
    }
  }
}
