import 'package:flutter/material.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key, 
    required this.rating,
  });

  final double rating;
  @override
  Widget build(BuildContext context) {
    final itemCount = [ 1, 2, 3, 4, 5];
    return Row(
      children: [
        const Text( 'Rating' ),

        const Spacer(),
        ...itemCount.map(( index ) => 
          index <= rating
            ? Icon(Icons.star, color: Colors.orange.withOpacity( 0.8 ),) 
            : Icon( Icons.star_outline, color: Colors.orange.withOpacity( 0.8 ) ) ).toList(),
        
        const SizedBox( width: 10,),
        Text( rating.toStringAsFixed( 1 ) )
      ],
    );
  }
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~