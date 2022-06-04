import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:shop_task/src/model/cart_product.dart';
import 'package:shop_task/src/model/product.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../../utils/icon_broken.dart';
import '../../../utils/theme/colors.dart';
import '../../model/error_result.dart';
import '../../view_model/cart_view_model/cart_view_model.dart';

const double infinityHeight = double.infinity;
const double infinityWidth = double.infinity;

SizedBox verticalSpace1() => SizedBox(height: 5.h);

SizedBox verticalSpace2() => SizedBox(height: 10.h);

SizedBox verticalSpace3() => SizedBox(height: 15.h);

SizedBox horizontalSpace1() => SizedBox(width: 5.w);

SizedBox horizontalSpace2() => SizedBox(width: 10.w);

SizedBox horizontalSpace3() => SizedBox(width: 15.w);

EdgeInsets padding1() => const EdgeInsets.all(5);

EdgeInsets padding2() => const EdgeInsets.all(10);

EdgeInsets symmetricVerticalPadding1() =>
    const EdgeInsets.symmetric(vertical: 10);

EdgeInsets symmetricVerticalPadding2() =>
    const EdgeInsets.symmetric(vertical: 15);

EdgeInsets symmetricHorizontalPadding1() =>
    const EdgeInsets.symmetric(horizontal: 5);

EdgeInsets symmetricHorizontalPadding2() =>
    const EdgeInsets.symmetric(horizontal: 10);

EdgeInsets symmetricHorizontalPadding3() =>
    const EdgeInsets.symmetric(horizontal: 15);

///BUTTONS

class IconButtonUtil extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double iconSize;
  final VoidCallback onClick;
  final EdgeInsetsGeometry padding;
  final BoxConstraints? constraints;

  const IconButtonUtil(
      {Key? key,
      required this.icon,
      required this.color,
      required this.iconSize,
      required this.onClick,
      this.padding = const EdgeInsets.all(8.0),
      this.constraints})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      color: color,
      iconSize: iconSize,
      onPressed: onClick,
      padding: padding,
      constraints: constraints,
    );
  }
}

class ElevatedButtonUtil extends StatelessWidget {
  final Widget child;
  final VoidCallback onClick;
  final Color color, borderColor;
  final Size size;
  final double radius;
  final EdgeInsetsGeometry padding;

  const ElevatedButtonUtil({
    Key? key,
    required this.child,
    required this.onClick,
    this.color = whiteClr,
    this.borderColor = whiteClr,
    this.size = const Size(150.0, 50.0),
    this.radius = 0.0,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: child,
      onPressed: onClick,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(size),
        backgroundColor: MaterialStateProperty.all(color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide(color: borderColor, width: 1.5),
          ),
        ),
      ),
    );
  }
}

class TextButtonUtil extends StatelessWidget {
  final String text;
  final double fontSize;
  final double? height;
  final Color color;
  final FontWeight fontWeight;
  final String? fontFamily;
  final TextDecoration? decoration;
  final EdgeInsets? padding;
  final Function() onClick;

  const TextButtonUtil(
      {Key? key,
      required this.text,
      required this.onClick,
      this.color = whiteClr,
      this.fontSize = 16.0,
      this.fontWeight = FontWeight.normal,
      this.fontFamily,
      this.decoration,
      this.height,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: TextUtil(
        text: text,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        decoration: decoration,
        height: height,
      ),
      style: ButtonStyle(padding: MaterialStateProperty.all(padding)),
      onPressed: onClick,
    );
  }
}

class FloatingActionButtonUtil extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final VoidCallback onClick;

  const FloatingActionButtonUtil(
      {Key? key,
      required this.icon,
      required this.iconColor,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        icon,
        color: iconColor,
        size: 34.sp,
      ),
      // shape: OutlineInputBorder(
      //   borderRadius: const BorderRadius.all(Radius.circular(15.0)),
      //   borderSide: BorderSide(
      //     color: Get.isDarkMode ? whiteClr : blackClr,
      //     width: 2,
      //   ),
      // ),
      tooltip: 'create'.tr(),
      onPressed: onClick,
    );
  }
}

class MyPopUpMenuItem<T> extends PopupMenuItem<T> {
  const MyPopUpMenuItem(
      {Key? key, required this.child, required this.onClick, this.value})
      : super(key: key, child: child, value: value);
  final VoidCallback onClick;
  final Widget child;
  final T? value;

  @override
  PopupMenuItemState<T, PopupMenuItem<T>> createState() {
    return MyPopUpMenuItemState();
  }
}

class MyPopUpMenuItemState<T, PopUpMenuItem>
    extends PopupMenuItemState<T, MyPopUpMenuItem<T>> {
  @override
  void handleTap() {
    widget.onClick();
  }
}

class TextUtil extends StatelessWidget {
  final String text;
  final double fontSize;
  final double? height;
  final Color color;
  final FontWeight fontWeight;
  final String? fontFamily;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;

  const TextUtil({
    Key? key,
    required this.text,
    required this.fontSize,
    this.fontWeight = FontWeight.normal,
    this.color = whiteClr,
    this.height,
    this.fontFamily,
    this.decoration,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        height: height,
        decoration: decoration,
      ),
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }
}

