import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:compras/bloc/shopping_bloc/shopping_bloc.dart';
import 'package:compras/services/navigation_service.dart';
import 'package:compras/ui/pages/shopping_car_widgets/round_icon_button.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class ShoppingCarHeader extends StatelessWidget {
  const ShoppingCarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final shoppingCar = BlocProvider.of<ShoppingBloc>( context, listen: true );
    const style = TextStyle( fontSize: 22, fontWeight: FontWeight.w400 );
    
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

                  // titulo de la vista y cantidad de productos en el carrito
                  Expanded(
                    child: Column(
                      children: [
                        const Text( 'Carrito', style: style,),
                        Text('${shoppingCar.state.items.length} Productos'),
                      ],
                    ) ),

                  // boton para limpiar carrito
                  RoundIconButton(
                    iconData: Icons.delete_outline, 
                    backgroundColor: Colors.white, 
                    size: 40, 
                    iconSize: 23,
                    onPressed: () => context.read<ShoppingBloc>()
                      .add( ShoppingClearEvent() ))
                  
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