import 'package:flutter/material.dart';

import 'package:compras/models/product_model.dart';
import 'package:compras/ui/pages/product_detail_widgets/detail_widget.dart';
import 'package:compras/ui/pages/product_widgets/image_widget.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class MobileView extends StatelessWidget {
  const MobileView({
    super.key, 
    required this.product, 
    required this.decoration, 
    required this.imgHeight
  });

  final Product product;
  final Decoration decoration;
  final double imgHeight;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Flexible(
          child: CustomImageWidget(
            imageUrl: product.images[ 0 ],
            decoration: decoration,
            height: imgHeight,
            margin: const EdgeInsets.only( bottom: 5 ),
          )
        ),
        
        Flexible( child: DetailWidget( product: product ))
      ],
    );
  }
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