class TextFieldUtil extends StatelessWidget {
  const TextFieldUtil({
    Key? key,
    required this.controller,
    required this.onChanged,
    required this.hint,
    this.suffixIcon,
    this.prefixIcon,
    this.radius = 5,
    this.height = 5,
  }) : super(key: key);
  final TextEditingController controller;
  final String hint;
  final Widget? suffixIcon, prefixIcon;
  final double radius, height;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: TextStyle(
        color: mainClr,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        height: 2,
      ),
      cursorColor: mainClr,
      decoration: InputDecoration(
        fillColor: whiteClr,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: height, horizontal: 10),
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabledBorder: _border(),
        focusedBorder: _border(),
        errorBorder: _border(),
        focusedErrorBorder: _border(),
      ),
    );
  }

  OutlineInputBorder _border() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: const BorderSide(
          color: whiteClr,
          width: 1.5,
        ),
      );
}

class NetworkImageUtil extends StatelessWidget {
  final String imageUrl;
  final double height, width, topLeft, topRight, bottomLeft, bottomRight;

  const NetworkImageUtil(
      {Key? key,
      required this.imageUrl,
      required this.height,
      required this.width,
      this.topRight = 0.0,
      this.topLeft = 0.0,
      this.bottomLeft = 0.0,
      this.bottomRight = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Image.asset(
            'assets/images/loading.png',
            color: Colors.grey.shade300,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(bottomLeft),
            bottomRight: Radius.circular(bottomRight),
            topRight: Radius.circular(topRight),
            topLeft: Radius.circular(topLeft),
          ),
          child: FadeInImage.memoryNetwork(
            height: height,
            width: width,
            image: imageUrl,
            fit: BoxFit.cover,
            placeholder: kTransparentImage,
            placeholderErrorBuilder: (_, value, error) {
              return SizedBox(
                height: height,
                width: width,
                child: const Center(
                  child: Icon(
                    Icons.error,
                    size: 28.0,
                    color: Colors.red,
                  ),
                ),
              );
            },
            imageErrorBuilder: (_, value, error) {
              return SizedBox(
                height: height,
                width: width,
                child: const Center(
                  child: Icon(
                    Icons.error,
                    size: 28.0,
                    color: Colors.red,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class LoadingUtil extends StatelessWidget {
  const LoadingUtil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation<Color>(mainClr)),
    );
  }
}

class ErrorResultUtil extends StatelessWidget {
  const ErrorResultUtil({Key? key, required this.errorResult})
      : super(key: key);
  final ErrorResult errorResult;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              errorResult.image,
              height: 200,
              width: MediaQuery.of(context).size.width * 0.8,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 20),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: Text(
                  errorResult.message,
                  style: const TextStyle(
                    color: whiteClr,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleButtonUtil extends StatelessWidget {
  const CircleButtonUtil(
      {Key? key,
      required this.icon,
      required this.iconColor,
      required this.buttonColor,
      required this.buttonSize,
      required this.iconSize,
      required this.onClick})
      : super(key: key);
  final IconData icon;
  final Color iconColor, buttonColor;
  final double iconSize, buttonSize;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: buttonSize,
        width: buttonSize,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: buttonColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            icon,
            size: iconSize,
            color: iconColor,
          ),
        ),
      ),
      onTap: onClick,
    );
  }
}

class ProductUtil extends StatelessWidget {
  const ProductUtil({
    Key? key,
    required this.product,
    required this.onClick,
  }) : super(key: key);
  final Product product;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(5),
        bottomLeft: Radius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
          ),
          boxShadow: const [
            BoxShadow(
              color: greyClr,
              offset: Offset(1, 1),
              spreadRadius: 0.5,
              blurRadius: 2,
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: NetworkImageUtil(
                imageUrl: product.image,
                height: infinityHeight,
                width: infinityWidth,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: symmetricHorizontalPadding2(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 2),
                    TextUtil(
                      text: product.title,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: blackClr,
                      maxLines: 2,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    TextUtil(
                      text: '${product.price} ${'le'.tr()}',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: mainClr,
                    ),
                    ElevatedButtonUtil(
                      color: mainClr,
                      borderColor: mainClr,
                      radius: 5,
                      size: const Size(infinityWidth, 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextUtil(
                            text: 'add_to_cart'.tr(),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: whiteClr,
                            height: 1,
                          ),
                          Icon(
                            IconBroken.Buy,
                            size: 24.sp,
                            color: whiteClr,
                          ),
                        ],
                      ),
                      onClick: () => context.read<CartViewModel>().addToCart(
                            cartProduct: CartProduct(
                                id: product.id,
                                title: product.title,
                                price: product.price.toString(),
                                image: product.image,
                                quantity: 1),
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showToast({required String message}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      backgroundColor: Colors.black87.withOpacity(0.5),
      fontSize: 16.sp);
}

void onNavigate(BuildContext context,
        {required Widget screen, dynamic arguments}) =>
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));

void onPop(BuildContext context) => Navigator.pop(context);
