




// import 'package:flutter/material.dart';
//
// import '../model/image_model.dart';
//
// class ImageDetailPage extends StatelessWidget {
//   final PixabayImage image;
//
//   const ImageDetailPage({super.key, required this.image});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Image Details'),
//       ),
//       body: Column(
//         children: [
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: 220,
//             padding: EdgeInsets.all(6),
//             child: Image.network(
//               image.previewURL,
//               fit: BoxFit.fill,
//             ),
//           ),
//           Text(image.tags),
//           Text(image.type),
//
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 // کد دانلود تصویر
//               },
//               child: const Text('Download Image'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
