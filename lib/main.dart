import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:shop_task/src/view/product_details_view/product_details_view.dart';
import 'package:shop_task/utils/helper/dio_helper.dart';
import 'package:shop_task/utils/providers/providers.dart';
import 'src/view/layout_view/layout_view.dart';
import 'utils/helper/cache_helper.dart';
import 'utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await translator.init(
    localeType: LocalizationDefaultType.device,
    languagesList: <String>['ar', 'en'],
    assetsDirectory: 'assets/langs/',
  );
  await CacheHelper.init();
  DioHelper.init();
  ///I GENERATED THIS TO TEST API ONLY
  // CacheHelper.setStringData(key: 'jwt', value: 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiMDIwM2NkYzM0MzJjNDhiNzZjZGFkMTQ1MzI0Mjc1OTZiZGQxNjRkNGJiZjU1M2E1MTkyMWZkZmFkNzgxNDcwMjdhNmY2OGMwMzdhNTFjMmUiLCJpYXQiOjE2NTQyODUyMDYsIm5iZiI6MTY1NDI4NTIwNiwiZXhwIjoxNjg1ODIxMjA2LCJzdWIiOiIxMCIsInNjb3BlcyI6W119.RK4O9HR68n2_alblmoAkQJu9fuRGD36Qqrls5DLNS4yeDIPIF1A-7WlebwWt7AL3AA-ecJgGDWN1o4finVJC2QHHfqKiEYv6nFx8-EE22RcSiMhd0AGroiFQcWD392lLqsEJQT4-0N729Pw4u3La4FdDFg-XwHRgbfWF0G1rEb9V-a52JQ3jJyDszV1vf5KQNTsHYTvybeIpYC8SddKs6IweTEivW9eFDskX9zofgDB5JD3G4brpiQNIvuXPYj-_FXXcQAmWN4XG81iS1SRrVj962kQ-GigzP04IL4Y6Zl_KNTJgUZMaTPo2Qe70Hm9_A34hsv8A7ymnxCaEcuPPqBKb2WRR91795YYHrD11lVfUE9jqDlS68INMvV8uvvR8-ZEcQFrJO6CdeCLIG72hQXmXuebzBoPE30KBMB_sD1tbE7Ixob_kjGHP-tyWPNndq0Kpyd6t9HLTz7BVl_Zw3iFP-iKrMKPTmNfSzZY9SwDEj-ypjG8B0yVIoYqUFjxPp_HOuCmDHMrYV4RoUeIZ5Pk5eXS0HuqCsSeSUWSTrByqqD-NdZ1JUr3qHPKHpaELqqgaSlxQwghHY5VIXFLLlYIlKC-jVe3Z2sGiK4gZTQuEmyuUofGj1QbvcgJT8HdSqpI2LrZQdC7gXLLhnuxDTv93iGPh2EqzGoceRfhKVkg');
  runApp(
    LocalizedApp(
      child: const ShopTask(),
    ),
  );
}

class ShopTask extends StatelessWidget {
  const ShopTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MultiProvider(
          providers: Providers.providers,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Shop task',
            localizationsDelegates: translator.delegates,
            locale: translator.activeLocale,
            supportedLocales: translator.locals(),
            home: const LayoutView(),
            theme: AppTheme().lightTheme,
            builder: (BuildContext context, Widget? widget) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!,
              );
            },
          ),
        );
      },
    );
  }
}
