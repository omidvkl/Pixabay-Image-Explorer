import 'package:flutter/material.dart';

class PaginationWidget extends StatelessWidget {
  final int currentPage;
  final Function(int) onPageChanged;
  final bool hasNextPage;
  final ScrollController scrollController;

  const PaginationWidget({
    Key? key,
    required this.currentPage,
    required this.onPageChanged,
    this.hasNextPage = true,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: currentPage > 1
              ? () {
                  onPageChanged(currentPage - 1);
                  scrollController.animateTo(0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut); // اضافه شده
                }
              : null,
        ),
        Text('صفحه $currentPage'),
        IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: hasNextPage
              ? () {
                  onPageChanged(currentPage + 1);
                  scrollController.animateTo(0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut); // اضافه شده
                }
              : null,
        ),
      ],
    );
  }
}
