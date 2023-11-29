import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  final List<String> categories;
  final Function(String) onCategorySelected;

  const CategoriesWidget({Key? key, required this.categories, required this.onCategorySelected}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onCategorySelected(categories[index]),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              padding: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              child: Text(categories[index]),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue[100],
              ),
            ),
          );
        },
      ),
    );
  }
}
