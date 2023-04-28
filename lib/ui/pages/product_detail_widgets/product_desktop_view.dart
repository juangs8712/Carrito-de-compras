
import 'package:flutter/material.dart';

import 'package:compras/models/product_model.dart';
import 'package:compras/ui/pages/product_detail_widgets/detail_widget.dart';
import 'package:compras/ui/pages/product_widgets/image_widget.dart';
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class DesktopView extends StatelessWidget {
  const DesktopView({
    super.key, 
    required this.product, 
    required this.decoration, 
    required this.imgWidth
  });

  final Product product;
  final Decoration decoration;
  final double imgWidth;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Flexible(
          child: CustomImageWidget(
            imageUrl: product.images[ 0 ],
            decoration: decoration,
            width: imgWidth,
            height: imgWidth,
            margin: const EdgeInsets.only( bottom: 5 ),
          )
        ),
        
        
        Flexible( child: DetailWidget( product: product ))
      ],
    );
  }
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~