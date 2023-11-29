import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pixabay_image_explorer/screen/pagination_widget.dart';


import '../api/pixabay_api.dart';
import '../model/image_model.dart';
import 'category_list_widget.dart';
import 'image_view_page.dart';

class ImageSearchPage extends StatefulWidget {
  @override
  _ImageSearchPageState createState() => _ImageSearchPageState();
}

class _ImageSearchPageState extends State<ImageSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<ImageHit> _images = [];
  bool _isLoading = false;
  int _currentPage = 1;
  final int _perPage = 100;
  bool _hasNextPage = true;
  late ScrollController scrollController;

  final List<String> categories = [
    'Ai',
    'backgrounds',
    'Beautiful girl',
    'fashion',
    'nature',
    'science',
    'education',
    'feelings',
    'health',
    'people',
    'religion',
    'places',
    'animals',
    'industry',
    'computer',
    'food',
    'sports',
    'transportation',
    'travel',
    'buildings',
    'business',
    'music',
    'sky',
    'cat',
    'christmas',
    'forest',
    'flower',
    'love',
    'flowers',
    'space',
    'iphone wallpaper',
  ];

  @override
  void initState() {
    super.initState();
    _loadImages(_currentPage);
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _loadImages(int page) async {
    setState(() {
      _isLoading = true;
      _images.clear(); // خالی کردن لیست تصاویر قبلی
    });

    final service = PixabayService(Dio());
    try {
      final response = await service.searchImages(
        "21029731-65e3762ee2eff846b6dd11fcc",
        _searchController.text,
        // کلمه جستجو
        "en",
        // زبان
        "photo",
        // نوع تصویر
        "all",
        // جهت تصویر
        "nature",
        // دسته‌بندی
        0,
        // حداقل عرض
        0,
        // حداقل ارتفاع
        "",
        // رنگ‌ها
        false,
        // انتخاب سردبیر
        false,
        // جستجوی امن
        "popular",
        // ترتیب
        page,
        // شماره صفحه
        _perPage,
        // تعداد نتایج در هر صفحه
        "",
        // callback (اگر نیاز نیست, یک رشته خالی ارسال کنید)
        false, // pretty
      );
      setState(() {
        _images = response.hits;
        _hasNextPage = response.totalHits > _currentPage * _perPage;
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _searchImages() async {
    _loadImages(_currentPage);
  }

  void _onCategorySelected(String category) {
    _searchController.text = category;
    // _searchImages();
    _loadImages(1); // بارگذاری صفحه اول با دسته‌بندی جدید
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pixabay Image Search'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _searchImages,
                ),
              ),
              onSubmitted: (value) => _searchImages(),
            ),
          ),
          CategoriesWidget(
            categories: categories,
            onCategorySelected: _onCategorySelected,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: _images.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ImageViewPage(image: _images[index]),
                    ));
                  },
                  child: Image.network(
                    _images[index].previewURL ?? '',
                    fit: BoxFit.cover,
                  ),
                );
              },
              staggeredTileBuilder: (int index) =>
                  StaggeredTile.count(2, index.isEven ? 2 : 3),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              physics: const BouncingScrollPhysics(), // اضافه شده
            ),
          ),
          PaginationWidget(
            currentPage: _currentPage,
            onPageChanged: (page) {
              setState(() {
                _currentPage = page;
                _loadImages(page);
              });
            },
            hasNextPage: _hasNextPage,
            scrollController: scrollController,
          ),
        ],
      ),
    );
  }
}

