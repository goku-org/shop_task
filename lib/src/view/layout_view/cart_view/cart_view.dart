import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shop_task/src/view/shared_components/shared_components.dart';
import 'package:shop_task/utils/theme/colors.dart';
import '../../../view_model/cart_view_model/cart_view_model.dart';
import 'components.dart';
import 'package:localize_and_translate/localize_and_translate.dart';


class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CartViewModel>(
        builder: (context, provider, child) {
          if (provider.cartProducts!.isEmpty) {
            return Center(
              child: TextUtil(
                text: 'empty'.tr(),
                fontSize: 28.sp,
                color: mainClr,
              ),
            );
          } else {
            return ListView.separated(
              padding: padding2(),
              itemCount: provider.cartProducts!.length + 1,
              itemBuilder: (_, index) {
                return index == provider.cartProducts!.length ? Container(
                  height: 50.h,
                  width: infinityWidth,
                  color: Colors.grey.shade200,
                  child: Center(
                    child: TextUtil(
                      text: '${'total_price'.tr()} ${provider.totalPrice} ${'le'.tr()}',
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: mainClr,
                    ),
                  ),
                ) : CartItemWidget(
                  cartProduct: provider.cartProducts![index],
                  increment: (){
                    provider.incrementQuantity(index: index);
                  },
                  decrement: (){
                    provider.decrementQuantity(index: index);
                  },
                  delete: (){
                    provider.deleteFromCart(
                        cartProduct: provider.cartProducts![index]);
                  },
                );
              },
              separatorBuilder: (_, index) => verticalSpace2(),
            );
          }
        },
      ),
    );
  }
}
