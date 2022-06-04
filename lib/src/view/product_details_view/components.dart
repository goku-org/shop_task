import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import '../../../utils/helper/size_configuration_helper.dart';
import '../../../utils/icon_broken.dart';
import '../../../utils/theme/colors.dart';
import '../../model/cart_product.dart';
import '../../model/product_details.dart';
import '../../view_model/cart_view_model/cart_view_model.dart';
import '../../view_model/product_details_view_model/product_details_view_model.dart';
import '../../view_model/product_details_view_model/states.dart';
import '../shared_components/shared_components.dart';

class ProductDetailsImagesWidget extends StatefulWidget {
  const ProductDetailsImagesWidget({Key? key, required this.images})
      : super(key: key);
  final List<Img> images;

  @override
  State<ProductDetailsImagesWidget> createState() =>
      _ProductDetailsImagesWidgetState();
}

class _ProductDetailsImagesWidgetState
    extends State<ProductDetailsImagesWidget> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: infinityWidth,
      padding: EdgeInsets.fromLTRB(50.w, 0.0, 50.w, 30.h),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            widget.images[0].image,
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(1, 1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: whiteClr,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(1, 1),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: PageView.builder(
          controller: _controller,
          itemCount: widget.images.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => Stack(
            alignment: Alignment.center,
            children: [
              NetworkImageUtil(
                imageUrl: widget.images[index].image,
                height: infinityHeight,
                width: infinityWidth,
                bottomRight: 30,
                bottomLeft: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButtonUtil(
                    icon: Icons.arrow_back_ios,
                    color: blackClr,
                    iconSize: 30.sp,
                    onClick: () => _controller.previousPage(
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeIn),
                  ),
                  IconButtonUtil(
                    icon: Icons.arrow_forward_ios,
                    color: blackClr,
                    iconSize: 30.sp,
                    onClick: () => _controller.nextPage(
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeIn,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class ProductDetailsOptionWidget extends StatelessWidget {
  const ProductDetailsOptionWidget({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: infinityWidth,
      margin: symmetricHorizontalPadding3(),
      padding: symmetricHorizontalPadding2(),
      color: Colors.grey.shade300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textBaseline: TextBaseline.alphabetic,
        children: [
          SizedBox(
            width: SizeConfigurationHelper.screenWidth * 0.3,
            child: TextUtil(
              text: '$title :',
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: blackClr,
              maxLines: 1,
            ),
          ),
          TextUtil(
            text: description,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: blackClr,
            textOverflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}

class ProductDetailsCartButtonWidget extends StatelessWidget {
  const ProductDetailsCartButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailsViewModel>(
      builder: (context, provider, child) {
        if (provider.states == ProductDetailsStates.loadingState) {
          return const LoadingUtil();
        } else if (provider.states == ProductDetailsStates.loadedState) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButtonUtil(
              color: mainClr,
              borderColor: mainClr,
              radius: 5,
              size: Size(infinityWidth, 40.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextUtil(
                    text: 'add_to_cart'.tr(),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: whiteClr,
                    height: 1,
                  ),
                  horizontalSpace2(),
                  Icon(
                    IconBroken.Buy,
                    size: 30.sp,
                    color: whiteClr,
                  ),
                ],
              ),
              onClick: () => context.read<CartViewModel>().addToCart(
                    cartProduct: CartProduct(
                        id: provider.product!.id,
                        title: provider.product!.title,
                        price: provider.product!.price.toString(),
                        image: provider.product!.images[0].image,
                        quantity: 1),
                  ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
