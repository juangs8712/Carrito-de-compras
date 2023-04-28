import 'package:bloc/bloc.dart';
import 'package:compras/models/product_model.dart';
import 'package:compras/models/shopping_product.dart';
import 'package:meta/meta.dart';

part 'shopping_event.dart';
part 'shopping_state.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class ShoppingBloc extends Bloc<ShoppingEvent, ShoppingState> {

  ShoppingBloc() : super( ShoppingInitialState() ) {
    on< ShoppingAddProductEvent > ( _onShoppingAddProductEvent );
    on< ShoppingIncrementEvent >  ( _onShoppingIncrementEvent );
    on< ShoppingDecrementEvent >  ( _onShoppingDecrementEvent );
    on< ShoppingClearEvent >      ( _onShoppingClearEvent );
  }
  // -----------------------------------------------------
  _onShoppingAddProductEvent( ShoppingAddProductEvent event, Emitter<ShoppingState> emit ){
    Map<int, ShoppingProduct> items = state.items;

    final id = event.product.id;
    final shopProd = ShoppingProduct( 
        product: event.product,
        quantity: 1 );

    // agregar el nuevo producto al carrito si no existe
    if ( items[ id ] == null ) {
      items.addAll( { id : shopProd } );
    } else {
      items[ id ] = shopProd.copyWith( quantity: items[ id ]!.quantity + 1 );
    }

    final double total = getTotal( items );
    emit( ShoppingState(items: items, total: total) );
  }
  // -----------------------------------------------------
  _onShoppingIncrementEvent( ShoppingIncrementEvent event, Emitter<ShoppingState> emit ){
    final items   = state.items;
    final id      = event.product.id;
    final shopProduct = items[ id ]!
      .copyWith( quantity: items[ id ]!.quantity + 1 );


    items[ id ] = shopProduct;
    final total = getTotal( items );
    emit( ShoppingState( items: items, total: total ));
  }
  // -----------------------------------------------------
  _onShoppingDecrementEvent( ShoppingDecrementEvent event, Emitter<ShoppingState> emit ){
    final items   = state.items;
    final id      = event.product.id;
    final shopProduct = items[ id ]!
      .copyWith( quantity: items[ id ]!.quantity - 1 );


    if ( shopProduct.quantity < 1 ) {
      items.remove( id );
    } else {
      items[ id ] = shopProduct; 
    }
    
    final total = getTotal( items );
    emit( ShoppingState( items: items, total: total ));
  }
  // -----------------------------------------------------
  _onShoppingClearEvent( ShoppingClearEvent event, Emitter<ShoppingState> emit){
    state.items.clear();
    emit( ShoppingInitialState() );
  }
  // -----------------------------------------------------
  /// Obtener la suma total a pagar.
  /// 
  /// Se obtiene el total a pagar ya con el porciento de descuento aplicado.
  double getTotal( Map<int, ShoppingProduct> items ){
    double total = 0.0;

    items.forEach((key, value) { 
      final price = value.product.price;
      final discount = value.product.discountPercentage!;

      total += value.quantity * ( price - ( price * discount / 100.0 ));
    });

    return total;
  }
  // -----------------------------------------------------
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~