import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:shop_task/src/view/shared_components/shared_components.dart';
import 'package:shop_task/utils/theme/colors.dart';
import '../../../utils/icon_broken.dart';
import '../../model/cart_product.dart';
import '../../model/product_details.dart';
import '../../view_model/cart_view_model/cart_view_model.dart';
import '../../view_model/product_details_view_model/product_details_view_model.dart';
import '../../view_model/product_details_view_model/states.dart';
import 'components.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        body: Consumer<ProductDetailsViewModel>(
          builder: (context, provider, child) {
            if (provider.states == ProductDetailsStates.loadingState) {
              return const LoadingUtil();
            } else if (provider.states == ProductDetailsStates.loadedState) {
              List<ProductDetailsOptionWidget> _options = [
                ProductDetailsOptionWidget(
                    title: 'category'.tr(), description: provider.product!.cat),
                ProductDetailsOptionWidget(
                    title: 'brand'.tr(),
                    description: provider.product!.brandsModal[0].brand),
                ProductDetailsOptionWidget(
                    title: 'modal'.tr(),
                    description: provider.product!.brandsModal[0].modal),
                ProductDetailsOptionWidget(
                    title: 'country_manufacture'.tr(),
                    description: provider.product!.countryManufacture),
              ];
              return NestedScrollView(
                headerSliverBuilder: (context, value) {
                  return [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProductDetailsImagesWidget(
                              images: provider.product!.images),
                          verticalSpace2(),
                          Padding(
                            padding: symmetricHorizontalPadding3(),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: TextUtil(
                                    text: provider.product!.title,
                                    fontSize: 22.sp,
                                    color: blackClr,
                                    fontWeight: FontWeight.bold,
                                    textOverflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    height: 1,
                                  ),
                                ),
                                IconButtonUtil(
                                  icon: Icons.favorite_border_rounded,
                                  color: provider.product!.favorite != true
                                      ? blackClr
                                      : redClr,
                                  iconSize: 26.sp,
                                  onClick: () {},
                                ),
                              ],
                            ),
                          ),
                          verticalSpace2(),
                          Container(
                            height: 40.h,
                            width: infinityWidth,
                            color: Colors.grey.shade300,
                            child: TabBar(
                              labelStyle: TextStyle(
                                color: mainClr,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              unselectedLabelColor: blackClr,
                              labelColor: mainClr,
                              indicatorColor: mainClr,
                              indicatorWeight: 2,
                              tabs: [
                                Tab(
                                  text: 'description'.tr(),
                                ),
                                Tab(
                                  text: 'details'.tr(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextUtil(
                        text: provider.product!.details,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: blackClr,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(top: 10),
                      itemCount: _options.length,
                      itemBuilder: (_, index) => _options[index],
                      separatorBuilder: (_, index) => verticalSpace2(),
                    ),
                  ],
                ),
              );
            } else {
              return ErrorResultUtil(errorResult: provider.errorResult!);
            }
          },
        ),
        bottomNavigationBar: const ProductDetailsCartButtonWidget(),
      ),
    );
  }
}

