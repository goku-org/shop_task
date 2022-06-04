import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_task/src/view/layout_view/profile_view/profile_view.dart';
import '../../../utils/helper/size_configuration_helper.dart';
import '../../view_model/layout_view_model/layout_view_model.dart';
import 'cart_view/cart_view.dart';
import 'categories_view/categories_view.dart';
import 'components.dart';
import 'home_view/home_view.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({Key? key}) : super(key: key);
  final List<Widget> _pages = const [
    HomeView(),
    CartView(),
    CategoriesView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfigurationHelper.initSizeConfiguration(context);
    return Scaffold(
      appBar: layoutAppBarWidget(context),
      body: Stack(
        children: _pages
            .asMap()
            .map(
              (index, page) => MapEntry(
                index,
                Offstage(
                  offstage: context.select<LayoutViewModel, int>(
                          (value) => value.currentPage) !=
                      index,
                  child: page,
                ),
              ),
            )
            .values
            .toList(),
      ),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }
}
