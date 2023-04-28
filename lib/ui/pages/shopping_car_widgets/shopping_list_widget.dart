import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:compras/bloc/shopping_bloc/shopping_bloc.dart';
import 'package:compras/ui/pages/shopping_car_widgets/shopping_product_widget.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class ShoppingListWidget extends StatelessWidget {
  const ShoppingListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingBloc, ShoppingState>(
      builder: ( context, state ) {
        final items = state.items.values.toList();
        
        return items.isEmpty
          ? const Center( child: Text( 'No hay productos en el carrito' ) )
          : ListView.separated(
              physics: const BouncingScrollPhysics(), 
              itemCount: items.length, 
              separatorBuilder: ( context, index) => const Divider( color: Colors.black54,), 
              itemBuilder: ( context, index) { 
                return ShoppingProductWidget( shoppingProduct: items[ index ] );
              },
            );
      },
    );
  }
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~