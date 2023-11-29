// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:project_me_http/screen/category_list_widget.dart';
// import 'package:project_me_http/screen/video_view_page.dart';
// import 'package:project_me_http/screen/pagination_widget.dart';
//
// import '../api/pixabay_api.dart';
// import '../model/video_model.dart';
// import '../widget/video_widget.dart';
//
// class VideoSearchPage extends StatefulWidget {
//   @override
//   _VideoSearchPageState createState() => _VideoSearchPageState();
// }
//
// class _VideoSearchPageState extends State<VideoSearchPage> {
//   final TextEditingController _searchController = TextEditingController();
//   List<VideoHit> _videos = [];
//   bool _isLoading = false;
//   int _currentPage = 1;
//   final int _perPage = 20;
//   bool _hasNextPage = true;
//   late ScrollController scrollController;
//
//   final List<String> categories = [
//     // اضافه کردن دسته‌بندی‌های مورد نظر برای ویدیوها
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadVideos(_currentPage);
//     scrollController = ScrollController();
//   }
//
//   @override
//   void dispose() {
//     scrollController.dispose();
//     super.dispose();
//   }
//
//   void _loadVideos(int page) async {
//     setState(() {
//       _isLoading = true;
//       _videos.clear(); // خالی کردن لیست ویدیوهای قبلی
//     });
//
//     final service = PixabayService(Dio());
//     try {
//       final response = await service.searchVideos(
//         "21029731-65e3762ee2eff846b6dd11fcc",
//         _searchController.text,
//         // کلمه جستجو
//         "en",
//         // زبان
//         "all",
//         // نوع ویدیو
//         "all",
//         // دسته‌بندی
//         0,
//         // حداقل عرض
//         0,
//         // حداقل ارتفاع
//         false,
//         // انتخاب سردبیر
//         true,
//         // جستجوی امن
//         "popular",
//         // ترتیب
//         page,
//         // شماره صفحه
//         _perPage,
//         // تعداد نتایج در هر صفحه
//         "",
//         // callback (اگر نیاز نیست, یک رشته خالی ارسال کنید)
//         true, // pretty
//       );
//       setState(() {
//         _videos = response.hits;
//         _hasNextPage = response.totalHits > _currentPage * _perPage;
//       });
//     } catch (e) {
//       print(e);
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }
//
//   void _searchVideos() async {
//     _loadVideos(_currentPage);
//   }
//
//   void _onCategorySelected(String category) {
//     _searchController.text = category;
//     _loadVideos(1); // بارگذاری صفحه اول با دسته‌بندی جدید
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pixabay Video Search'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 labelText: 'Search',
//                 suffixIcon: IconButton(
//                   icon: const Icon(Icons.search),
//                   onPressed: _searchVideos,
//                 ),
//               ),
//               onSubmitted: (value) => _searchVideos(),
//             ),
//           ),
//           CategoriesWidget(
//             categories: categories,
//             onCategorySelected: _onCategorySelected,
//           ),
//           const SizedBox(height: 8),
//           Expanded(
//             child: StaggeredGridView.countBuilder(
//               crossAxisCount: 4,
//               itemCount: _videos.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => VideoViewPage(videoUrl: _videos[index].videos),
//                     ));
//                   },
//
//                   child: VideoWidget(videoUrl: _videos[index].videos),
//                   // child: Image.network(
//                   //   _videos[index].videos, // تصویر کوچک ویدیو
//                   //   fit: BoxFit.cover,
//                   // ),
//                 );
//               },
//               staggeredTileBuilder: (int index) =>
//                   StaggeredTile.count(2, index.isEven ? 2 : 3),
//               mainAxisSpacing: 4.0,
//               crossAxisSpacing: 4.0,
//               physics: const BouncingScrollPhysics(), // اضافه شده
//             ),
//           ),
//           PaginationWidget(
//             currentPage: _currentPage,
//             onPageChanged: (page) {
//               setState(() {
//                 _currentPage = page;
//                 _loadVideos(page);
//               });
//             },
//             hasNextPage: _hasNextPage,
//             scrollController: scrollController,
//           ),
//         ],
//       ),
//     );
//   }
// }
