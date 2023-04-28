import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:compras/bloc/shopping_bloc/shopping_bloc.dart';
import 'package:compras/models/shopping_product.dart';
import 'package:compras/services/navigation_service.dart';

import 'package:compras/ui/pages/product_widgets/image_widget.dart';
import 'package:compras/ui/pages/shopping_car_widgets/round_icon_button.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class ShoppingProductWidget extends StatelessWidget {
  const ShoppingProductWidget({
    super.key, 
    required this.shoppingProduct
  });

  final ShoppingProduct shoppingProduct;
  @override
  Widget build(BuildContext context) {
    final product = shoppingProduct.product;
    final double discount =
      product.discountPercentage != null
        ? product.price - ( product.price * product.discountPercentage! / 100.0 )
        : product.price * 1.0;

    return SizedBox(
      height: 90,
      child: InkWell(
        child: Row(
          children: [
            CustomImageWidget(
              imageUrl: product.images.isNotEmpty 
                ? product.images[0] 
                : null,
              width: 73,
              height: 73,
            ),
          
            const SizedBox( width: 15, ),
          
            Expanded( 
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox( height: 20 ),
                  Expanded(child: Text( product.title, style: const TextStyle( fontSize: 12 ), )),
                  
                  Row(
                    children: [
                      Text( 
                        '\$${ discount.toStringAsFixed(2) }', 
                        style: const TextStyle( fontSize: 14, fontWeight: FontWeight.w700 )),
                    ],
                  ),
      
                  const SizedBox( height: 15 ),
                ],
              )
            ),
          
            // boton de decrementar
            RoundIconButton(
              iconData: Icons.remove, 
              backgroundColor: const Color( 0xffEBF0F6 ), 
              size: 28, 
              iconSize: 13,
              onPressed: () => context.read<ShoppingBloc>()
                .add( ShoppingDecrementEvent( product ) ), ),
          
            Padding(
              padding: const EdgeInsets.symmetric( horizontal: 10 ),
              child: Text( '${shoppingProduct.quantity}' )),
          
            // boton de incrementar
            RoundIconButton(
              iconData: Icons.add, 
              backgroundColor: const Color( 0xffEBF0F6 ), 
              size: 28, 
              iconSize: 13,
              onPressed: () => context.read<ShoppingBloc>()
                .add( ShoppingIncrementEvent( product ) ), ),
          ],
        ),
      onTap: (){
        NavigationService.navigateTo( 'product-detail', arguments: product );
      }
      ),
    );
  }
  // -----------------------------------------------------
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~