import 'package:compras/ui/pages/product_widgets/product_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:compras/bloc/product/product_bloc.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        
        // Mostrar el ProgressIndicator
        if ( state.loading ) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              Text( 'Cargando' )
            ],
          );
        }else{
          return ListView.separated(
            physics: const BouncingScrollPhysics(), 
            itemCount: state.items.length, 
            separatorBuilder: ( context, index) => const Divider( color: Colors.black54,), 
            itemBuilder: ( context, index) { 
              return ProductWidget(product: state.items[index] );
             }, );
        }
      },
    );
  }
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~