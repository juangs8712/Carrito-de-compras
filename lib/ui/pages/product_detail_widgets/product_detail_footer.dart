import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:compras/bloc/shopping_bloc/shopping_bloc.dart';
import 'package:compras/models/product_model.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class ProductDetailFooter extends StatelessWidget {
  const ProductDetailFooter({
    super.key, 
    required this.product
  });

  final Product product;
  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: Alignment.bottomRight,
      child: InkWell(
        child: Container(
          width:  230,
          height: 100,
          decoration: _buildDecoration(),
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const[
              Icon( 
                Icons.add, 
                color: Colors.white,
                size: 30, ),
      
              SizedBox( width: 10,),
              Text(
                'Agregar', 
                style: TextStyle( 
                  color: Colors.white, 
                  fontSize: 25,
                  fontWeight: FontWeight.w500 ),),
          
              
            ],
          ),
        ),
        onTap: (){
          context.read<ShoppingBloc>().add( ShoppingAddProductEvent( product ) );
        },
      ),
    );
  }

  // -----------------------------------------------------
  BoxDecoration _buildDecoration() => const BoxDecoration(
    color: Color( 0xff349898 ),
    boxShadow: [
      BoxShadow( 
        color: Colors.black12,
        blurRadius: 1,
        offset: Offset( 0, -1 ))
    ],
    borderRadius: BorderRadius.only( 
      topLeft:  Radius.circular( 70 ))
  );
  // -----------------------------------------------------
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~