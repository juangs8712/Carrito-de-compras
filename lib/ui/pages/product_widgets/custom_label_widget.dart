import 'package:compras/bloc/product/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class CustomLabelWidget extends StatelessWidget {
  const CustomLabelWidget({
    super.key, 
    required this.label,
  });

  final String label;
  @override
  Widget build(BuildContext context) {
    final pBloc = BlocProvider.of<ProductBloc>( context, listen: true );

    final prettyLabel = '${label[0].toUpperCase()}${label.substring(1)}';
    final bool isSelected = prettyLabel == pBloc.state.category;

    final style = TextStyle( fontWeight: isSelected? FontWeight.w700 : FontWeight.w400 );

    return Container(
      margin: const EdgeInsets.symmetric( horizontal: 10 ),
      child: InkWell(
        onTap: () => context.read<ProductBloc>()
          .add( ProductGetByCatEvent( prettyLabel ) ),

        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if( isSelected )
              Container(
                width: 5,
                height: 5,
                decoration: _buildDecoration(),
              ),
            
            const SizedBox( width: 5, ),
            Text( prettyLabel, style: style, )
          ],
        ),
      ),
    );
  }
  // -----------------------------------------------------
  BoxDecoration _buildDecoration() => const BoxDecoration(
    color: Colors.black,
    shape: BoxShape.circle
  );
  // -----------------------------------------------------
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~