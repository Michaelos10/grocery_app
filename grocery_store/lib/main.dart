import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'domain/providers/cart_provider.dart';
import 'domain/providers/grocery_provider.dart';
import 'domain/providers/filter_provider.dart';
import 'presentation/screens/splash_screen.dart';
import 'presentation/screens/product_details_screen.dart';
import 'theme/app_theme/app_theme.dart';
import '../../data/data_sources/mock_data.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => GroceryProvider()),
          ChangeNotifierProvider(create: (_) => CartProvider()),
          ChangeNotifierProvider(create: (_) => FilterProvider()),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: 'Grocery App',
        theme: AppTheme.lightTheme,
        home: SplashScreen(),
      ),
    );
  }
}
