// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:project_me_http/screen/pagination_widget.dart';
//
// class ImageListPage extends StatefulWidget {
//   @override
//   _ImageListPageState createState() => _ImageListPageState();
// }
//
// class _ImageListPageState extends State<ImageListPage> {
//   final ScrollController _scrollController = ScrollController();
//   int _currentPage = 1;
//   bool _hasNextPage = true;
//
//   void _changePage(int page) {
//     setState(() {
//       _currentPage = page;
//       // ... بارگذاری تصاویر برای صفحه جدید
//     });
//     _scrollController.animateTo(
//       0,
//       duration: Duration(milliseconds: 300),
//       curve: Curves.easeOut,
//     );
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: PaginationWidget(
//         currentPage: _currentPage,
//         // onPageChanged: _changePage,
//         onPageChanged: (page) {
//           setState(() {
//             _currentPage = page;
//             _loadImages(page);
//           });
//         },
//         hasNextPage: _hasNextPage,
//         scrollController: _scrollController, // اضافه شده
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
// }
