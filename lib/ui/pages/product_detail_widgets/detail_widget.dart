import 'package:flutter/material.dart';

import 'package:compras/models/product_model.dart';
import 'package:compras/ui/pages/product_detail_widgets/product_detail_footer.dart';
import 'package:compras/ui/pages/product_detail_widgets/rating_widget.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class DetailWidget extends StatelessWidget {
  const DetailWidget({
    super.key, 
    required this.product
  });

  final Product product;
  @override
  Widget build(BuildContext context) {
    final double price =
      product.discountPercentage != null
        ? product.price - ( product.price * product.discountPercentage! / 100.0 )
        : product.price * 1.0 ;

    return Column(
      children: [
        Expanded( 
          child: SingleChildScrollView(
            padding: const EdgeInsets.all( 20),
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox( height: 10, width: double.infinity,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('-${product.discountPercentage } %',
                      style: const TextStyle( 
                        color: Colors.red, 
                        fontSize: 25, 
                        fontWeight: FontWeight.w700 )),
                    const SizedBox( width: 10,),
                    const Text( 
                      'US\$', 
                      style: TextStyle( 
                        color: Colors.black87, 
                        fontSize: 15, 
                        fontWeight: FontWeight.w700 )),
                    Text( 
                      price.toStringAsFixed( 2 ), 
                      style: const TextStyle( 
                        color: Colors.black87, 
                        fontSize: 25, 
                        fontWeight: FontWeight.w700 )),
                  ],
                ),

                const Divider(),
                
                const SizedBox(height: 20,),
                RatingWidget( rating: product.rating ),

                const SizedBox(height: 20,),
                const Text( 
                  'Descripción',
                  style: TextStyle( fontSize: 15), ),
                Text( 
                  product.description,
                  style: const TextStyle( 
                    color: Colors.grey, 
                    fontSize: 15, 
                    height: 1.7 ), ),

                const SizedBox( height: 20,),
                    // const Divider( height: 30,),
                const Text( 
                  'En Stock',
                  style: TextStyle( fontSize: 15), ),
                
                Text( 
                  '${product.stock}',
                  style: const TextStyle( 
                    color: Colors.grey, 
                    fontSize: 15, 
                    height: 1.7 ), ),
                
              ],
            ),
          )),
          
        ProductDetailFooter( product: product )
      ],
    );
  }
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
