import 'package:compras/bloc/shopping_bloc/shopping_bloc.dart';
import 'package:compras/ui/pages/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:compras/services/navigation_service.dart';
import 'package:compras/bloc/product/product_bloc.dart';
import 'package:compras/ui/pages/product_page.dart';
import 'package:compras/ui/pages/sopping_car_page.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider( create: (context) => ProductBloc(), lazy: false,),
        BlocProvider( create: (context) => ShoppingBloc(), lazy: false,),
      ],
      child: MaterialApp(
        title: 'Carrito de compras',
        initialRoute: 'products',
        navigatorKey: NavigationService.navigatorKey,
        debugShowCheckedModeBanner: false,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse, 
          PointerDeviceKind.touch, 
          PointerDeviceKind.stylus, 
          PointerDeviceKind.trackpad,
          PointerDeviceKind.unknown,
        },
      ),
      
        routes: {
          'products'       :(context) => const ProductPage(),
          'product-detail' :(context) => const ProductDetailPage(),
          'shopping-car'   :(context) => const ShoppingCarPage(),
        },
      ),
    );
  }
}
// -----------------------------------------------------
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
