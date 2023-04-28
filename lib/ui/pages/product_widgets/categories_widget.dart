import 'package:flutter/material.dart';

import 'package:compras/providers/categories_provider.dart';

import 'package:compras/ui/pages/product_widgets/custom_label_widget.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: _buildDecoration(),
      padding: const EdgeInsets.symmetric( vertical: 10 ),
      child: Row(
        children: [
          const SizedBox( width: 15,),
          const Icon( Icons.menu_outlined, size: 30, ),

          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: FutureBuilder(
                future: CategoryProvider.getCategories(),
                builder: ( context, snapshot) {

                  if ( ! snapshot.hasData ) {
                    return const _LoadingWidget();
                  }else if( snapshot.hasError ){
                    return Text( snapshot.error.toString() );
                  }else{
                    return Row(
                      children: [
                        const CustomLabelWidget( label: 'Todos' ),
                        
                        ...snapshot.data!.map(( category ) 
                        => CustomLabelWidget( label: category )).toList()
                        ],
                    );
                  }
                },
              ),
          )),

          const SizedBox( width: 10,)
          
        ],
      ),
    );
  }

  // -----------------------------------------------------
  BoxDecoration _buildDecoration() => const BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        offset: Offset( 0, 1 ),
        blurRadius: 3
      )
    ]
  );
  // -----------------------------------------------------
}

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const[ 
        CustomLabelWidget( label: 'Todos' ),
        SizedBox( width: 20 ),
        SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator( strokeWidth: 2, )),
      ],
    );
  }
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~