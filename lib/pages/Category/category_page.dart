
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifriend/pages/Category/category_page_provider.dart';


final categoryProvider = StateNotifierProvider<CategoryNotifier, CategoryState>((ref) {
  return CategoryNotifier();
});

class CategoryPage extends ConsumerStatefulWidget {
  const CategoryPage({super.key});

  static const String routeName = '/category';

  @override
  ConsumerState createState() => _CategoryPageState();
}

class _CategoryPageState extends ConsumerState<CategoryPage> {


  void initState() {
    super.initState();
    ref.read(categoryProvider.notifier).init();
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
