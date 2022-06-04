import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:shop_task/src/model/category.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../utils/helper/size_configuration_helper.dart';
import '../../../../utils/theme/colors.dart';
import '../../../model/slider.dart';
import '../../../view_model/home_view_model/home_view_model.dart';
import '../../shared_components/shared_components.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({Key? key, required this.sliderImages}) : super(key: key);
  final List<SliderImage> sliderImages;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: sliderImages.length,
      itemBuilder: (_, index, realIndex) {
        return NetworkImageUtil(
          height: 150.h,
          width: infinityWidth,
          imageUrl: sliderImages[index].image,
        );
      },
      options: CarouselOptions(
        onPageChanged: (int value, CarouselPageChangedReason reason) {},
        initialPage: 0,
        height: 160.0,
        disableCenter: true,
        viewportFraction: 1,
        aspectRatio: 1.0,
        autoPlay: sliderImages.length == 1 ? false : true,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 2000),
        pauseAutoPlayOnTouch: true,
        autoPlayCurve: Curves.easeIn,
      ),
    );
  }
}

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({Key? key, required this.count}) : super(key: key);
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedSmoothIndicator(
          activeIndex: 1,
          count: count,
          effect: WormEffect(
            radius: 0,
            dotHeight: 3.h,
            dotWidth: 15.w,
            activeDotColor: mainClr,
            dotColor: Colors.grey.shade400,
          ),
        ),
      ],
    );
  }
}

class CategoryButtonWidget extends StatelessWidget {
  const CategoryButtonWidget({Key? key, required this.categories})
      : super(key: key);
  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (TapUpDetails? details) {
        double dx = details!.globalPosition.dx;
        double dy = details.globalPosition.dy;
        double dx2 = MediaQuery.of(context).size.width - dx;
        double dy2 = MediaQuery.of(context).size.width - dy;
        showMenu(
          context: context,
          position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
          color: whiteClr,
          shape: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            borderSide: BorderSide(color: whiteClr, width: 1.5),
          ),
          items: categories
              .map(
                (e) => MyPopUpMenuItem(
                  onClick: ()=> onPop(context),
                  value: e.id,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 15.w,
                        backgroundImage: NetworkImage(e.image),
                      ),
                      horizontalSpace1(),
                      TextUtil(text: e.title, fontSize: 12.sp, color: mainClr, fontWeight: FontWeight.bold,),
                    ],
                  ),
                ),
              )
              .toList(),
        );
      },
      child: Container(
        height: 40.h,
        width: (SizeConfigurationHelper.screenWidth) / 3 - 10,
        margin: symmetricHorizontalPadding1(),
        decoration: BoxDecoration(
          color: whiteClr,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(
            color: mainClr,
            width: 1.5,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 5),
            TextUtil(
              text: 'categories'.tr(),
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: mainClr,
              height: 1,
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 28.sp,
              color: mainClr,
            ),
          ],
        ),
      ),
    );
  }
}

class FeaturedWidget extends StatelessWidget {
  FeaturedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      children: List.generate(
        featuredCategories.length,
        (index) => FeaturedItemWidget(
          title: featuredCategories[index],
          isSelected: false,
          onClick: () =>
              context.read<HomeViewModel>().onSelectFeaturedButton(index),
        ),
      ),
    );
  }

  final List<String> featuredCategories = [
    'spar_parts'.tr(),
    'cars'.tr(),
    'maintenance_place'.tr(),
  ];
}

class FeaturedItemWidget extends StatelessWidget {
  const FeaturedItemWidget({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onClick,
  }) : super(key: key);
  final String title;
  final bool isSelected;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      borderRadius: const BorderRadius.all(
        Radius.circular(5),
      ),
      child: Container(
        height: 40.h,
        width: (SizeConfigurationHelper.screenWidth) / 3 - 10,
        margin: padding1(),
        padding: const EdgeInsets.only(top: 5, left: 2, right: 2),
        decoration: BoxDecoration(
          color: isSelected ? whiteClr : mainClr,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(
            color: mainClr,
            width: 1.5,
          ),
        ),
        child: Center(
          child: TextUtil(
            text: title,
            fontSize: 20.sp,
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.bold,
            color: isSelected ? mainClr : whiteClr,
            textOverflow: TextOverflow.ellipsis,
            maxLines: 1,
            height: 1,
          ),
        ),
      ),
    );
  }
}
