import 'package:compras/bloc/shopping_bloc/shopping_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class ShoppingCarFooter extends StatelessWidget {
  const ShoppingCarFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final shoppingBloc = BlocProvider.of<ShoppingBloc>(context, listen: true);

    return Container(
      width:  double.infinity,
      height: 175,
      decoration: _buildDecoration(),
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Row(
            children: const [
              Icon( Icons.document_scanner_sharp, color: Color( 0xffFF7643), ),
              Spacer(),
              Text('Cupon de descuento', style: TextStyle( color: Colors.black54 ),),
              SizedBox( width: 10,),
              Icon( Icons.chevron_right)
            ],
          ),

          const SizedBox( height: 25,),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Total:', style: TextStyle( color: Colors.black54 ),),
                  const SizedBox( height: 5,),
                  Text(
                    '\$${ shoppingBloc.state.total.toStringAsFixed(2) }', 
                    style: const TextStyle( 
                      fontSize: 17, 
                      color: Color( 0xffD89A23) ),),
                ],
              ),

              // boton de confirmar
              const Spacer(),
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration( borderRadius: BorderRadius.circular( 7 )),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom( backgroundColor: const Color( 0xff267A82)),
                  onPressed: (){}, 
                  child: const Padding(
                    padding: EdgeInsets.symmetric( horizontal: 40, vertical: 15 ),
                    child: Text(
                      'Confirmar', 
                      style: TextStyle( color: Colors.white, fontSize: 17 ),),
                  )),
              )
            ],
          )
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
        blurRadius: 1,
        offset: Offset( 0, -1 ))
    ],
    borderRadius: BorderRadius.only( 
      topLeft:  Radius.circular( 25 ),
      topRight: Radius.circular( 25 ))
  );
  // -----------------------------------------------------
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~