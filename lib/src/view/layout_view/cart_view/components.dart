import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:shop_task/src/model/cart_product.dart';
import '../../../../utils/theme/colors.dart';
import '../../shared_components/shared_components.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget(
      {Key? key,
      required this.cartProduct,
      required this.increment,
      required this.decrement,
      required this.delete})
      : super(key: key);
  final CartProduct cartProduct;
  final Function() increment, decrement, delete;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: infinityWidth,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: Border.all(color: greyClr, width: 1.5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NetworkImageUtil(
            imageUrl: cartProduct.image,
            height: 120.h,
            width: 100.w,
          ),
          horizontalSpace2(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 110.w,
                child: TextUtil(
                  text: cartProduct.title,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: blackClr,
                  textOverflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              const SizedBox(height: 2),
              TextUtil(
                text: '${cartProduct.price} ${'le'.tr()}',
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: blackClr,
              ),
              verticalSpace1(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButtonUtil(
                    icon: Icons.add_circle_outline,
                    color: blackClr,
                    iconSize: 35.sp,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onClick: increment,
                  ),
                  horizontalSpace1(),
                  TextUtil(
                    text: cartProduct.quantity.toString(),
                    fontSize: 24.sp,
                    color: blackClr,
                    fontWeight: FontWeight.bold,
                  ),
                  horizontalSpace1(),
                  IconButtonUtil(
                    icon: Icons.remove_circle_outline,
                    color: blackClr,
                    iconSize: 35.sp,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onClick: decrement,
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          IconButtonUtil(
            icon: Icons.delete,
            color: mainClr,
            iconSize: 35.sp,
            onClick: delete,
          ),
          const SizedBox(width: 5,),
        ],
      ),
    );
  }
}
