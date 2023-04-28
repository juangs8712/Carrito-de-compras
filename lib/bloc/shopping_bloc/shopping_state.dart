part of 'shopping_bloc.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@immutable
class ShoppingState {
  final Map<int, ShoppingProduct> items;
  final double total;

  const ShoppingState({ required this.items, required this.total });

  ShoppingState copyWith({ Map<int, ShoppingProduct>? items, double? total })
    => ShoppingState(
      items: items ?? this.items, 
      total: total ?? this.total, );
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class ShoppingInitialState extends ShoppingState{
  ShoppingInitialState() : super( items: {}, total: 0 );
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
