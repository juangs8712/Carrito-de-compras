
import 'package:compras/bloc/product/product_bloc.dart';
import 'package:compras/ui/pages/product_widgets/search_widget.dart';
import 'package:compras/ui/widgets/navigation_button_widget.dart';
import 'package:flutter/material.dart';

import 'package:compras/ui/pages/product_widgets/categories_widget.dart';
import 'package:compras/ui/pages/product_widgets/product_list_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pBloc = BlocProvider.of<ProductBloc>( context, listen: true );

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: const [
            SearchWidget(),
            
            CategoriesWidget(),

            // const SizedBox( height: 10,),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric( horizontal: 20, vertical: 5),
                child: ProductListWidget(),
              )),
            
            SizedBox( height: 30 )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: 
        NavigationButtonsWidget(
          skip: pBloc.state.skip, 
          total: pBloc.state.total,
          onTapFordward: () => 
            context.read<ProductBloc>()
              .add( ProductForwardEvent() ),
          
          onTapBackward: () => 
            context.read<ProductBloc>().add( ProductBackwardEvent() ), ),
    );
  }
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~