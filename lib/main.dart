

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:pixabay_image_explorer/screen/image_search_page.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // این گزینه را در حالت تولید به false تغییر دهید
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pixabay Image Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageSearchPage(),
    );
  }
}