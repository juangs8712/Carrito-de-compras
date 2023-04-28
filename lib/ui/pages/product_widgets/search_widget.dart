import 'package:compras/bloc/product/product_bloc.dart';
import 'package:compras/ui/pages/product_widgets/shopping_car_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( vertical: 5, horizontal: 30 ),
      height: 60,
    
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: _buildDecoration(),
              child: TextField(
                decoration: _buildInputDecoration(),
                onChanged: ( value ) {
                  context.read<ProductBloc>().add( ProductSearchEvent( value ) );
                },
              ),
            )),
          
          const SizedBox( width: 20,),
          const ShoppingCarButton()
          
        ],
      ),
    );
  }

  // -----------------------------------------------------
  BoxDecoration _buildDecoration() => BoxDecoration(
    color: const Color( 0xffEBF0F6),
    borderRadius: BorderRadius.circular( 10 )
  );
  // -----------------------------------------------------
  InputDecoration _buildInputDecoration() => const InputDecoration(
    border: InputBorder.none,
    contentPadding: EdgeInsets.only( top: 15),
    hintText: 'Buscar producto',
    prefixIcon: Icon( Icons.search ),
      enabledBorder: InputBorder.none,
  );
// -----------------------------------------------------
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~