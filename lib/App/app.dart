import 'package:ecomerce_web/Presentation/Category/Provider/cat_provider.dart';
import 'package:ecomerce_web/Presentation/Category/Provider/category_page_controllers.dart';
import 'package:ecomerce_web/Presentation/Product/Provider/product_page_controllers.dart';
import 'package:ecomerce_web/Presentation/Product/Provider/product_provider.dart';
import 'package:ecomerce_web/Presentation/RenderScreen/Components/render_widget.dart';
import 'package:ecomerce_web/Presentation/SubCategory/Provider/subcat_page_controllers.dart';
import 'package:ecomerce_web/Presentation/SubCategory/Provider/subcat_provider.dart';
import 'package:ecomerce_web/Presentation/SubCategory/subCat_screen.dart';
import 'package:ecomerce_web/Presentation/resources/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:ecomerce_web/Presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RenderWidget(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryPageControllers(),
        ),
        ChangeNotifierProvider(
          create: (context) => SubCategoryPageControllers(),
        ),
        ChangeNotifierProvider(
          create: (context) => SubCategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductPageController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
        initialRoute: routes.dashboard,
        onGenerateRoute: RouteGenerator.getRoute,
      ),
    );
  }
}
