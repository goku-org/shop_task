import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../src/view_model/cart_view_model/cart_view_model.dart';
import '../../src/view_model/home_view_model/home_view_model.dart';
import '../../src/view_model/layout_view_model/layout_view_model.dart';
import '../../src/view_model/product_details_view_model/product_details_view_model.dart';

class Providers {
  static final List<SingleChildWidget> providers = [
    ChangeNotifierProvider<LayoutViewModel>(
      create: (_) => LayoutViewModel(),
    ),
    ChangeNotifierProvider<HomeViewModel>(
      create: (_) => HomeViewModel(),
    ),
    ChangeNotifierProvider<ProductDetailsViewModel>(
      create: (_) => ProductDetailsViewModel(),
    ),
    ChangeNotifierProvider<CartViewModel>(
      create: (_) => CartViewModel(),
    )
  ];
}
