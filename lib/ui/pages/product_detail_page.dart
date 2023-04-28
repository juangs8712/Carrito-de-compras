
import 'package:flutter/material.dart';

import 'package:compras/models/product_model.dart';

import 'package:compras/ui/pages/product_detail_widgets/product_detail_header.dart';
import 'package:compras/ui/pages/product_detail_widgets/product_desktop_view.dart';
import 'package:compras/ui/pages/product_detail_widgets/product_mobile_view.dart';


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final product  = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // encabezado de la vista
            ProductDetailHeader( title: product.title, ),

            Expanded(
              child: LayoutBuilder(
                builder: ( context, constraints ) {
                  
                  return constraints.maxWidth < constraints.maxHeight
                    ? MobileView(
                        product: product, 
                        decoration: _buildImageDecoration(), 
                        imgHeight: constraints.maxHeight / 2,)
                    : DesktopView(
                        product: product, 
                        decoration: _buildImageDecoration(), 
                        imgWidth: constraints.maxWidth / 2,);
                },
              ),),
          ],
        ),
      ),
    );
  }
  // -----------------------------------------------------
  BoxDecoration _buildImageDecoration() => const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only( bottomRight: Radius.circular( 100 ) ),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        offset: Offset( 1, 1),
        blurRadius: 2
      )
    ]
  );
  // -----------------------------------------------------
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
