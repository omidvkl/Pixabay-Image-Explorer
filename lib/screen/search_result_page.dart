import 'package:flutter/material.dart';

import '../model/image_model.dart';
import 'image_view_page.dart';

class SearchResultPage extends StatelessWidget {
  final List<ImageHit> images;

  SearchResultPage({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('نتایج جستجو'),
      ),
      body: GridView.builder(
        itemCount: images.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 6, left: 6),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ImageViewPage(image: images[index]),
                    ));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      images[index].previewURL ?? '',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 180,
                    ),
                  ),
                ),
              ),
              Expanded(child: Text(images[index].tags ?? '')),
            ],
            // leading: Image.network(images[index].previewURL ?? ''),
            // title: Text(images[index].tags ?? ''),
          );
        },
      ),
    );
  }
}
