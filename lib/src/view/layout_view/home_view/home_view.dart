import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_task/src/view/shared_components/shared_components.dart';
import 'package:shop_task/src/view_model/product_details_view_model/product_details_view_model.dart';
import '../../../../utils/helper/size_configuration_helper.dart';
import '../../../view_model/home_view_model/home_view_model.dart';
import '../../../view_model/home_view_model/states.dart';
import '../../product_details_view/product_details_view.dart';
import 'components.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeViewModel>(
        builder: (context, provider, child) {
          if (provider.states == HomeDataStates.initialState) {
            provider.getHomeData();
            return const LoadingUtil();
          } else if (provider.states == HomeDataStates.loadingState) {
            return const LoadingUtil();
          } else if (provider.states == HomeDataStates.loadedState) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace2(),
                  SliderWidget(sliderImages: provider.homeData!.sliders),
                  verticalSpace2(),
                  IndicatorWidget(count: provider.homeData!.sliders.length),
                  verticalSpace2(),
                  CategoryButtonWidget(
                      categories: provider.homeData!.categories),
                  verticalSpace2(),
                  FeaturedWidget(),
                  verticalSpace2(),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          SizeConfigurationHelper.screenOrientation ==
                                  Orientation.portrait
                              ? 2
                              : 3,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: provider.selectedProduct!.length,
                    itemBuilder: (_, index) => ProductUtil(
                      product: provider.selectedProduct![index],
                      onClick: () {
                        context
                            .read<ProductDetailsViewModel>()
                            .getProductDetails(
                                id: provider.selectedProduct![index].id
                                    .toString());
                        onNavigate(
                          context,
                          screen: ProductDetailsView(
                            index: index,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return ErrorResultUtil(errorResult: provider.errorResult!);
          }
        },
      ),
    );
  }
}
