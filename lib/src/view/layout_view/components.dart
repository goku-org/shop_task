import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import '../../../utils/icon_broken.dart';
import '../../../utils/theme/colors.dart';
import '../../view_model/layout_view_model/layout_view_model.dart';
import '../shared_components/shared_components.dart';

PreferredSize layoutAppBarWidget(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(80.h),
    child: AppBar(
      backgroundColor: transparentClr,
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: mainClr,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery
                  .of(context)
                  .viewPadding
                  .top + 10.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    IconBroken.Location,
                    color: whiteClr,
                    size: 18.sp,
                  ),
                  TextUtil(
                    text: 'Maadi, New Maadi, Cairo',
                    fontSize: 14.sp,
                    height: 0.8,
                  ),
                ],
              ),
              verticalSpace1(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButtonUtil(
                    icon: Icons.notifications,
                    color: whiteClr,
                    iconSize: 26.sp,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onClick: () {},
                  ),
                  horizontalSpace2(),
                  Expanded(
                    child: TextFieldUtil(
                      controller: TextEditingController(),
                      hint: 'search'.tr(),
                      radius: 15,
                      prefixIcon: Icon(
                        IconBroken.Search,
                        size: 22.sp,
                        color: Colors.grey.shade400,
                      ),
                      suffixIcon: Icon(
                        IconBroken.Filter,
                        size: 22.sp,
                        color: Colors.grey.shade400,
                      ),
                      onChanged: (String? value) {},
                    ),
                  ),
                  horizontalSpace2(),
                  IconButtonUtil(
                    icon: Icons.menu,
                    color: whiteClr,
                    iconSize: 26.sp,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onClick: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget(
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kBottomNavigationBarHeight,
      width: infinityWidth,
      decoration: const BoxDecoration(
        color: mainClr,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(2, 2),
            spreadRadius: 3,
            blurRadius: 5,
          ),
        ],
      ),
      child: Consumer<LayoutViewModel>(
        builder: (context, provider, child) {
          return Row(
            children: [
              BottomNavBarItemWidget(
                icon: IconBroken.Home,
                color: provider.currentPage == 0 ? whiteClr : mainClr,
                onTap: () => provider.onPageChanged(0),
              ),
              BottomNavBarItemWidget(
                icon: IconBroken.Buy,
                color: provider.currentPage == 1 ? whiteClr : mainClr,
                onTap: () => provider.onPageChanged(1),
              ),
              BottomNavBarItemWidget(
                icon: IconBroken.Category,
                color: provider.currentPage == 2 ? whiteClr : mainClr,
                onTap: () => provider.onPageChanged(2),
              ),
              BottomNavBarItemWidget(
                icon: IconBroken.Profile,
                color: provider.currentPage == 3 ? whiteClr : mainClr,
                onTap: () => provider.onPageChanged(3),
              ),
            ],
          );
        },
      ),
    );
  }
}

class BottomNavBarItemWidget extends StatelessWidget {
  const BottomNavBarItemWidget({
    Key? key,
    required this.icon,
    required this.color,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 10),
            Icon(
              icon,
              color: whiteClr,
              size: 30.sp,
            ),
            Container(
              color: color,
              height: 3,
              margin: const EdgeInsets.fromLTRB(15, 5, 15, 2),
            ),
          ],
        ),
      ),
    );
  }
}
