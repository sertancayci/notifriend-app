import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifriend/core/helpers/app_services_with.dart';
import 'package:notifriend/core/ui/base_scaffold.dart';
import 'package:notifriend/models/category/category_response.dart';
import 'package:notifriend/pages/Category/category_page_provider.dart';
import 'package:notifriend/pages/Channel/channel_page.dart';
import 'package:notifriend/pages/widgets/bottom_navigation_bar_widget.dart';

final categoryProvider =
    StateNotifierProvider<CategoryNotifier, CategoryState>((ref) {
  return CategoryNotifier();
});

class CategoryPage extends ConsumerStatefulWidget with AppServices {
  CategoryPage({super.key});

  static const String routeName = '/categories';

  @override
  ConsumerState createState() => _CategoryPageState();
}

class _CategoryPageState extends ConsumerState<CategoryPage> {
  void initState() {
    super.initState();
    ref.read(categoryProvider.notifier).fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Categories', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: 1,
      ),
      body: SafeArea(
        child: Container(
          child: _categoriesSection(context, ref),
        ),
      ),
    );
  }

  Widget _categoriesSection(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryProvider).categories;
    if (categories == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Align(
      alignment: Alignment.center,
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 162 / 96,
        ),
        itemCount: categories!.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return _buildCategoryCard(category);
        },
      ),
    );
  }

  Widget _buildCategoryCard(CategoryResponse category) {
    return GestureDetector(
      onTap: () {
        widget.navigationService.navigateToNamedAndRemoveUntil(
            ChannelsPage.routeName,
            arguments: ChannelsPagePageArguments(categoryId: category.id));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: category.color,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  category.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 81,
                  height: 36,
                  child: Image.asset(
                    'assets/images/${category.thumbnail}',
                    width: 36,
                    height: 36,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
