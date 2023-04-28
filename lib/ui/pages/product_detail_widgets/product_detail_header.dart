import 'package:flutter/material.dart';

import 'package:compras/services/navigation_service.dart';

import 'package:compras/ui/pages/product_widgets/shopping_car_button.dart';
import 'package:compras/ui/pages/shopping_car_widgets/round_icon_button.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class ProductDetailHeader extends StatelessWidget {
  const ProductDetailHeader({
    super.key, 
    required this.title
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    const style = TextStyle( fontSize: 22, fontWeight: FontWeight.w600 );
    
    return Container( 
              width:  double.infinity,
              decoration: _buildDecoration(),
              padding: const EdgeInsets.symmetric( horizontal: 25, vertical: 5 ),
              child: Row(
                children: [
                  // boton de navegar hacia atras
                  RoundIconButton(
                    iconData: Icons.chevron_left, 
                    backgroundColor: Colors.white, 
                    size: 40, 
                    iconSize: 20,
                    onPressed: () => NavigationService.pop()),
                  
                  const SizedBox( width: 20,),
                  // titulo de la vista
                  Expanded(
                    child: Text( 
                      title, 
                      style: style, 
                      textAlign: TextAlign.center,) ),

                  const SizedBox( width: 20,),
                  const ShoppingCarButton()
                  
                ],
              ),
            );
  }
  // -----------------------------------------------------
  BoxDecoration _buildDecoration() => const BoxDecoration(
    color: Color( 0xffF5F6F9 ),
    boxShadow: [
      BoxShadow( 
        color: Colors.black12, 
        offset: Offset( 0, 1 ),
        blurRadius: 3 ),
    ]
  );
  // -----------------------------------------------------
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~