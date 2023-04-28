import 'package:compras/bloc/shopping_bloc/shopping_bloc.dart';
import 'package:compras/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class ShoppingCarButton extends StatelessWidget {
  const ShoppingCarButton({super.key});

  @override
  Widget build(BuildContext context) {
    final shoppingProd = BlocProvider.of<ShoppingBloc>( context, listen: true );

    return Container(
      decoration: _buildDecoration(),
      child: Stack(
        children: [
          IconButton(
            splashRadius: 27,
            onPressed: () =>
              NavigationService.navigateTo( 'shopping-car' ), 
            icon: const Icon(Icons.shopping_cart_outlined)),
          
          Positioned(
            top: 5,
            right: 5,
            child: Text( '${shoppingProd.state.items.length}' ))
        ],
      ),
    );
  }

// -----------------------------------------------------
  BoxDecoration _buildDecoration() => const BoxDecoration(
    color: Color( 0xffEBF0F6),
    shape: BoxShape.circle
  );
// -----------------------------------------------------
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~