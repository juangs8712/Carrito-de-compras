import 'package:compras/services/navigation_service.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:compras/bloc/shopping_bloc/shopping_bloc.dart';
import 'package:compras/models/product_model.dart';
import 'package:compras/ui/pages/product_widgets/image_widget.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key, 
    required this.product
  });

  final Product product;
  @override
  Widget build(BuildContext context) {
    final double? discount =
      product.discountPercentage != null
        ? product.price - ( product.price * product.discountPercentage! / 100.0 )
        : null;

    return InkWell(
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
                Text( product.title, style: const TextStyle( fontSize: 12 ), ),
                const SizedBox( height: 5,),
    
                Row(
                  children: [
                    Text( 
                      '\$${ discount?.toStringAsFixed(2) ?? product.price }', 
                      style: const TextStyle( fontSize: 14, fontWeight: FontWeight.w700 ), ),
                    
                    const SizedBox( width: 10 ,),
                    if( discount != null )
                      Text(
                        '\$${ product.price }', 
                        style: const TextStyle( 
                          color: Colors.red ,
                          fontSize: 12, 
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                  ],
                )
              ],
            )
          ),
    
          Container(
            width:  40,
            height: 40,
            decoration: _buildDecoration(),
            child: IconButton(
              onPressed: (){
                context.read<ShoppingBloc>()
                  .add( ShoppingAddProductEvent( product ) );
              }, 
              icon: const Icon( Icons.shopping_cart_outlined )),
          )
        ],
      ),

      onTap: (){
        NavigationService.navigateTo( 'product-detail', arguments: product );
      },
    );
  }
  // -----------------------------------------------------
  BoxDecoration _buildDecoration() => BoxDecoration(
    color: const Color( 0xffEBF0F6 ),
    borderRadius: BorderRadius.circular( 7 )
  );
  // -----------------------------------------------------
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~